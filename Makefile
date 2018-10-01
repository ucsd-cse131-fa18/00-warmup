STACK=stack

UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
  FORMAT=aout
else
ifeq ($(UNAME), Darwin)
  FORMAT=macho
endif
endif

COURSE=cs131f
ASGN=00
COMPILER=warmup

test: clean
	$(STACK) test 

bin:
	$(STACK) build

clean: 
	$(STACK) clean

distclean: clean 
	rm -rf .stack-work 

tags:
	hasktags -x -c lib/

turnin: 
	git commit -a -m "turnin"
	git push origin master

upstream:
	git remote add upstream https://github.com/ucsd-cse131-fa18/00-warmup.git

update:
	git pull upstream master
