
test:
	# Open your default browser with the test page
	open test/unit/index.html

install:
	git submodule init
	git submodule update
	npm install

.PHONY: test
