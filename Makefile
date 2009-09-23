.PHONY:all clean

TEST_LIST=showimg.ooc hiworld.ooc ball.ooc sprite.ooc fusee.ooc mario.ooc

all: clean
	OOC_SDK=ti-sdk/ ooc ${TEST_LIST} -sourcepath=source/ -gcc=tigcc -nogc && mv *.89z *.9xz bin/

clean:
	rm -rf ooc_tmp *.89z *.9xz
