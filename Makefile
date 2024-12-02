.PHONY: format fmt doc d analyze a info i test t publish p coverage cvg code cd

# Format the Dart code using dart_style package
# https://pub.dev/packages/dart_style/install
format fmt:
	dart format .

# Generate documentation using dartdoc package
# https://pub.dev/packages/dartdoc
doc d:
	dart doc .

# Analyze the Dart code to find issues and warnings
analyze a:
	dart analyze

# Display information about the Dart project
info f:
	dart info

# Run all tests in the Dart project
test t:
	dart test

# Publish the Dart package to pub.dev
publish p:
	dart pub publish

# Generate test coverage report using the coverage package
coverage cvg:
	dart pub global run coverage:test_with_coverage

# Count lines of code in the lib and test directories using cloc
code cd:
	cloc lib test

all:
	@echo "Available tasks:"
	@echo " - format: format the Dart code using dart_style package"
	@echo " - doc: generate documentation using dartdoc package"
	@echo " - analyze: analyze the Dart code to find issues and warnings"
	@echo " - info: display information about the Dart project"
	@echo " - test: run all tests in the Dart project"
	@echo " - publish: publish the Dart package to pub.dev"
	@echo " - coverage: generate test coverage report using the coverage package"
	@echo " - code: count lines of code in the lib and test directories using cloc"