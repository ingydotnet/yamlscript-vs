SHELL := bash

PAGE := yamlscript-vs.md

ROOT := $(shell pwd)

export PATH := $(ROOT)/bin:$(PATH)
export YSPATH := $(ROOT)/lib


default:

build: $(PAGE)

$(PAGE): bin/ysvs Makefile
	ysvs > $@

gist: $(PAGE)
	@git hub gist-new \
	  secret '' $< | \
	  grep 'Page' | \
	  awk '{print $$3}'

clean:
	$(RM) $(PAGE)

realclean: clean

disclean: realclean
	$(RM) -r exercism

$(PAGE):

