{ cc_binary, cc_defaults, cc_library, cc_library_headers, cc_library_static, cc_test }:
let

#  Copyright (C) 2017 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

vhal_v2_0_defaults = cc_defaults {
    name = "vhal_v2_0_defaults";
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libutils"
        "android.hardware.automotive.vehicle@2.0"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

vhal_v2_0_common_headers = cc_library_headers {
    name = "vhal_v2_0_common_headers";
    vendor = true;
    export_include_dirs = ["common/include/vhal_v2_0"];
};

#  Vehicle reference implementation lib
"android.hardware.automotive.vehicle@2.0-manager-lib" = cc_library {
    name = "android.hardware.automotive.vehicle@2.0-manager-lib";
    vendor = true;
    defaults = ["vhal_v2_0_defaults"];
    srcs = [
        "common/src/Obd2SensorStore.cpp"
        "common/src/SubscriptionManager.cpp"
        "common/src/VehicleHalManager.cpp"
        "common/src/VehicleObjectPool.cpp"
        "common/src/VehiclePropertyStore.cpp"
        "common/src/VehicleUtils.cpp"
        "common/src/VmsUtils.cpp"
    ];
    local_include_dirs = ["common/include/vhal_v2_0"];
    export_include_dirs = ["common/include"];
};

#  Vehicle default VehicleHAL implementation
"android.hardware.automotive.vehicle@2.0-default-impl-lib" = cc_library_static {
    name = "android.hardware.automotive.vehicle@2.0-default-impl-lib";
    vendor = true;
    defaults = ["vhal_v2_0_defaults"];
    srcs = [
        "impl/vhal_v2_0/CommConn.cpp"
        "impl/vhal_v2_0/EmulatedVehicleHal.cpp"
        "impl/vhal_v2_0/VehicleEmulator.cpp"
        "impl/vhal_v2_0/PipeComm.cpp"
        "impl/vhal_v2_0/SocketComm.cpp"
        "impl/vhal_v2_0/LinearFakeValueGenerator.cpp"
        "impl/vhal_v2_0/JsonFakeValueGenerator.cpp"
        "impl/vhal_v2_0/GeneratorHub.cpp"
    ];
    local_include_dirs = ["common/include/vhal_v2_0"];
    export_include_dirs = ["impl"];
    whole_static_libs = ["android.hardware.automotive.vehicle@2.0-manager-lib"];
    shared_libs = [
        "libbase"
        "libprotobuf-cpp-lite"
    ];
    static_libs = [
        "libjsoncpp"
        "libqemu_pipe"
        "android.hardware.automotive.vehicle@2.0-libproto-native"
    ];
};

"android.hardware.automotive.vehicle@2.0-manager-unit-tests" = cc_test {
    name = "android.hardware.automotive.vehicle@2.0-manager-unit-tests";
    vendor = true;
    defaults = ["vhal_v2_0_defaults"];
    whole_static_libs = ["android.hardware.automotive.vehicle@2.0-manager-lib"];
    srcs = [
        "tests/RecurrentTimer_test.cpp"
        "tests/SubscriptionManager_test.cpp"
        "tests/VehicleHalManager_test.cpp"
        "tests/VehicleObjectPool_test.cpp"
        "tests/VehiclePropConfigIndex_test.cpp"
        "tests/VmsUtils_test.cpp"
    ];
    header_libs = ["libbase_headers"];
    test_suites = ["general-tests"];
};

"android.hardware.automotive.vehicle@2.0-service" = cc_binary {
    name = "android.hardware.automotive.vehicle@2.0-service";
    defaults = ["vhal_v2_0_defaults"];
    init_rc = ["android.hardware.automotive.vehicle@2.0-service.rc"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["VehicleService.cpp"];
    shared_libs = [
        "libbase"
        "libprotobuf-cpp-lite"
    ];
    static_libs = [
        "android.hardware.automotive.vehicle@2.0-manager-lib"
        "android.hardware.automotive.vehicle@2.0-default-impl-lib"
        "android.hardware.automotive.vehicle@2.0-libproto-native"
        "libjsoncpp"
        "libqemu_pipe"
    ];
};

in { inherit "android.hardware.automotive.vehicle@2.0-default-impl-lib" "android.hardware.automotive.vehicle@2.0-manager-lib" "android.hardware.automotive.vehicle@2.0-manager-unit-tests" "android.hardware.automotive.vehicle@2.0-service" vhal_v2_0_common_headers vhal_v2_0_defaults; }
