FILES:=$(wildcard out/*.go)

.PHONY: check
check: errcheck $(FILES:.go=.checked) cleanup

out/%.checked: out/%.go
	errcheck $<
	go vet --all $<
	# go vet --shadow $<
	# golint $<
	# git status

cleanup:
	git checkout out
$(GOPATH)/bin/go-bindata: $(wildcard ../*.go) $(wildcard ../**/*.go)
	go install ../cmd/go-bindata

out: 
	mkdir out
out/compress-memcopy.go: 		 $(wildcard in/**/*) $(GOPATH)/bin/go-bindata
	$(GOPATH)/bin/go-bindata                        -o $@ in/...

out/compress-nomemcopy.go: 	 $(wildcard in/**/*) $(GOPATH)/bin/go-bindata
	$(GOPATH)/bin/go-bindata -nomemcopy             -o $@ in/...

out/debug.go: 							 $(wildcard in/**/*) $(GOPATH)/bin/go-bindata
	$(GOPATH)/bin/go-bindata -debug                 -o $@ in/...

out/nocompress-memcopy.go:   $(wildcard in/**/*) $(GOPATH)/bin/go-bindata
	$(GOPATH)/bin/go-bindata -nocompress            -o $@ in/...

out/nocompress-nomemcopy.go: $(wildcard in/**/*) $(GOPATH)/bin/go-bindata
	$(GOPATH)/bin/go-bindata -nocompress -nomemcopy -o $@ in/...

errcheck:
	go get github.com/kisielk/errcheck

