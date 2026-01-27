BLUE='\033[0;34m'
NC='\033[0m' # No Color

test:
	@pytest

lint-old:
	@echo "\n${BLUE}Running Pylint against source and test files...${NC}\n"
	@pylint ./src --fail-on=E,W
	@echo "\n${BLUE}Running Flake8 against source and test files...${NC}\n"
	@flake8
	@echo "\n${BLUE}Running Bandit against source files...${NC}\n"
	@bandit -c pyproject.toml -r .

lint:
	@python3 -m venv .venv
	@.venv/bin/python -m pip install pre-commit
	@echo "\n${BLUE}Running pre-commit against source and test files...${NC}\n"
	@.venv/bin/pre-commit run --all-files

clean:
	rm -rf .pytest_cache .coverage .pytest_cache coverage.xml coverage_html_report

.PHONY: clean test