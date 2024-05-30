.PHONY: format doc analyze info test publish coverage

# https://pub.dev/packages/dart_style/install
format:
	dart format .

# https://pub.dev/packages/dartdoc
doc:
	dart doc .

analyze:
	dart analyze

info:
	dart info

test:
	dart test

publish:
	dart pub publish

coverage:
    dart pub global run coverage:test_with_coverage