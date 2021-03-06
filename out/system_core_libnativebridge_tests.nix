{ cc_defaults, cc_library_shared, cc_test }:
let

#
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
#

libnativebridge-dummy-defaults = cc_defaults {
    name = "libnativebridge-dummy-defaults";

    host_supported = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    header_libs = ["libnativebridge-headers"];
    cppflags = ["-fvisibility=protected"];
};

libnativebridge-dummy = cc_library_shared {
    name = "libnativebridge-dummy";
    srcs = ["DummyNativeBridge.cpp"];
    defaults = ["libnativebridge-dummy-defaults"];
};

libnativebridge2-dummy = cc_library_shared {
    name = "libnativebridge2-dummy";
    srcs = ["DummyNativeBridge2.cpp"];
    defaults = ["libnativebridge-dummy-defaults"];
};

libnativebridge3-dummy = cc_library_shared {
    name = "libnativebridge3-dummy";
    srcs = ["DummyNativeBridge3.cpp"];
    defaults = ["libnativebridge-dummy-defaults"];
};

#  Build the unit tests.
libnativebridge-tests-defaults = cc_defaults {
    name = "libnativebridge-tests-defaults";
    test_per_src = true;

    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "CodeCacheCreate_test.cpp"
        "CodeCacheExists_test.cpp"
        "CodeCacheStatFail_test.cpp"
        "CompleteFlow_test.cpp"
        "InvalidCharsNativeBridge_test.cpp"
        "NativeBridge2Signal_test.cpp"
        "NativeBridgeVersion_test.cpp"
        "NeedsNativeBridge_test.cpp"
        "PreInitializeNativeBridge_test.cpp"
        "PreInitializeNativeBridgeFail1_test.cpp"
        "PreInitializeNativeBridgeFail2_test.cpp"
        "ReSetupNativeBridge_test.cpp"
        "UnavailableNativeBridge_test.cpp"
        "ValidNameNativeBridge_test.cpp"
        "NativeBridge3UnloadLibrary_test.cpp"
        "NativeBridge3GetError_test.cpp"
        "NativeBridge3IsPathSupported_test.cpp"
        "NativeBridge3InitAnonymousNamespace_test.cpp"
        "NativeBridge3CreateNamespace_test.cpp"
        "NativeBridge3LoadLibraryExt_test.cpp"
    ];

    shared_libs = [
        "liblog"
        "libnativebridge-dummy"
    ];
    header_libs = ["libbase_headers"];
};

libnativebridge-tests = cc_test {
    name = "libnativebridge-tests";
    defaults = ["libnativebridge-tests-defaults"];
    host_supported = true;
    shared_libs = ["libnativebridge"];
};

libnativebridge-lazy-tests = cc_test {
    name = "libnativebridge-lazy-tests";
    defaults = ["libnativebridge-tests-defaults"];
    shared_libs = ["libnativebridge_lazy"];
};

#  Build the test for the C API.
libnativebridge-api-tests = cc_test {
    name = "libnativebridge-api-tests";
    host_supported = true;
    test_per_src = true;
    srcs = [
        "NativeBridgeApi.c"
    ];
    header_libs = ["libnativebridge-headers"];
};

in { inherit libnativebridge-api-tests libnativebridge-dummy libnativebridge-dummy-defaults libnativebridge-lazy-tests libnativebridge-tests libnativebridge-tests-defaults libnativebridge2-dummy libnativebridge3-dummy; }
