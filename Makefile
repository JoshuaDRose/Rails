VERSION := python3.9

help:
	@echo 'init    - Install dependencies from requirements.txt'
	@echo 'install - download and setup pypy package manager and linters'
	@echo 'lint    - process source code for syntax errors or linting issues'
	@echo 'clean   - remove pycache and build build/dist files'
	@echo 'test    - use unittest and coverage.py to generate test report from tests folder'
	$(call find.functions)

init:
	${filename} -m pip install -r requirements.txt

install:
	${filename} -m pip install --upgrade pip
	${filename} -m pip install setuptools wheel twine
	${filename} -m pip install flake8

lint:
	${filename} -m flake8 src --count --select=E9,F63,F7,F82 --show-source --statistics
	${filename} -m flake8 src --count --exit-zero --statistics

clean:
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist
	rm -rf .pytest_cache
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

test:
	${filename} -m coverage run -m unittest tests/*.py

tox:
	${filename} -m tox
