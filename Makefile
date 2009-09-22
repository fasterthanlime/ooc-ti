.PHONY:all clean

all: clean
	OOC_SDK=ti-sdk/ ooc showimg.ooc -sourcepath=source/ -gcc=tigcc -nogc && mv *.89z *.9xz bin/

clean:
	rm -rf ooc_tmp *.89z *.9xz
