{ cc_library_static, filegroup }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

liblua = cc_library_static {
    name = "liblua";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
        "-Wno-string-plus-int"
        "-O2"
        "-DLUA_USE_LINUX"
        "-DLUA_COMPAT_5_2"
    ];
    export_include_dirs = ["src"];
    srcs = [
        ":liblua-sources"
    ];
};

liblua-sources = filegroup {
    name = "liblua-sources";
    srcs = [
        "src/lapi.c"
        "src/lauxlib.c"
        "src/lbaselib.c"
        "src/lbitlib.c"
        "src/lcode.c"
        "src/lcorolib.c"
        "src/lctype.c"
        "src/ldblib.c"
        "src/ldebug.c"
        "src/ldo.c"
        "src/ldump.c"
        "src/lfunc.c"
        "src/lgc.c"
        "src/linit.c"
        "src/liolib.c"
        "src/llex.c"
        "src/lmathlib.c"
        "src/lmem.c"
        "src/loadlib.c"
        "src/lobject.c"
        "src/lopcodes.c"
        "src/loslib.c"
        "src/lparser.c"
        "src/lstate.c"
        "src/lstring.c"
        "src/lstrlib.c"
        "src/ltable.c"
        "src/ltablib.c"
        "src/ltm.c"
        "src/lua.c"
        "src/luac.c"
        "src/lundump.c"
        "src/lutf8lib.c"
        "src/lvm.c"
        "src/lzio.c"
    ];
    exclude_srcs = [
        #  Exclude the interpreter
        "src/lua.c"
    ];
};

in { inherit liblua liblua-sources; }
