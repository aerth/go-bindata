NAME=go-bindata

${NAME}:
	go build -o ${NAME} -v ./cmd/go-bindata
	@sha256sum ${NAME}
	@ls -l ${NAME}
	@file ${NAME}

test:
	make -C testdata

.PHONY: ${NAME}
