{ cc_binary, cc_defaults, cc_library_static }:
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

NeuralNetworksSampleDriver_defaults = cc_defaults {
    name = "NeuralNetworksSampleDriver_defaults";
    defaults = ["neuralnetworks_defaults"];
    #  b/109953668, disable OpenMP
    #  openmp: true,
    srcs = [
        "SampleDriver.cpp"
        "SampleDriverFull.cpp"
    ];
    header_libs = [
        "libneuralnetworks_headers"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libdl"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "libhidltransport"
        "libnativewindow"
        "libtextclassifier_hash"
        "liblog"
        "libui"
        "libutils"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libneuralnetworks_common"
    ];
};

NeuralNetworksSampleDriver_server_defaults = cc_defaults {
    name = "NeuralNetworksSampleDriver_server_defaults";
    defaults = ["NeuralNetworksSampleDriver_defaults"];
    relative_install_path = "hw";
    proprietary = true;
};

"android.hardware.neuralnetworks@1.2-service-sample-all" = cc_binary {
    name = "android.hardware.neuralnetworks@1.2-service-sample-all";
    srcs = ["SampleDriverAll.cpp"];
    defaults = ["NeuralNetworksSampleDriver_server_defaults"];
    init_rc = ["config/android.hardware.neuralnetworks@1.2-service-sample-all.rc"];
    vintf_fragments = ["config/android.hardware.neuralnetworks@1.2-service-sample-all.xml"];
};

"android.hardware.neuralnetworks@1.2-service-sample-float-fast" = cc_binary {
    name = "android.hardware.neuralnetworks@1.2-service-sample-float-fast";
    srcs = ["SampleDriverFloatFast.cpp"];
    defaults = ["NeuralNetworksSampleDriver_server_defaults"];
    init_rc = ["config/android.hardware.neuralnetworks@1.2-service-sample-float-fast.rc"];
    vintf_fragments = ["config/android.hardware.neuralnetworks@1.2-service-sample-float-fast.xml"];
};

"android.hardware.neuralnetworks@1.2-service-sample-float-slow" = cc_binary {
    name = "android.hardware.neuralnetworks@1.2-service-sample-float-slow";
    srcs = ["SampleDriverFloatSlow.cpp"];
    defaults = ["NeuralNetworksSampleDriver_server_defaults"];
    init_rc = ["config/android.hardware.neuralnetworks@1.2-service-sample-float-slow.rc"];
    vintf_fragments = ["config/android.hardware.neuralnetworks@1.2-service-sample-float-slow.xml"];
};

"android.hardware.neuralnetworks@1.2-service-sample-quant" = cc_binary {
    name = "android.hardware.neuralnetworks@1.2-service-sample-quant";
    srcs = ["SampleDriverQuant.cpp"];
    defaults = ["NeuralNetworksSampleDriver_server_defaults"];
    init_rc = ["config/android.hardware.neuralnetworks@1.2-service-sample-quant.rc"];
    vintf_fragments = ["config/android.hardware.neuralnetworks@1.2-service-sample-quant.xml"];
};

"android.hardware.neuralnetworks@1.2-service-sample-minimal" = cc_binary {
    name = "android.hardware.neuralnetworks@1.2-service-sample-minimal";
    srcs = ["SampleDriverMinimal.cpp"];
    defaults = ["NeuralNetworksSampleDriver_server_defaults"];
    init_rc = ["config/android.hardware.neuralnetworks@1.2-service-sample-minimal.rc"];
    vintf_fragments = ["config/android.hardware.neuralnetworks@1.2-service-sample-minimal.xml"];
};

libSampleDriver = cc_library_static {
    name = "libSampleDriver";
    defaults = ["NeuralNetworksSampleDriver_defaults"];
    export_include_dirs = ["."];
};

in { inherit "android.hardware.neuralnetworks@1.2-service-sample-all" "android.hardware.neuralnetworks@1.2-service-sample-float-fast" "android.hardware.neuralnetworks@1.2-service-sample-float-slow" "android.hardware.neuralnetworks@1.2-service-sample-minimal" "android.hardware.neuralnetworks@1.2-service-sample-quant" NeuralNetworksSampleDriver_defaults NeuralNetworksSampleDriver_server_defaults libSampleDriver; }
