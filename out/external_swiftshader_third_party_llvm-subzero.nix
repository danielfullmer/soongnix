{ cc_library_static }:
let

#
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
#

libLLVMSupport_subzero = cc_library_static {
    name = "libLLVMSupport_subzero";

    defaults = ["swiftshader_common_release"];

    device_supported = false;
    host_supported = true;

    cflags = [
        "-D_GNU_SOURCE"
        "-D__STDC_LIMIT_MACROS"
        "-D__STDC_CONSTANT_MACROS"
        "-D__STDC_FORMAT_MACROS"
        "-DLOG_TAG=\"libsubzero\""
        "-Wno-implicit-fallthrough"
        "-Wno-unused-parameter"
    ];

    cppflags = [
        "-Wno-sign-promo"
    ];

    srcs = [
        "lib/Demangle/ItaniumDemangle.cpp"
        "lib/Support/APInt.cpp"
        "lib/Support/Atomic.cpp"
        "lib/Support/circular_raw_ostream.cpp"
        "lib/Support/CommandLine.cpp"
        "lib/Support/ConvertUTF.cpp"
        "lib/Support/ConvertUTFWrapper.cpp"
        "lib/Support/Debug.cpp"
        "lib/Support/Errno.cpp"
        "lib/Support/ErrorHandling.cpp"
        "lib/Support/FoldingSet.cpp"
        "lib/Support/Hashing.cpp"
        "lib/Support/Host.cpp"
        "lib/Support/ManagedStatic.cpp"
        "lib/Support/MemoryBuffer.cpp"
        "lib/Support/Mutex.cpp"
        "lib/Support/NativeFormatting.cpp"
        "lib/Support/Path.cpp"
        "lib/Support/Process.cpp"
        "lib/Support/Program.cpp"
        "lib/Support/raw_os_ostream.cpp"
        "lib/Support/raw_ostream.cpp"
        "lib/Support/regcomp.c"
        "lib/Support/regerror.c"
        "lib/Support/Regex.cpp"
        "lib/Support/regexec.c"
        "lib/Support/regfree.c"
        "lib/Support/regstrlcpy.c"
        "lib/Support/Signals.cpp"
        "lib/Support/SmallPtrSet.cpp"
        "lib/Support/SmallVector.cpp"
        "lib/Support/StringExtras.cpp"
        "lib/Support/StringMap.cpp"
        "lib/Support/StringRef.cpp"
        "lib/Support/StringSaver.cpp"
        "lib/Support/TargetParser.cpp"
        "lib/Support/Threading.cpp"
        "lib/Support/Timer.cpp"
        "lib/Support/Triple.cpp"
        "lib/Support/Twine.cpp"
    ];

    export_include_dirs = [
        "build/Android/include"
        "include"
    ];
};

in { inherit libLLVMSupport_subzero; }
