{ cc_binary, cc_library, cc_prebuilt_library_shared, cc_test, prebuilt_etc }:
let

#
#  Copyright 2020 The Android Open Source Project
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

libobj_reader = cc_library {
    name = "libobj_reader";
    vendor = true;
    srcs = [
        "MtlReader.cpp"
        "ObjReader.cpp"
    ];
    shared_libs = [
        "libbase"
    ];
};

obj_reader_tests = cc_test {
    name = "obj_reader_tests";
    test_suites = ["device-tests"];
    vendor = true;
    srcs = ["ObjReaderTests.cpp"];
    shared_libs = [
        "libobj_reader"
        "libcutils"
        "libbase"
        "libutils"
    ];
    required = [
        "sample_car.obj"
        "sample_car_material.mtl"
    ];
};

#  Library for IO Module.
libio_module = cc_library {
    name = "libio_module";
    vendor = true;
    srcs = [
        "ConfigReader.cpp"
        "CarModelConfigReader.cpp"
        "ConfigReaderUtil.cpp"
        "IOModule.cpp"
    ];
    shared_libs = [
        "libbase"
        "libobj_reader"
        "libtinyxml2"
    ];
};

io_module_tests = cc_test {
    name = "io_module_tests";
    test_suites = ["device-tests"];
    vendor = true;
    srcs = [
        "CarModelConfigReaderTests.cpp"
        "ConfigReaderTests.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libio_module"
        "libobj_reader"
        "libtinyxml2"
        "libutils"
    ];
    required = [
        "sv_sample_car_model_config.xml"
        "sv_sample_config.xml"
    ];
};

libanimation_module = cc_library {
    name = "libanimation_module";
    vendor = true;
    srcs = [
        "AnimationModule.cpp"
    ];
    shared_libs = [
        "android.hardware.automotive.vehicle@2.0"
        "libbase"
        "libhidlbase"
        "libutils"
    ];
};

animation_module_tests = cc_test {
    name = "animation_module_tests";
    test_suites = ["device-tests"];
    vendor = true;
    srcs = ["AnimationModuleTests.cpp"];
    shared_libs = [
        "android.hardware.automotive.vehicle@2.0"
        "libanimation_module"
        "libcutils"
        "libbase"
        "libhidlbase"
        "libhardware"
        "libutils"
    ];
};

libvhal_handler = cc_library {
    name = "libvhal_handler";
    vendor = true;
    srcs = [
        "VhalHandler.cpp"
    ];
    shared_libs = [
        "android.hardware.automotive.vehicle@2.0"
        "android.hidl.memory@1.0"
        "libcutils"
        "libbase"
        "libbinder"
        "libhidlbase"
        "libhardware"
        "libhidlmemory"
        "libui"
        "libutils"
    ];
};

vhal_handler_tests = cc_test {
    name = "vhal_handler_tests";
    test_suites = ["device-tests"];
    vendor = true;
    srcs = ["VhalHandlerTests.cpp"];
    shared_libs = [
        "android.hardware.automotive.vehicle@2.0"
        "libvhal_handler"
        "libcutils"
        "libbase"
        "libbinder"
        "libhidlbase"
        "libhardware"
        "libhidlmemory"
        "libui"
        "libutils"
    ];
};

libsvsession = cc_library {
    name = "libsvsession";
    vendor = true;
    srcs = [
        "CameraUtils.cpp"
        "CoreLibSetupHelper.cpp"
        "SurroundView2dSession.cpp"
        "SurroundView3dSession.cpp"
    ];
    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.automotive.sv@1.0"
        "android.hardware.automotive.vehicle@2.0"
        "android.hidl.memory@1.0"
        "libanimation_module"
        "libbase"
        "libbinder"
        "libcamera_metadata"
        "libcore_lib_shared"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "libio_module"
        "libui"
        "libutils"
        "libvhal_handler"
    ];
    required = [
        "cam0.png"
        "cam1.png"
        "cam2.png"
        "cam3.png"
        "sample_car.obj"
        "sample_car_material.mtl"
        "sv_sample_config.xml"
        "sv_sample_car_model_config.xml"
    ];
    #  Disable builds except for arm64 and emulator devices
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
        x86 = {
            enabled = true;
        };
        x86_64 = {
            enabled = true;
        };
    };
};

sv_session_tests = cc_test {
    name = "sv_session_tests";
    test_suites = ["device-tests"];
    vendor = true;
    srcs = [
        "SurroundViewSessionTests.cpp"
        "mock-evs/MockEvsCamera.cpp"
        "mock-evs/MockEvsEnumerator.cpp"
        "mock-evs/MockSurroundViewCallback.cpp"
    ];
    include_dirs = [
        "packages/services/Car/evs/sampleDriver"
    ];
    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.automotive.sv@1.0"
        "android.hardware.automotive.vehicle@2.0"
        "android.hidl.memory@1.0"
        "libanimation_module"
        "libbase"
        "libbinder"
        "libcamera_metadata"
        "libcore_lib_shared"
        "libcutils"
        "libevsconfigmanager"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "libio_module"
        "libsvsession"
        "libtinyxml2"
        "libui"
        "libutils"
        "libvhal_handler"
    ];
    #  Disable builds except for arm64 and emulator devices
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
        x86 = {
            enabled = true;
        };
        x86_64 = {
            enabled = true;
        };
    };
};

"android.automotive.sv.service@1.0-impl" = cc_binary {
    name = "android.automotive.sv.service@1.0-impl";
    vendor = true;
    srcs = [
        "SurroundViewService.cpp"
        "service.cpp"
    ];
    init_rc = ["android.automotive.sv.service@1.0-impl.rc"];
    shared_libs = [
        "android.hardware.automotive.evs@1.1"
        "android.hardware.automotive.sv@1.0"
        "android.hardware.automotive.vehicle@2.0"
        "android.hidl.memory@1.0"
        "libanimation_module"
        "libbase"
        "libbinder"
        "libcamera_metadata"
        "libcore_lib_shared"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "libio_module"
        "libsvsession"
        "libui"
        "libutils"
        "libvhal_handler"
    ];
    cflags = ["-DLOG_TAG=\"SurroundViewService\""];
    required = [
        "cam0.png"
        "cam1.png"
        "cam2.png"
        "cam3.png"
        "sample_car.obj"
        "sample_car_material.mtl"
        "sv_sample_config.xml"
        "sv_sample_car_model_config.xml"
    ];
    #  Disable builds except for arm64 and emulator devices
    enabled = false;
    arch = {
        arm64 = {
            enabled = true;
        };
        x86 = {
            enabled = true;
        };
        x86_64 = {
            enabled = true;
        };
    };
    vintf_fragments = [
        "manifest_android.hardware.automotive.sv@1.0.xml"
    ];
};

libcore_lib_shared = cc_prebuilt_library_shared {
    name = "libcore_lib_shared";
    proprietary = true;
    arch = {
        arm64 = {
            srcs = ["lib/arm64/libcore_lib_shared.so"];
        };
        x86 = {
            srcs = ["lib/x86/libcore_lib_shared.so"];
        };
        x86_64 = {
            srcs = ["lib/x86-64/libcore_lib_shared.so"];
        };
    };
    shared_libs = [
        "libutils"
        "libcutils"
        "libbase"
        "libEGL"
        "libGLESv2"
        "libGLESv3"
        "libc"
        "libm"
        "libdl"
        "libz"
        "liblog"
    ];
};

"cam0.png" = prebuilt_etc {
    name = "cam0.png";
    soc_specific = true;
    src = "test_data/0.png";
    sub_dir = "automotive/sv";
};

"cam1.png" = prebuilt_etc {
    name = "cam1.png";
    soc_specific = true;
    src = "test_data/1.png";
    sub_dir = "automotive/sv";
};

"cam2.png" = prebuilt_etc {
    name = "cam2.png";
    soc_specific = true;
    src = "test_data/2.png";
    sub_dir = "automotive/sv";
};

"cam3.png" = prebuilt_etc {
    name = "cam3.png";
    soc_specific = true;
    src = "test_data/3.png";
    sub_dir = "automotive/sv";
};

"sample_car.obj" = prebuilt_etc {
    name = "sample_car.obj";
    soc_specific = true;
    src = "test_data/sample_car.obj";
    sub_dir = "automotive/sv";
};

"sample_car_material.mtl" = prebuilt_etc {
    name = "sample_car_material.mtl";
    soc_specific = true;
    src = "test_data/sample_car_material.mtl";
    sub_dir = "automotive/sv";
};

"sv_sample_config.xml" = prebuilt_etc {
    name = "sv_sample_config.xml";
    soc_specific = true;
    src = "test_data/sv_sample_config.xml";
    sub_dir = "automotive/sv";
};

"sv_sample_car_model_config.xml" = prebuilt_etc {
    name = "sv_sample_car_model_config.xml";
    soc_specific = true;
    src = "test_data/sv_sample_car_model_config.xml";
    sub_dir = "automotive/sv";
};

in { inherit "android.automotive.sv.service@1.0-impl" "cam0.png" "cam1.png" "cam2.png" "cam3.png" "sample_car.obj" "sample_car_material.mtl" "sv_sample_car_model_config.xml" "sv_sample_config.xml" animation_module_tests io_module_tests libanimation_module libcore_lib_shared libio_module libobj_reader libsvsession libvhal_handler obj_reader_tests sv_session_tests vhal_handler_tests; }
