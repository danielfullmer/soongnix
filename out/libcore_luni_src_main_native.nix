{ filegroup }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

luni_native_srcs = filegroup {
    name = "luni_native_srcs";
    visibility = [
        "//libcore"
    ];
    srcs = [
        "ExecStrings.cpp"
        "IcuUtilities.cpp"
        "JniConstants.cpp"
        "JniException.cpp"
        "NetworkUtilities.cpp"
        "Register.cpp"
        "ZipUtilities.cpp"
        "android_system_OsConstants.cpp"
        "cbigint.cpp"
        "java_lang_StringToReal.cpp"
        "java_lang_invoke_MethodHandle.cpp"
        "java_lang_invoke_VarHandle.cpp"
        "java_math_NativeBN.cpp"
        "libcore_icu_ICU.cpp"
        "libcore_icu_TimeZoneNames.cpp"
        "libcore_io_AsynchronousCloseMonitor.cpp"
        "libcore_io_Linux.cpp"
        "libcore_io_Memory.cpp"
        "libcore_util_NativeAllocationRegistry.cpp"
        "org_apache_harmony_xml_ExpatParser.cpp"
        "sun_misc_Unsafe.cpp"
        "valueOf.cpp"
    ];
};

libandroidio_srcs = filegroup {
    name = "libandroidio_srcs";
    visibility = [
        "//libcore"
    ];
    srcs = [
        "AsynchronousCloseMonitor.cpp"
    ];
};

in { inherit libandroidio_srcs luni_native_srcs; }
