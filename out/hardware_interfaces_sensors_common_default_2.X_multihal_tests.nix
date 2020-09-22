{ cc_defaults, cc_library, cc_test, cc_test_library }:
let

#
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

"android.hardware.sensors@2.X-fakesubhal-defaults" = cc_defaults {
    name = "android.hardware.sensors@2.X-fakesubhal-defaults";
    srcs = [
        "fake_subhal/Sensor.cpp"
        "fake_subhal/SensorsSubHal.cpp"
    ];
    header_libs = [
        "android.hardware.sensors@2.0-multihal.header"
        "android.hardware.sensors@2.X-shared-utils"
    ];
    export_include_dirs = ["fake_subhal"];
    shared_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.0-ScopedWakelock"
        "android.hardware.sensors@2.1"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libpower"
        "libutils"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
        "android.hardware.sensors@2.X-multihal"
    ];
    cflags = [
        "-DLOG_TAG=\"FakeSubHal\""
    ];
};

"android.hardware.sensors@2.X-fakesubhal-config1" = cc_library {
    name = "android.hardware.sensors@2.X-fakesubhal-config1";
    vendor = true;
    defaults = ["android.hardware.sensors@2.X-fakesubhal-defaults"];
    cflags = [
        "-DSUB_HAL_VERSION_2_0"
        "-DSUPPORT_CONTINUOUS_SENSORS"
        "-DSUB_HAL_NAME=\"FakeSubHal-Continuous\""
    ];
};

"android.hardware.sensors@2.X-fakesubhal-config2" = cc_library {
    name = "android.hardware.sensors@2.X-fakesubhal-config2";
    vendor = true;
    defaults = ["android.hardware.sensors@2.X-fakesubhal-defaults"];
    cflags = [
        "-DSUB_HAL_VERSION_2_0"
        "-DSUPPORT_ON_CHANGE_SENSORS"
        "-DSUB_HAL_NAME=\"FakeSubHal-OnChange\""
    ];
};

"android.hardware.sensors@2.X-fakesubhal-config3" = cc_library {
    name = "android.hardware.sensors@2.X-fakesubhal-config3";
    vendor = true;
    defaults = ["android.hardware.sensors@2.X-fakesubhal-defaults"];
    cflags = [
        "-DSUPPORT_ON_CHANGE_SENSORS"
        "-DSUB_HAL_NAME=\"FakeSubHal-OnChange\""
    ];
};

"android.hardware.sensors@2.X-fakesubhal-unittest" = cc_test_library {
    name = "android.hardware.sensors@2.X-fakesubhal-unittest";
    vendor_available = true;
    defaults = ["android.hardware.sensors@2.X-fakesubhal-defaults"];
    cflags = [
        "-DSUPPORT_ON_CHANGE_SENSORS"
        "-DSUPPORT_CONTINUOUS_SENSORS"
        "-DSUB_HAL_NAME=\"FakeSubHal-Test\""
    ];
};

"android.hardware.sensors@2.X-halproxy-unit-tests" = cc_test {
    name = "android.hardware.sensors@2.X-halproxy-unit-tests";
    srcs = ["HalProxy_test.cpp"];
    vendor = true;
    header_libs = [
        "android.hardware.sensors@2.X-shared-utils"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
        "android.hardware.sensors@2.0-ScopedWakelock.testlib"
        "android.hardware.sensors@2.X-multihal"
        "android.hardware.sensors@2.X-fakesubhal-unittest"
    ];
    shared_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.1"
        "libbase"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libpower"
        "libutils"
    ];
    test_suites = ["device-tests"];
    cflags = [
        "-DLOG_TAG=\"HalProxyUnitTests\""
    ];
};

in { inherit "android.hardware.sensors@2.X-fakesubhal-config1" "android.hardware.sensors@2.X-fakesubhal-config2" "android.hardware.sensors@2.X-fakesubhal-config3" "android.hardware.sensors@2.X-fakesubhal-defaults" "android.hardware.sensors@2.X-fakesubhal-unittest" "android.hardware.sensors@2.X-halproxy-unit-tests"; }
