{ cc_binary, cc_defaults, cc_library_host_static, cc_library_static, python_binary_host }:
let

#  Copyright 2017 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

subdirs = [
    "Lib"
];

py2-interp-defaults = cc_defaults {
    name = "py2-interp-defaults";
    cflags = [
        "-fwrapv"
        "-O3"
        "-Wall"
        "-Wstrict-prototypes"
        "-DPy_BUILD_CORE"
        "-Werror"
        "-Wno-invalid-source-encoding"
        "-Wno-int-conversion"
        "-Wno-missing-field-initializers"
        "-Wno-null-pointer-arithmetic"
        "-Wno-register"
        "-Wno-shift-count-overflow"
        "-Wno-sign-compare"
        "-Wno-tautological-compare"
        "-Wno-tautological-constant-out-of-range-compare"
        "-Wno-unused-parameter"
        "-Wno-unused-result"
    ];
    local_include_dirs = ["Include"];
    target = {
        android_arm = {
            local_include_dirs = ["android_arm/pyconfig"];
        };
        android_arm64 = {
            local_include_dirs = ["android_arm64/pyconfig"];
        };
        android_x86 = {
            local_include_dirs = ["android_x86/pyconfig"];
        };
        linux_bionic = {
            #  NB linux_bionic is a 'host' architecture but it uses the bionic libc like 'android'
            #  targets so use the android pyconfig.
            local_include_dirs = ["android_x86_64/pyconfig"];
        };
        android_x86_64 = {
            local_include_dirs = ["android_x86_64/pyconfig"];
        };
        #  Regenerate include dirs with android_regen.sh
        darwin_x86_64 = {
            local_include_dirs = ["darwin_x86_64/pyconfig"];
            cflags = [
                "-Wno-deprecated-declarations"
                "-Wno-pointer-arith"
            ];
        };
        linux_glibc_x86 = {
            enabled = false;
        };
        linux_glibc_x86_64 = {
            local_include_dirs = ["linux_x86_64/pyconfig"];
            cflags = ["-Werror"];
        };
        windows = {
            enabled = false;
        };
    };
    host_supported = true;
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
};

py2-interp-parser = cc_library_static {
    name = "py2-interp-parser";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Parser/acceler.c"
        "Parser/bitset.c"
        "Parser/firstsets.c"
        "Parser/grammar.c"
        "Parser/grammar1.c"
        "Parser/listnode.c"
        "Parser/metagrammar.c"
        "Parser/myreadline.c"
        "Parser/node.c"
        "Parser/parser.c"
        "Parser/parsetok.c"
        "Parser/pgen.c"
        "Parser/tokenizer.c"
    ];
};

py2-interp-object = cc_library_static {
    name = "py2-interp-object";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Objects/abstract.c"
        "Objects/boolobject.c"
        "Objects/bufferobject.c"
        "Objects/bytes_methods.c"
        "Objects/bytearrayobject.c"
        "Objects/capsule.c"
        "Objects/cellobject.c"
        "Objects/classobject.c"
        "Objects/cobject.c"
        "Objects/codeobject.c"
        "Objects/complexobject.c"
        "Objects/descrobject.c"
        "Objects/enumobject.c"
        "Objects/exceptions.c"
        "Objects/genobject.c"
        "Objects/fileobject.c"
        "Objects/floatobject.c"
        "Objects/frameobject.c"
        "Objects/funcobject.c"
        "Objects/intobject.c"
        "Objects/iterobject.c"
        "Objects/listobject.c"
        "Objects/longobject.c"
        "Objects/dictobject.c"
        "Objects/memoryobject.c"
        "Objects/methodobject.c"
        "Objects/moduleobject.c"
        "Objects/object.c"
        "Objects/obmalloc.c"
        "Objects/rangeobject.c"
        "Objects/setobject.c"
        "Objects/sliceobject.c"
        "Objects/stringobject.c"
        "Objects/structseq.c"
        "Objects/tupleobject.c"
        "Objects/typeobject.c"
        "Objects/weakrefobject.c"
        "Objects/unicodeobject.c"
        "Objects/unicodectype.c"
    ];
};

py2-interp-python = cc_library_static {
    name = "py2-interp-python";
    defaults = ["py2-interp-defaults"];
    target = {
        linux = {
            cflags = [
                "-DPLATFORM=\"linux2\""
            ];
        };
        darwin_x86_64 = {
            cflags = [
                "-DPLATFORM=\"darwin\""
            ];
        };
    };
    srcs = [
        "Python/_warnings.c"
        "Python/Python-ast.c"
        "Python/asdl.c"
        "Python/ast.c"
        "Python/bltinmodule.c"
        "Python/ceval.c"
        "Python/compile.c"
        "Python/codecs.c"
        "Python/errors.c"
        "Python/frozen.c"
        "Python/frozenmain.c"
        "Python/future.c"
        "Python/getargs.c"
        "Python/getcompiler.c"
        "Python/getcopyright.c"
        "Python/getplatform.c"
        "Python/getversion.c"
        "Python/graminit.c"
        "Python/import.c"
        "Python/importdl.c"
        "Python/marshal.c"
        "Python/modsupport.c"
        "Python/mystrtoul.c"
        "Python/mysnprintf.c"
        "Python/peephole.c"
        "Python/pyarena.c"
        "Python/pyctype.c"
        "Python/pyfpe.c"
        "Python/pymath.c"
        "Python/pystate.c"
        "Python/pythonrun.c"
        "Python/random.c"
        "Python/structmember.c"
        "Python/symtable.c"
        "Python/sysmodule.c"
        "Python/traceback.c"
        "Python/getopt.c"
        "Python/pystrcmp.c"
        "Python/pystrtod.c"
        "Python/dtoa.c"
        "Python/formatter_unicode.c"
        "Python/formatter_string.c"
        "Python/dynload_shlib.c"
        "Python/thread.c"
    ];
};

py2-launcher-defaults = cc_defaults {
    name = "py2-launcher-defaults";
    defaults = ["py2-interp-defaults"];
    cflags = [
        "-DVERSION=\"2.7\""
        "-DVPATH=\"\""
        "-DPREFIX=\"\""
        "-DEXEC_PREFIX=\"\""
        "-DPYTHONPATH=\"..:\""
        "-DANDROID_SKIP_ZIP_PATH"
        "-DANDROID_SKIP_EXEC_PREFIX_PATH"
        "-DANDROID_LIB_PYTHON_PATH=\"internal/stdlib\""
        "-DDATE=\"Dec 31 1969\""
        "-DTIME=\"23:59:59\""
    ];
    static_libs = [
        "libbase"
        "libcrypto_static"
        "libexpat"
        "liblog"
        "libssl"
        "libz"
    ];
    target = {
        linux_glibc_x86_64 = {
            host_ldlibs = ["-lutil"];
        };
        darwin = {
            host_ldlibs = [
                "-framework SystemConfiguration"
                "-framework CoreFoundation"
            ];
        };
        host = {
            static_libs = ["libsqlite"];
        };
        #  Use shared libsqlite for device side, otherwise
        #  the executable size will be really huge.
        android = {
            shared_libs = ["libsqlite"];
        };
    };
};

py2-launcher-lib = cc_library_static {
    name = "py2-launcher-lib";
    defaults = ["py2-launcher-defaults"];
    srcs = [
        "Modules/gcmodule.c"
        "Modules/getpath.c"
        "Modules/config.c"
        "Modules/getbuildinfo.c"
        #  Default built-in extension py2-c-modules.
        "Modules/threadmodule.c"
        "Modules/signalmodule.c"
        "Modules/posixmodule.c"
        "Modules/errnomodule.c"
        "Modules/pwdmodule.c"
        "Modules/_sre.c"
        "Modules/_codecsmodule.c"
        "Modules/_weakref.c"
        "Modules/zipimport.c"
        "Modules/symtablemodule.c"
        "Modules/main.c"
    ];
    #  NOTE: Please update Modules/config.c if new lib get added in the static_libs.
    whole_static_libs = [
        #  Be careful the order of these three static libraries below due to
        #  missing symbols issues.
        "py2-interp-object"
        "py2-interp-python"
        "py2-interp-parser"
        "py2-c-module-array"
        "py2-c-module-cmath"
        "py2-c-module-math"
        "py2-c-module-_struct"
        "py2-c-module-time"
        "py2-c-module-operator"
        "py2-c-module-_testcapi"
        "py2-c-module-_random"
        "py2-c-module-_collections"
        "py2-c-module-_heapq"
        "py2-c-module-itertools"
        "py2-c-module-strop"
        "py2-c-module-_functools"
        "py2-c-module-datetime"
        "py2-c-module-_bisect"
        "py2-c-module-unicodedata"
        "py2-c-module-_io"
        "py2-c-module-fcntl"
        "py2-c-module-select"
        "py2-c-module-mmap"
        "py2-c-module-_csv"
        "py2-c-module-_socket"
        "py2-c-module-termios"
        "py2-c-module-_ssl"
        "py2-c-module-_md5"
        "py2-c-module-_sha"
        "py2-c-module-_sha256"
        "py2-c-module-_sha512"
        "py2-c-module-binascii"
        "py2-c-module-parser"
        "py2-c-module-cStringIO"
        "py2-c-module-cPickle"
        "py2-c-module-xxsubtype"
        "py2-c-module-future_builtins"
        "py2-c-module-_json"
        "py2-c-module-_hotshot"
        "py2-c-module-_lsprof"
        "py2-c-module-grp"
        "py2-c-module-syslog"
        "py2-c-module-audioop"
        "py2-c-module-resource"
        "py2-c-module-_multibytecodec"
        "py2-c-module-_codecs_kr"
        "py2-c-module-_codecs_jp"
        "py2-c-module-_codecs_cn"
        "py2-c-module-_codecs_tw"
        "py2-c-module-_codecs_hk"
        "py2-c-module-_codecs_iso2022"
        "py2-c-module-_multiprocessing"
        "py2-c-module-zlib"
        "py2-c-module-pyexpat"
        "py2-c-module-_sqlite3"
        "py2-c-module-_ctypes_test"
        "py2-c-module-_ctypes"
    ];
    target = {
        darwin = {
            whole_static_libs = ["py2-c-module-_scproxy"];
        };
    };
};

py2-launcher = cc_binary {
    name = "py2-launcher";
    defaults = ["py2-launcher-defaults"];
    srcs = ["Launcher/launcher_main.cpp"];
    static_libs = ["py2-launcher-lib"];
};

py2-launcher-autorun = cc_binary {
    name = "py2-launcher-autorun";
    defaults = ["py2-launcher-defaults"];
    srcs = ["Launcher/launcher_main.cpp"];
    static_libs = ["py2-launcher-lib"];
    cflags = ["-DANDROID_AUTORUN"];
};

py2-cmd = python_binary_host {
    name = "py2-cmd";
    autorun = false;
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

#  Enabled extension py2-c-modules.

py2-c-module-array = cc_library_static {
    name = "py2-c-module-array";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/arraymodule.c"
    ];
};

py2-c-module-cmath = cc_library_static {
    name = "py2-c-module-cmath";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/cmathmodule.c"
        "Modules/_math.c"
    ];
};

py2-c-module-math = cc_library_static {
    name = "py2-c-module-math";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/mathmodule.c"
        "Modules/_math.c"
    ];
};

py2-c-module-_struct = cc_library_static {
    name = "py2-c-module-_struct";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_struct.c"
    ];
};

py2-c-module-time = cc_library_static {
    name = "py2-c-module-time";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/timemodule.c"
    ];
};

py2-c-module-operator = cc_library_static {
    name = "py2-c-module-operator";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/operator.c"
    ];
};

py2-c-module-_testcapi = cc_library_static {
    name = "py2-c-module-_testcapi";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_testcapimodule.c"
    ];
};

py2-c-module-_random = cc_library_static {
    name = "py2-c-module-_random";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_randommodule.c"
    ];
};

py2-c-module-_collections = cc_library_static {
    name = "py2-c-module-_collections";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_collectionsmodule.c"
    ];
};

py2-c-module-_heapq = cc_library_static {
    name = "py2-c-module-_heapq";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_heapqmodule.c"
    ];
};

py2-c-module-itertools = cc_library_static {
    name = "py2-c-module-itertools";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/itertoolsmodule.c"
    ];
};

py2-c-module-strop = cc_library_static {
    name = "py2-c-module-strop";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/stropmodule.c"
    ];
};

py2-c-module-_functools = cc_library_static {
    name = "py2-c-module-_functools";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_functoolsmodule.c"
    ];
};

py2-c-module-datetime = cc_library_static {
    name = "py2-c-module-datetime";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/datetimemodule.c"
    ];
};

py2-c-module-_bisect = cc_library_static {
    name = "py2-c-module-_bisect";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_bisectmodule.c"
    ];
};

py2-c-module-unicodedata = cc_library_static {
    name = "py2-c-module-unicodedata";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/unicodedata.c"
    ];
};

py2-c-module-_io = cc_library_static {
    name = "py2-c-module-_io";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_io/bufferedio.c"
        "Modules/_io/bytesio.c"
        "Modules/_io/fileio.c"
        "Modules/_io/iobase.c"
        "Modules/_io/_iomodule.c"
        "Modules/_io/stringio.c"
        "Modules/_io/textio.c"
    ];
    local_include_dirs = [
        "Modules/_io"
    ];
};

py2-c-module-fcntl = cc_library_static {
    name = "py2-c-module-fcntl";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/fcntlmodule.c"
    ];
};

py2-c-module-select = cc_library_static {
    name = "py2-c-module-select";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/selectmodule.c"
    ];
};

py2-c-module-mmap = cc_library_static {
    name = "py2-c-module-mmap";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/mmapmodule.c"
    ];
};

py2-c-module-_csv = cc_library_static {
    name = "py2-c-module-_csv";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_csv.c"
    ];
};

py2-c-module-_socket = cc_library_static {
    name = "py2-c-module-_socket";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/socketmodule.c"
        "Modules/timemodule.c"
    ];
};

py2-c-module-termios = cc_library_static {
    name = "py2-c-module-termios";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/termios.c"
    ];
};

py2-c-module-_ssl = cc_library_static {
    name = "py2-c-module-_ssl";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/_ssl.c"];
    cflags = ["-Wno-incompatible-pointer-types-discards-qualifiers"];
    static_libs = [
        "libssl"
        "libcrypto_static"
    ];
};

py2-c-module-_md5 = cc_library_static {
    name = "py2-c-module-_md5";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/md5module.c"
        "Modules/md5.c"
    ];
};

py2-c-module-_sha = cc_library_static {
    name = "py2-c-module-_sha";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/shamodule.c"
    ];
};

py2-c-module-_sha256 = cc_library_static {
    name = "py2-c-module-_sha256";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/sha256module.c"
    ];
};

py2-c-module-_sha512 = cc_library_static {
    name = "py2-c-module-_sha512";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/sha512module.c"
    ];
};

py2-c-module-binascii = cc_library_static {
    name = "py2-c-module-binascii";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/binascii.c"
    ];
};

py2-c-module-parser = cc_library_static {
    name = "py2-c-module-parser";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/parsermodule.c"
    ];
};

py2-c-module-cStringIO = cc_library_static {
    name = "py2-c-module-cStringIO";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/cStringIO.c"
    ];
};

py2-c-module-cPickle = cc_library_static {
    name = "py2-c-module-cPickle";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/cPickle.c"
    ];
};

py2-c-module-xxsubtype = cc_library_static {
    name = "py2-c-module-xxsubtype";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/xxsubtype.c"
    ];
};

py2-c-module-future_builtins = cc_library_static {
    name = "py2-c-module-future_builtins";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/future_builtins.c"
    ];
};

py2-c-module-_json = cc_library_static {
    name = "py2-c-module-_json";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_json.c"
    ];
};

py2-c-module-_hotshot = cc_library_static {
    name = "py2-c-module-_hotshot";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_hotshot.c"
    ];
};

py2-c-module-_lsprof = cc_library_static {
    name = "py2-c-module-_lsprof";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_lsprof.c"
        "Modules/rotatingtree.c"
    ];
};

py2-c-module-grp = cc_library_static {
    name = "py2-c-module-grp";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/grpmodule.c"
        "Modules/rotatingtree.c"
    ];
};

py2-c-module-syslog = cc_library_static {
    name = "py2-c-module-syslog";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/syslogmodule.c"
    ];
};

py2-c-module-audioop = cc_library_static {
    name = "py2-c-module-audioop";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/audioop.c"
    ];
};

py2-c-module-resource = cc_library_static {
    name = "py2-c-module-resource";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/resource.c"
    ];
};

py2-c-module-_multibytecodec = cc_library_static {
    name = "py2-c-module-_multibytecodec";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/cjkcodecs/multibytecodec.c"
    ];
};

py2-c-module-_codecs_kr = cc_library_static {
    name = "py2-c-module-_codecs_kr";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_kr.c"];
};

py2-c-module-_codecs_jp = cc_library_static {
    name = "py2-c-module-_codecs_jp";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_jp.c"];
};

py2-c-module-_codecs_cn = cc_library_static {
    name = "py2-c-module-_codecs_cn";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_cn.c"];
};

py2-c-module-_codecs_tw = cc_library_static {
    name = "py2-c-module-_codecs_tw";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_tw.c"];
};

py2-c-module-_codecs_hk = cc_library_static {
    name = "py2-c-module-_codecs_hk";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_hk.c"];
};

py2-c-module-_codecs_iso2022 = cc_library_static {
    name = "py2-c-module-_codecs_iso2022";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/cjkcodecs/_codecs_iso2022.c"];
};

py2-c-module-_multiprocessing = cc_library_static {
    name = "py2-c-module-_multiprocessing";
    defaults = ["py2-interp-defaults"];
    srcs = [
        "Modules/_multiprocessing/multiprocessing.c"
        "Modules/_multiprocessing/semaphore.c"
        "Modules/_multiprocessing/socket_connection.c"
    ];
};

py2-c-module-zlib = cc_library_static {
    name = "py2-c-module-zlib";
    defaults = [
        "py2-interp-defaults"
    ];
    cflags = [
        "-DUSE_ZLIB_CRC32"
    ];
    srcs = [
        "Modules/zlibmodule.c"
    ];
    static_libs = [
        "libz"
    ];
};

py2-c-module-pyexpat = cc_library_static {
    name = "py2-c-module-pyexpat";
    defaults = [
        "py2-interp-defaults"
    ];
    cflags = [
        "-DUSE_PYEXPAT_CAPI"
    ];
    srcs = [
        "Modules/pyexpat.c"
    ];
    static_libs = [
        "libexpat"
    ];
};

py2-c-module-_sqlite3 = cc_library_static {
    name = "py2-c-module-_sqlite3";
    defaults = [
        "py2-interp-defaults"
    ];
    cflags = [
        "-DMODULE_NAME=\"sqlite3\""
        "-DSQLITE_OMIT_LOAD_EXTENSION"
        "-Wno-format-security"
        "-Wno-type-limits"
        "-Wno-char-subscripts"
    ];
    local_include_dirs = [
        "Modules/_sqlite"
    ];
    srcs = [
        "Modules/_sqlite/cache.c"
        "Modules/_sqlite/connection.c"
        "Modules/_sqlite/cursor.c"
        "Modules/_sqlite/microprotocols.c"
        "Modules/_sqlite/module.c"
        "Modules/_sqlite/prepare_protocol.c"
        "Modules/_sqlite/row.c"
        "Modules/_sqlite/statement.c"
        "Modules/_sqlite/util.c"
    ];
    target = {
        host = {
            static_libs = [
                "libsqlite"
            ];
        };
        android = {
            shared_libs = [
                "libsqlite"
            ];
        };
    };
};

py2-c-module-_ctypes_test = cc_library_static {
    name = "py2-c-module-_ctypes_test";
    defaults = ["py2-interp-defaults"];
    srcs = ["Modules/_ctypes/_ctypes_test.c"];
};

py2-c-module-_ctypes = cc_library_static {
    name = "py2-c-module-_ctypes";
    defaults = [
        "py2-interp-defaults"
    ];
    local_include_dirs = [
        "Modules/_ctypes/libffi/include"
    ];
    srcs = [
        "Modules/_ctypes/_ctypes.c"
        "Modules/_ctypes/callbacks.c"
        "Modules/_ctypes/callproc.c"
        "Modules/_ctypes/stgdict.c"
        "Modules/_ctypes/cfield.c"
        "Modules/_ctypes/libffi/src/prep_cif.c"
        "Modules/_ctypes/libffi/src/closures.c"
    ];
    arch = {
        x86_64 = {
            local_include_dirs = [
                "Modules/_ctypes/libffi/src/x86"
            ];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/ffi64.c"
                "Modules/_ctypes/libffi/src/x86/ffi.c"
                "Modules/_ctypes/libffi/src/x86/sysv.S"
            ];
        };
        x86 = {
            local_include_dirs = [
                "Modules/_ctypes/libffi/src/x86"
            ];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/ffi.c"
                "Modules/_ctypes/libffi/src/x86/sysv.S"
            ];
        };
        arm = {
            local_include_dirs = [
                "android_arm/libffi"
                "Modules/_ctypes/libffi/src/arm"
            ];
            srcs = [
                "Modules/_ctypes/libffi/src/arm/ffi.c"
                "Modules/_ctypes/libffi/src/arm/sysv.S"
                "Modules/_ctypes/libffi/src/arm/trampoline.S"
            ];
        };
        arm64 = {
            #  arithmetic on a pointer in _ctypes/libffi/src/aarch64/ffi.c
            cflags = ["-Wno-pointer-arith"];
            local_include_dirs = [
                "android_arm64/libffi"
                "Modules/_ctypes/libffi/src/aarch64"
            ];
            srcs = [
                "Modules/_ctypes/libffi/src/aarch64/ffi.c"
                "Modules/_ctypes/libffi/src/aarch64/sysv.S"
            ];
        };
    };
    target = {
        #  Regenerate include dirs with android_regen.sh
        darwin_x86_64 = {
            local_include_dirs = ["darwin_x86_64/libffi"];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/darwin.S"
                "Modules/_ctypes/libffi/src/x86/darwin64.S"
            ];
        };
        linux_bionic = {
            local_include_dirs = ["linux_x86_64/libffi"];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/unix64.S"
            ];
        };
        linux_glibc_x86_64 = {
            local_include_dirs = ["linux_x86_64/libffi"];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/unix64.S"
            ];
        };
        android_x86 = {
            local_include_dirs = ["android_x86/libffi"];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/win32.S"
            ];
        };
        android_x86_64 = {
            local_include_dirs = ["android_x86_64/libffi"];
            srcs = [
                "Modules/_ctypes/libffi/src/x86/unix64.S"
            ];
        };
    };
};

py2-c-module-_scproxy = cc_library_host_static {
    name = "py2-c-module-_scproxy";
    defaults = ["py2-interp-defaults"];
    srcs = ["Mac/Modules/_scproxy.c"];
    target = {
        linux = {
            enabled = false;
        };
    };
};

in { inherit py2-c-module-_bisect py2-c-module-_codecs_cn py2-c-module-_codecs_hk py2-c-module-_codecs_iso2022 py2-c-module-_codecs_jp py2-c-module-_codecs_kr py2-c-module-_codecs_tw py2-c-module-_collections py2-c-module-_csv py2-c-module-_ctypes py2-c-module-_ctypes_test py2-c-module-_functools py2-c-module-_heapq py2-c-module-_hotshot py2-c-module-_io py2-c-module-_json py2-c-module-_lsprof py2-c-module-_md5 py2-c-module-_multibytecodec py2-c-module-_multiprocessing py2-c-module-_random py2-c-module-_scproxy py2-c-module-_sha py2-c-module-_sha256 py2-c-module-_sha512 py2-c-module-_socket py2-c-module-_sqlite3 py2-c-module-_ssl py2-c-module-_struct py2-c-module-_testcapi py2-c-module-array py2-c-module-audioop py2-c-module-binascii py2-c-module-cPickle py2-c-module-cStringIO py2-c-module-cmath py2-c-module-datetime py2-c-module-fcntl py2-c-module-future_builtins py2-c-module-grp py2-c-module-itertools py2-c-module-math py2-c-module-mmap py2-c-module-operator py2-c-module-parser py2-c-module-pyexpat py2-c-module-resource py2-c-module-select py2-c-module-strop py2-c-module-syslog py2-c-module-termios py2-c-module-time py2-c-module-unicodedata py2-c-module-xxsubtype py2-c-module-zlib py2-cmd py2-interp-defaults py2-interp-object py2-interp-parser py2-interp-python py2-launcher py2-launcher-autorun py2-launcher-defaults py2-launcher-lib; }
