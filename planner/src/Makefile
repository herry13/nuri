.PHONY: build clean clean-all dist

NAME=planner
COMPILER=clang++ -O3 -std=c++11

build: planner

planner: planner.cc
	$(COMPILER) -o $(NAME) planner.cc

test: clean planner
	./fd test.sas

clean:
	rm -f $(NAME)
