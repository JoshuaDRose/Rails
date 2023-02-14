VERSION = python3.9

help:
	@echo 'init    - Install dependencies from requirements.txt'
	@echo 'install - download and setup pypy package manager and linters'
	@echo 'lint    - process source code for syntax errors or linting issues'
	@echo 'clean   - remove pycache and build build/dist files'
	@echo 'test    - use unittest and coverage.py to generate test report from tests folder'
	$(call find.functions)

init:
	$(VERSION) -m pip install -r requirements.txt

install:
	$(VERSION) -m pip install --upgrade pip
	$(VERSION) -m pip install setuptools wheel twine
	$(VERSION) -m pip install flake8

lint:
	$(VERSION) -m flake8 src --count --select=E9,F63,F7,F82 --show-source --statistics
	$(VERSION) -m flake8 src --count --exit-zero --statistics

clean:
	rm -rf *.egg-info
	rm -rf build
	rm -rf dist
	rm -rf .pytest_cache
	find . | grep -E "(__pycache__|\.pyc|\.pyo$)" | xargs rm -rf

test:
	$(VERSION) -m coverage run -m unittest tests/*.py

tox:
	$(VERSION) -m tox
