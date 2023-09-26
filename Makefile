all: build

./node_modules:
	npm install --build-from-source

build: ./node_modules
	./node_modules/.bin/node-pre-gyp build -j max --loglevel=silent

debug: ./node_modules
	./node_modules/.bin/node-pre-gyp build -j max --debug --verbose

clean:
	@rm -rf ./build
	rm -rf lib/binding/
	rm -f test/support/big.db-journal
	rm -rf ./node_modules/
	rm -rf src/duckdb/
	rm -f binding.gyp

complete_build:
	npm install

test:
	npm test

check: test

.PHONY: test clean build