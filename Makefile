# seiwm - A fixed, patched, and modified window manager from a sei base 
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c sei.c util.c
OBJ = ${SRC:.c=.o}

all: options sei

options:
	@echo sei build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

sei: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f sei ${OBJ} sei-${VERSION}.tar.gz *.orig *.rej

dist: clean
	mkdir -p sei-${VERSION}
	cp -R LICENSE Makefile README config.mk\
		sei.1 drw.h util.h ${SRC} transient.c sei-${VERSION}
	tar -cf sei-${VERSION}.tar sei-${VERSION}
	gzip sei-${VERSION}.tar
	rm -rf sei-${VERSION}

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin
	install -Dm755 ./sei ${DESTDIR}${PREFIX}/bin
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < sei.1 > ${DESTDIR}${MANPREFIX}/man1/sei.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/sei.1
	mkdir -p ${DESTDIR}${PREFIX}/share/sei

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/sei\
		${DESTDIR}${MANPREFIX}/man1/sei.1

.PHONY: all options clean dist install uninstall
