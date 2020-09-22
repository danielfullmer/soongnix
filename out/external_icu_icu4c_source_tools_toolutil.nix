{ cc_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

libicutoolutil = cc_library_static {
    name = "libicutoolutil";
    export_include_dirs = ["."];
    rtti = true;
    cppflags = [
        "-DU_TOOLUTIL_IMPLEMENTATION"
        "-DANDROID_LINK_SHARED_ICU4C"
    ];
    srcs = [

        "collationinfo.cpp"
        "dbgutil.cpp"
        "denseranges.cpp"
        "filestrm.cpp"
        "filetools.cpp"
        "flagparser.cpp"
        "package.cpp"
        "pkg_genc.cpp"
        "pkg_gencmn.cpp"
        "pkg_icu.cpp"
        "pkgitems.cpp"
        "ppucd.cpp"
        "swapimpl.cpp"
        "toolutil.cpp"
        "ucbuf.cpp"
        "ucln_tu.cpp"
        "ucm.cpp"
        "ucmstate.cpp"
        "udbgutil.cpp"
        "unewdata.cpp"
        "uoptions.cpp"
        "uparse.cpp"
        "writesrc.cpp"
        "xmlparser.cpp"
    ];
    shared_libs = [
        "libicuuc"
        "libicui18n"
    ];
};

in { inherit libicutoolutil; }
