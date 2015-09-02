PYVERSION=2.7
PYPREFIX=/usr
INCLUDES=-I$(PYPREFIX)/include/python$(PYVERSION)

all: setup agent.o agent
	mkdir dist
	cp agent dist
	cp *.so dist

agent: agent.o
	gcc -o $@ $^ -lpython$(PYVERSION)

agent.o: agent.py
	@cython agent.py --embed
	gcc -c agent.c $(INCLUDES)

setup: setup.py
	@python setup.py build_ext --inplace

clean-so:
	@rm -f *.so

clean:
	@rm -f *.o *.c *.pyc
	@rm -rf build

clean-all: clean clean-so
	@rm -f agent
