{ cc_defaults, cc_test }:
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

NeuralNetworksTest_default_libs = cc_defaults {
    name = "NeuralNetworksTest_default_libs";
    defaults = ["neuralnetworks_defaults"];
    host_supported = false;
    #  b/109953668, disable OpenMP
    #  openmp: true,
    shared_libs = [
        "libandroid"
        "libbase"
        "libbinder"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "libhidltransport"
        "libhidlmemory"
        "liblog"
        "libnativewindow"
        "libtextclassifier_hash"
        "libui"
        "libutils"
        "android.hardware.neuralnetworks@1.0"
        "android.hardware.neuralnetworks@1.1"
        "android.hardware.neuralnetworks@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];
    static_libs = [
        "libc++fs"
        "libcrypto"
    ];
    header_libs = [
        "libneuralnetworks_generated_test_harness_headers"
    ];
};

NeuralNetworksTest_defaults = cc_defaults {
    name = "NeuralNetworksTest_defaults";
    defaults = ["NeuralNetworksTest_default_libs"];
    srcs = [
        "TestNeuralNetworksWrapper.cpp"

        #  Subset of tests that rely only on public functionality.
        #
        #  Changes to this list must be reflected in cts/tests/tests/neuralnetworks/Android.mk
        #  to ensure CTS tests coverage.
        "generated/tests/*.cpp"
        "TestGenerated.cpp"
        "TestMemory.cpp"
        "TestOperandExtraParams.cpp"
        "TestTrivialModel.cpp"
        "TestUnknownDimensions.cpp"
        "TestUnspecifiedDimensions.cpp"
        "TestValidateModel.cpp"
        "TestValidateOperations.cpp"
        "TestValidation.cpp"
        "TestWrapper.cpp"
    ];
    static_libs = [
        "libgmock"
    ];
};

NeuralNetworksTest_shared_partial = cc_test {
    name = "NeuralNetworksTest_shared_partial";
    defaults = ["NeuralNetworksTest_defaults"];
    srcs = [
        "TestMain.cpp"
    ];
    cflags = [
        "-DNNTEST_ONLY_PUBLIC_API"
    ];
    shared_libs = [
        "libneuralnetworks"
        "libtextclassifier_hash"
    ];
};

NeuralNetworksTest_static_defaults = cc_defaults {
    name = "NeuralNetworksTest_static_defaults";
    defaults = ["NeuralNetworksTest_defaults"];
    srcs = [
        "TestMain.cpp"

        "Bridge.cpp"
        #  Tests that rely on non-public functionality (i.e., symbols
        #  not exported from libneuralnetworks.so).
        "TestCompilationCaching.cpp"
        "TestCompliance.cpp"
        "TestExecution.cpp"
        "TestMemoryInternal.cpp"
        #  b/109953668, disable OpenMP
        #  "TestOpenmpSettings.cpp",
        "TestPartitioning.cpp"
        "TestPartitioningRandom.cpp"
        "TestIntrospectionControl.cpp"
        "TestExtensions.cpp"
        "fibonacci_extension/FibonacciExtensionTest.cpp"
        "fibonacci_extension/FibonacciDriver.cpp"
    ];
    static_libs = [
        "libgmock"
        "libneuralnetworks"
        "libneuralnetworks_common"
        "libSampleDriver"
    ];
    shared_libs = [
        "libcutils"
    ];
    header_libs = [
        "libneuralnetworks_private_headers"
        "neuralnetworks_test_vendor_fibonacci_extension"
    ];
    test_suites = [
        "general-tests"
    ];
};

NeuralNetworksTest_static = cc_test {
    name = "NeuralNetworksTest_static";
    defaults = ["NeuralNetworksTest_static_defaults"];
};

NeuralNetworksTest_static_fuzzing = cc_test {
    name = "NeuralNetworksTest_static_fuzzing";
    defaults = ["NeuralNetworksTest_default_libs"];
    srcs = [
        "TestNeuralNetworksWrapper.cpp"
        "fuzzing/operation_signatures/*.cpp"
        "fuzzing/OperationManager.cpp"
        "fuzzing/RandomGraphGenerator.cpp"
        "fuzzing/RandomGraphGeneratorUtils.cpp"
        "fuzzing/RandomVariable.cpp"
        "fuzzing/TestRandomGraph.cpp"
    ];
    static_libs = [
        "libgmock"
        "libneuralnetworks"
        "libneuralnetworks_common"
        "libSampleDriver"
    ];
    header_libs = [
        "libneuralnetworks_private_headers"
    ];
};

NeuralNetworksTest_static_asan = cc_test {
    name = "NeuralNetworksTest_static_asan";
    defaults = ["NeuralNetworksTest_static_defaults"];
    sanitize = {
        address = true;
    };
    #  Declare explicit library dependency for continuous builds
    target = {
        android_arm = {
            required = [
                "libclang_rt.asan-arm-android"
            ];
        };
        android_arm64 = {
            required = [
                "libclang_rt.asan-aarch64-android"
            ];
        };
        android_x86 = {
            required = [
                "libclang_rt.asan-i686-android"
            ];
        };
        android_x86_64 = {
            required = [
                "libclang_rt.asan-x86_64-android"
            ];
        };
    };
};

NeuralNetworksTest_static_ubsan = cc_test {
    name = "NeuralNetworksTest_static_ubsan";
    defaults = ["NeuralNetworksTest_static_defaults"];
    sanitize = {
        undefined = true;
        all_undefined = true;
        diag = {
            undefined = true;
        };
    };
};

NeuralNetworksTest_mt_defaults = cc_defaults {
    name = "NeuralNetworksTest_mt_defaults";
    defaults = ["NeuralNetworksTest_default_libs"];
    srcs = [
        "TestNeuralNetworksWrapper.cpp"
        "TestMain.cpp"
        "generated/tests/*.cpp"
        "TestGenerated.cpp"
    ];
    cflags = [
        "-DNNTEST_MULTITHREADED"
    ];
    static_libs = [
        "libgmock"
        "libneuralnetworks"
        "libneuralnetworks_common"
        "libSampleDriver"
    ];
    shared_libs = [
        "libcutils"
    ];
    header_libs = [
        "libneuralnetworks_private_headers"
    ];
};

NeuralNetworksTest_mt_static = cc_test {
    name = "NeuralNetworksTest_mt_static";
    defaults = ["NeuralNetworksTest_mt_defaults"];
};

NeuralNetworksTest_mt_static_asan = cc_test {
    #  Note: tsan not supported on Android (yet)
    name = "NeuralNetworksTest_mt_static_asan";
    defaults = ["NeuralNetworksTest_mt_defaults"];
    sanitize = {
        address = true;
    };
};

in { inherit NeuralNetworksTest_default_libs NeuralNetworksTest_defaults NeuralNetworksTest_mt_defaults NeuralNetworksTest_mt_static NeuralNetworksTest_mt_static_asan NeuralNetworksTest_shared_partial NeuralNetworksTest_static NeuralNetworksTest_static_asan NeuralNetworksTest_static_defaults NeuralNetworksTest_static_fuzzing NeuralNetworksTest_static_ubsan; }
