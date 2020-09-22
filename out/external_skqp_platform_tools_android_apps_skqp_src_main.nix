{ android_test }:
let

#  Copyright 2019 Google LLC.
#  Use of this source code is governed by a BSD-style license that can be
#  found in the LICENSE file.

CtsSkQPTestCases = android_test {
    name = "CtsSkQPTestCases";
    defaults = ["cts_defaults"];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = ["android.test.runner.stubs"];
    jni_libs = ["libskqp_app"];
    compile_multilib = "both";

    static_libs = [
        "android-support-design"
        "ctstestrunner-axt"
    ];
    srcs = [
        "java/org/skia/skqp/MainActivity.java"
        "java/org/skia/skqp/SkQP.java"
        "java/org/skia/skqp/SkQPActivity.java"
        "java/org/skia/skqp/SkQPException.java"
        "java/org/skia/skqp/SkQPFailure.java"
        "java/org/skia/skqp/SkQPRunner.java"
    ];
    sdk_version = "test_current";
};

in { inherit CtsSkQPTestCases; }
