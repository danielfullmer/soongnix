{ cc_defaults, cc_library_headers, cc_library_shared, cc_library_static }:
let

/*
 * Copyright 2017 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

libneuralnetworks_headers = cc_library_headers {
    name = "libneuralnetworks_headers";
    host_supported = false;
    vendor_available = true;
    export_include_dirs = ["include"];
    apex_available = [
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        #  Due to the dependency from libneuralnetworks_common
        #  that is available to the platform
        "//apex_available:platform"
    ];
};

libneuralnetworks_private_headers = cc_library_headers {
    name = "libneuralnetworks_private_headers";
    host_supported = false;
    export_include_dirs = ["."];
};

libneuralnetworks_defaults = cc_defaults {
    name = "libneuralnetworks_defaults";
    host_supported = false;
    use_version_lib = true;
    #  b/109953668, disable OpenMP
    #  openmp: true,
    srcs = [
        "BurstBuilder.cpp"
        "Callbacks.cpp"
        "CompilationBuilder.cpp"
        "ExecutionBuilder.cpp"
        "ExecutionPlan.cpp"
        "Manager.cpp"
        "Memory.cpp"
        "ModelArgumentInfo.cpp"
        "ModelBuilder.cpp"
        "NeuralNetworks.cpp"
        "TypeManager.cpp"
        "VersionedInterfaces.cpp"
    ];

    target = {
        android = {
            version_script = "libneuralnetworks.map.txt";
            shared_libs = [
                "liblog"
                "libnativewindow"
                "libneuralnetworks_packageinfo"
            ];
        };
        host = {
            shared_libs = [
            ];
        };
    };

    #  TODO(pszczepaniak, b/144488395): Use system libnativewindow,
    #  this would remove half of dependencies here.
    static_libs = [
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hardware.neuralnetworks@1.3"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libbase"
        "libcrypto_static"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidlmemory"
        "libjsoncpp"
        "libmath"
        "libneuralnetworks_common"
        "libprocessgroup"
        "libsync"
        "libtextclassifier_hash_static"
        "libutils"
    ];

    stl = "libc++_static";

    whole_static_libs = [
        "libprocpartition"
    ];

    shared_libs = [
        "libcgrouprc"
        "libvndksupport"
    ];

    header_libs = [
        "libneuralnetworks_headers"
    ];

    export_header_lib_headers = [
        "libneuralnetworks_headers"
    ];
};

libneuralnetworks = cc_library_shared {
    name = "libneuralnetworks";
    defaults = [
        "libneuralnetworks_defaults"
        "neuralnetworks_defaults"
    ];
    apex_available = [
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
    ];

    stubs = {
        versions = [
            "30"
        ];
        symbol_file = "libneuralnetworks.map.txt";
    };
};

#  Required for tests (b/147158681)
libneuralnetworks_static = cc_library_static {
    name = "libneuralnetworks_static";
    defaults = [
        "libneuralnetworks_defaults"
        "neuralnetworks_defaults"
    ];
    apex_available = ["//apex_available:platform"];
};

#  Android O-MR1

in { inherit libneuralnetworks libneuralnetworks_defaults libneuralnetworks_headers libneuralnetworks_private_headers libneuralnetworks_static; }
