RM:=rm -f
CP:=cp
CHMOD=chmod
MKDIR:=mkdir -p
TAR:=/bin/tar
ELBE_DIR:=/data/project/project/elbe/initvm

elbe: raspberry-payload.xml
	elbe initvm submit --directory ${ELBE_DIR} raspberry-payload.xml

raspberry-payload.xml: raspberry.xml archive.tbz
	${CP} raspberry.xml raspberry-payload.xml
	elbe chg_archive raspberry-payload.xml archive.tbz

archive.tbz: gencfg cmdline.txt
	${RM} -r archivedir
	${MKDIR} archivedir/bin
	${MKDIR} archivedir/boot
	${CP} gencfg archivedir/bin
	${CP} cmdline.txt archivedir/boot
	${CHMOD} a+x archivedir/bin/gencfg
	cd archivedir && fakeroot ${TAR} cvjf ../archive.tbz .

clean:
	${RM} -r archivedir
	${RM} archive.tbz raspberry-payload.xml

.PHONY: elbe clean
