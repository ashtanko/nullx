.PHONY: format doc analyze info test

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
