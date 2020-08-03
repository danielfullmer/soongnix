{ cc_test_library, genrule }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

"c2hal_test_genc++_headers" = genrule {
    name = "c2hal_test_genc++_headers";
    tools = [
        "c2hal"
        "hidl-gen"
    ];
    cmd = "$(location c2hal) -o $(genDir)/c2hal_test/1.0 " +
        "    -p android.hardware.c2hal_test@1.0 $(in) && " +
        "$(location hidl-gen) -o $(genDir) -Lc++ " +
        "    -r android.hardware:$(genDir) " +
        "    -r android.hidl:system/libhidl/transport " +
        "    android.hardware.c2hal_test@1.0";
    srcs = [
        "simple.h"
    ];
    out = [
        "android/hardware/c2hal_test/1.0/BnHwSimple.h"
        "android/hardware/c2hal_test/1.0/BpHwSimple.h"
        "android/hardware/c2hal_test/1.0/BsSimple.h"
        "android/hardware/c2hal_test/1.0/IHwSimple.h"
        "android/hardware/c2hal_test/1.0/ISimple.h"
        "android/hardware/c2hal_test/1.0/BnHwSimpleLocation.h"
        "android/hardware/c2hal_test/1.0/BpHwSimpleLocation.h"
        "android/hardware/c2hal_test/1.0/BsSimpleLocation.h"
        "android/hardware/c2hal_test/1.0/IHwSimpleLocation.h"
        "android/hardware/c2hal_test/1.0/ISimpleLocation.h"
        "android/hardware/c2hal_test/1.0/types.h"
        "android/hardware/c2hal_test/1.0/hwtypes.h"
    ];
};

"c2hal_test_genc++" = genrule {
    name = "c2hal_test_genc++";
    tools = [
        "c2hal"
        "hidl-gen"
    ];
    cmd = "$(location c2hal) -o $(genDir)/c2hal_test/1.0 " +
        "    -p android.hardware.c2hal_test@1.0 $(in) && " +
        "$(location hidl-gen) -o $(genDir) -Lc++ " +
        "    -r android.hardware:$(genDir) " +
        "    -r android.hidl:system/libhidl/transport " +
        "    android.hardware.c2hal_test@1.0";
    srcs = [
        "simple.h"
    ];
    out = [
        "android/hardware/c2hal_test/1.0/SimpleAll.cpp"
        "android/hardware/c2hal_test/1.0/types.cpp"
    ];
};

c2hal_test = cc_test_library {
    name = "c2hal_test";
    defaults = ["hidl-module-defaults"];
    generated_headers = ["c2hal_test_genc++_headers"];
    generated_sources = ["c2hal_test_genc++"];
    export_generated_headers = ["c2hal_test_genc++_headers"];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
        "libcutils"
    ];
    gtest = false;
};

in { inherit "c2hal_test_genc++" "c2hal_test_genc++_headers" c2hal_test; }
