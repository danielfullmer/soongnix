{ filegroup }:
let

#  Generated by android/regen.sh
py3-c-modules-darwin_x86_64 = filegroup {
    name = "py3-c-modules-darwin_x86_64";
    srcs = [
        "Modules/_abc.c"
        "Modules/_asynciomodule.c"
        "Modules/_bisectmodule.c"
        "Modules/_codecsmodule.c"
        "Modules/_collectionsmodule.c"
        "Modules/_contextvarsmodule.c"
        "Modules/_csv.c"
        "Modules/_ctypes/_ctypes.c"
        "Modules/_ctypes/callbacks.c"
        "Modules/_ctypes/callproc.c"
        "Modules/_ctypes/cfield.c"
        "Modules/_ctypes/stgdict.c"
        "Modules/_datetimemodule.c"
        "Modules/_functoolsmodule.c"
        "Modules/_heapqmodule.c"
        "Modules/_io/_iomodule.c"
        "Modules/_io/bufferedio.c"
        "Modules/_io/bytesio.c"
        "Modules/_io/fileio.c"
        "Modules/_io/iobase.c"
        "Modules/_io/stringio.c"
        "Modules/_io/textio.c"
        "Modules/_json.c"
        "Modules/_localemodule.c"
        "Modules/_lsprof.c"
        "Modules/_math.c"
        "Modules/_multiprocessing/multiprocessing.c"
        "Modules/_multiprocessing/posixshmem.c"
        "Modules/_multiprocessing/semaphore.c"
        "Modules/_opcode.c"
        "Modules/_operator.c"
        "Modules/_pickle.c"
        "Modules/_posixsubprocess.c"
        "Modules/_queuemodule.c"
        "Modules/_randommodule.c"
        "Modules/_scproxy.c"
        "Modules/_sre.c"
        "Modules/_stat.c"
        "Modules/_statisticsmodule.c"
        "Modules/_struct.c"
        "Modules/_threadmodule.c"
        "Modules/_tracemalloc.c"
        "Modules/_weakref.c"
        "Modules/_xxsubinterpretersmodule.c"
        "Modules/arraymodule.c"
        "Modules/atexitmodule.c"
        "Modules/binascii.c"
        "Modules/cjkcodecs/_codecs_cn.c"
        "Modules/cjkcodecs/_codecs_hk.c"
        "Modules/cjkcodecs/_codecs_iso2022.c"
        "Modules/cjkcodecs/_codecs_jp.c"
        "Modules/cjkcodecs/_codecs_kr.c"
        "Modules/cjkcodecs/_codecs_tw.c"
        "Modules/cjkcodecs/multibytecodec.c"
        "Modules/cmathmodule.c"
        "Modules/errnomodule.c"
        "Modules/faulthandler.c"
        "Modules/fcntlmodule.c"
        "Modules/grpmodule.c"
        "Modules/hashtable.c"
        "Modules/itertoolsmodule.c"
        "Modules/mathmodule.c"
        "Modules/md5module.c"
        "Modules/mmapmodule.c"
        "Modules/parsermodule.c"
        "Modules/posixmodule.c"
        "Modules/pwdmodule.c"
        "Modules/pyexpat.c"
        "Modules/resource.c"
        "Modules/rotatingtree.c"
        "Modules/selectmodule.c"
        "Modules/sha1module.c"
        "Modules/sha256module.c"
        "Modules/sha512module.c"
        "Modules/signalmodule.c"
        "Modules/socketmodule.c"
        "Modules/symtablemodule.c"
        "Modules/syslogmodule.c"
        "Modules/termios.c"
        "Modules/timemodule.c"
        "Modules/unicodedata.c"
        "Modules/xxsubtype.c"
        "Modules/zlibmodule.c"
    ];
};

in { inherit py3-c-modules-darwin_x86_64; }