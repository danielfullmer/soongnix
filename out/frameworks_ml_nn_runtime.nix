{ cc_library, cc_library_headers, llndk_library, ndk_headers, ndk_library }:
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
};

libneuralnetworks_private_headers = cc_library_headers {
    name = "libneuralnetworks_private_headers";
    host_supported = false;
    export_include_dirs = ["."];
};

libneuralnetworks = cc_library {
    name = "libneuralnetworks";
    defaults = ["neuralnetworks_defaults"];
    use_version_lib = true;
    host_supported = false;
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
        "ModelBuilder.cpp"
        "NeuralNetworks.cpp"
        "TypeManager.cpp"
        "VersionedInterfaces.cpp"
    ];

    target = {
        android = {
            version_script = "libneuralnetworks.map.txt";
            shared_libs = [
                "libbase"
                "libbinder"
                "libcutils"
                "libhidlbase"
                "libhidltransport"
                "libhidlmemory"
                "liblog"
                "libnativewindow"
                "libui"
                "libutils"
                "android.hardware.neuralnetworks@1.0"
                "android.hardware.neuralnetworks@1.1"
                "android.hardware.neuralnetworks@1.2"
                "android.hidl.allocator@1.0"
                "android.hidl.memory@1.0"
            ];
            static_libs = [
                "libcrypto_static"
            ];
        };
        host = {
            shared_libs = [
            ];
        };
    };

    static_libs = [
        "libneuralnetworks_common"
    ];

    whole_static_libs = [
        "libprocpartition"
    ];

    shared_libs = [
        "libfmq"
        "libtextclassifier_hash"
    ];

    header_libs = [
        "libneuralnetworks_headers"
    ];

    export_header_lib_headers = [
        "libneuralnetworks_headers"
    ];
};

libneuralnetworks_ndk_headers = ndk_headers {
    name = "libneuralnetworks_ndk_headers";
    from = "include";
    to = "android";
    srcs = ["include/NeuralNetworks.h"];
    license = "NOTICE";
};

libneuralnetworks = ndk_library {
    name = "libneuralnetworks";
    symbol_file = "libneuralnetworks.map.txt";
    #  Android O-MR1
    first_version = "27";
};

libneuralnetworks = llndk_library {
    name = "libneuralnetworks";
    symbol_file = "libneuralnetworks.map.txt";
    export_include_dirs = ["include"];
};

in { inherit libneuralnetworks libneuralnetworks_headers libneuralnetworks_ndk_headers libneuralnetworks_private_headers; }
