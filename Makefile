# Makefile for python code
# 
# > make help
#
# The following commands can be used.
#
# init:  sets up environment and installs requirements
# install:  Installs development requirments
# format:  Formats the code with autopep8
# lint:  Runs flake8 on src, exit if critical rules are broken
# clean:  Remove build and cache files
# env:  Source venv and environment files for testing
# leave:  Cleanup and deactivate venv
# test:  Run pytest
# run:  Executes the logic

VENV_PATH='env/bin/activate'
ENVIRONMENT_VARIABLE_FILE='.env'
DOCKER_NAME=$DOCKER_NAME
DOCKER_TAG=$DOCKER_TAG

define find.functions
@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
endef

help:
	@echo 'The following commands can be used.'
	@echo ''
	$(call find.functions)


init:
	python3.9 -m pip install -r requirements.txt

install:
	python3.9 -m pip install --upgrade pip
	python3.9 -m pip install setuptools wheel twine
	python3.9 -m pip install flake8

lint:
	# stop the build if there are Python syntax errors or undefined names
	python3.9 -m flake8 src --count --select=E9,F63,F7,F82 --show-source --statistics
	# exit-zero treats all errors as warnings. The GitHub editor is 127 chars wide
	python3.9 -m flake8 src --count --exit-zero --statistics

package: clean
	python3 setup/setup.py sdist bdist_wheel

upload-test: package
	python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/* --non-interactive --verbose

upload: package
	python3 -m twine upload dist/* --non-interactive

clean:
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist
	rm -rf .pytest_cache
	# Remove pycache
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

env:
	python3.9 -m venv env
	source $(VENV_PATH)
	source $(ENVIRONMENT_VARIABLE_FILE)

leave: ## Cleanup and deactivate venv
leave: clean
	deactivate

test:
	python3.9 -m coverage run -m unittest tests/*.py

build:
	docker build -t $(DOCKER_NAME):$(DOCKER_TAG) -f docker/Dockerfile .

create: build
	docker create -it --name $(DOCKER_NAME) $(DOCKER_NAME):$(DOCKER_TAG)

start: build
	docker start $(DOCKER_NAME)

run: start
	docker run -it $(DOCKER_NAME):$(DOCKER_TAG)

exec: start
	docker exec -it $(DOCKER_NAME) python
