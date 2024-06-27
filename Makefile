.PHONY: format doc analyze info test publish coverage code

# Format the Dart code using dart_style package
# https://pub.dev/packages/dart_style/install
format:
	dart format .

# Generate documentation using dartdoc package
# https://pub.dev/packages/dartdoc
doc:
	dart doc .

# Analyze the Dart code to find issues and warnings
analyze:
	dart analyze

# Display information about the Dart project
info:
	dart info

# Run all tests in the Dart project
test:
	dart test

# Publish the Dart package to pub.dev
publish:
	dart pub publish

# Generate test coverage report using the coverage package
coverage:
	dart pub global run coverage:test_with_coverage

# Count lines of code in the lib and test directories using cloc
code:
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