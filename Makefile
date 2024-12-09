# Detect the operating system
ifeq ($(OS),Windows_NT)
    PYTHON = .venv\Scripts\python.exe
    PIP = .venv\Scripts\pip.exe
else
    PYTHON = .venv/bin/python
    PIP = .venv/bin/pip
endif

build:
	virtualenv venv
	$(PIP) install -e .
	$(PIP) install -r requirements_dev.txt

test:
	$(PYTHON) setup.py test

coverage:
	$(PYTHON) setup.py test --cov

clean:
	@rm -rf .Python MANIFEST build dist venv* *.egg-info *.egg
	@find . -type f -name "*.py[co]" -delete
	@find . -type d -name "__pycache__" -delete

run-flask:
	$(PYTHON) flaskapp.py

.PHONY: build clean coverage test run-flask