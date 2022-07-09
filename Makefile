NAME=go-bindata

${NAME}: *.go cmd/go-bindata/*.go
	go build -o ${NAME} -v ./cmd/go-bindata
	@file ${NAME}
	@sha256sum ${NAME}
	@ls -l ${NAME}

test: ${NAME}
	mkdir -p tmpgo/bin/
	cp ${NAME} tmpgo/bin/${NAME}
	env GOPATH=$(shell pwd)/tmpgo/ make -C testdata
	env GOPATH=$(shell pwd)/tmpgo/ go clean -modcache
	rm -rf tmpgo
	@echo test passed

install: ${NAME}
	install ${NAME} /usr/local/bin/