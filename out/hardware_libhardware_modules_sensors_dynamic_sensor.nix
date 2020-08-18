{ cc_binary_host, cc_defaults, cc_library_shared }:
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

dynamic_sensor_defaults = cc_defaults {
    name = "dynamic_sensor_defaults";

    #  intended to be integrated into hal, thus vendor
    vendor = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        #  Allow implicit fallthroughs in HidRawSensor.cpp until they are fixed.
        "-Wno-error=implicit-fallthrough"
    ];
    export_include_dirs = ["."];

    shared_libs = [
        "libhidparser"
    ];

    target = {
        android = {
            srcs = [
                "BaseDynamicSensorDaemon.cpp"
                "BaseSensorObject.cpp"
                "ConnectionDetector.cpp"
                "DummyDynamicAccelDaemon.cpp"
                "DynamicSensorManager.cpp"
                "HidRawDevice.cpp"
                "HidRawSensor.cpp"
                "HidRawSensorDaemon.cpp"
                "HidRawSensorDevice.cpp"
                "RingBuffer.cpp"
            ];
            shared_libs = [
                "libbase"
                "libcutils"
                "liblog"
                "libutils"
            ];
            header_libs = [
                "libhardware_headers"
                "libstagefright_foundation_headers"
            ];
        };

        host = {
            local_include_dirs = [
                "test"
                "HidUtils/test"
            ];
        };

        #  host test is targeting linux host only
        darwin = {
            enabled = false;
        };
    };
};

#
#  There are two ways to utilize the dynamic sensor module:
#    1. Use as an extension in an existing hal: declare dependency on libdynamic_sensor_ext shared
#       library in existing sensor hal.
#    2. Use as a standalone sensor HAL and configure multihal to combine it with sensor hal that
#       hosts other sensors: add dependency on sensors.dynamic_sensor_hal in device level makefile and
#       write multihal configuration file accordingly.
#
#  Please take only one of these two options to avoid conflict over hardware resource.
#
#
#  Option 1: sensor extension module
#
libdynamic_sensor_ext = cc_library_shared {
    name = "libdynamic_sensor_ext";
    defaults = ["dynamic_sensor_defaults"];

    cflags = ["-DLOG_TAG=\"DynamicSensorExt\""];
};

#
#  Option 2: independent sensor hal
#
"sensors.dynamic_sensor_hal" = cc_library_shared {
    name = "sensors.dynamic_sensor_hal";
    defaults = ["dynamic_sensor_defaults"];
    relative_install_path = "hw";

    cflags = ["-DLOG_TAG=\"DynamicSensorHal\""];

    srcs = ["sensors.cpp"];
};

#
#  Host test for HidRawSensor. Test with dummy test HID descriptors.
#
hidrawsensor_host_test = cc_binary_host {
    name = "hidrawsensor_host_test";
    defaults = ["dynamic_sensor_defaults"];

    srcs = [
        "HidRawSensor.cpp"
        "BaseSensorObject.cpp"
        "HidUtils/test/TestHidDescriptor.cpp"
        "test/HidRawSensorTest.cpp"
    ];
};

#
#  Host test for HidRawDevice and HidRawSensor. Test with hidraw
#  device node.
#
hidrawdevice_host_test = cc_binary_host {
    name = "hidrawdevice_host_test";
    defaults = ["dynamic_sensor_defaults"];

    srcs = [
        "HidRawDevice.cpp"
        "HidRawSensor.cpp"
        "BaseSensorObject.cpp"
        "test/HidRawDeviceTest.cpp"
    ];
};

in { inherit "sensors.dynamic_sensor_hal" dynamic_sensor_defaults hidrawdevice_host_test hidrawsensor_host_test libdynamic_sensor_ext; }
