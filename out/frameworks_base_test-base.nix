{ filegroup, java_library_static, java_sdk_library }:
let

#
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

#  Build the android.test.base library
#  ===================================
#  This contains the junit.framework and android.test classes that were in
#  Android API level 25 excluding those from android.test.runner.
#  Also contains the com.android.internal.util.Predicate[s] classes.
"android.test.base" = java_sdk_library {
    name = "android.test.base";

    srcs = [
        "src/android/test/AndroidTestCase.java"
        "src/android/test/FlakyTest.java"
        "src/android/test/InstrumentationTestCase.java"
        "src/android/test/InstrumentationTestSuite.java"
        "src/android/test/PerformanceTestCase.java"
        "src/android/test/RepetitiveTest.java"
        "src/android/test/UiThreadTest.java"
        "src/android/test/suitebuilder/annotation/LargeTest.java"
        "src/android/test/suitebuilder/annotation/MediumTest.java"
        "src/android/test/suitebuilder/annotation/SmallTest.java"
        "src/android/test/suitebuilder/annotation/Smoke.java"
        "src/android/test/suitebuilder/annotation/Suppress.java"
        "src/com/android/internal/util/Predicate.java"
        "src/junit/framework/Assert.java"
        "src/junit/framework/AssertionFailedError.java"
        "src/junit/framework/ComparisonCompactor.java"
        "src/junit/framework/ComparisonFailure.java"
        "src/junit/framework/Protectable.java"
        "src/junit/framework/Test.java"
        "src/junit/framework/TestCase.java"
        "src/junit/framework/TestFailure.java"
        "src/junit/framework/TestListener.java"
        "src/junit/framework/TestResult.java"
        "src/junit/framework/TestSuite.java"
    ];

    errorprone = {
        javacflags = ["-Xep:DepAnn:ERROR"];
    };

    hostdex = true;

    api_packages = [
        "android.test"
        "android.test.suitebuilder.annotation"
        "com.android.internal.util"
        "junit.framework"
    ];

    compile_dex = true;
};

#  Build the android.test.base_static library
#  ==========================================
#  This is only intended for inclusion in the android.test.runner-minus-junit,
#  robolectric_android-all-stub and repackaged.android.test.* libraries.
#  Must not be used elsewhere.
"android.test.base_static" = java_library_static {
    name = "android.test.base_static";
    installable = false;

    srcs = [
        "src/android/test/AndroidTestCase.java"
        "src/android/test/FlakyTest.java"
        "src/android/test/InstrumentationTestCase.java"
        "src/android/test/InstrumentationTestSuite.java"
        "src/android/test/PerformanceTestCase.java"
        "src/android/test/RepetitiveTest.java"
        "src/android/test/UiThreadTest.java"
        "src/android/test/suitebuilder/annotation/LargeTest.java"
        "src/android/test/suitebuilder/annotation/MediumTest.java"
        "src/android/test/suitebuilder/annotation/SmallTest.java"
        "src/android/test/suitebuilder/annotation/Smoke.java"
        "src/android/test/suitebuilder/annotation/Suppress.java"
        "src/com/android/internal/util/Predicate.java"
        "src/junit/framework/Assert.java"
        "src/junit/framework/AssertionFailedError.java"
        "src/junit/framework/ComparisonCompactor.java"
        "src/junit/framework/ComparisonFailure.java"
        "src/junit/framework/Protectable.java"
        "src/junit/framework/Test.java"
        "src/junit/framework/TestCase.java"
        "src/junit/framework/TestFailure.java"
        "src/junit/framework/TestListener.java"
        "src/junit/framework/TestResult.java"
        "src/junit/framework/TestSuite.java"
    ];

    errorprone = {
        javacflags = ["-Xep:DepAnn:ERROR"];
    };

    #  Needs to be consistent with the repackaged version of this make target.
    java_version = "1.8";

    sdk_version = "current";
};

#  Build the repackaged.android.test.base library
#  ==============================================
#  This contains repackaged versions of the classes from
#  android.test.base.
"repackaged.android.test.base" = java_library_static {
    name = "repackaged.android.test.base";

    sdk_version = "current";
    static_libs = ["android.test.base_static"];

    jarjar_rules = "jarjar-rules.txt";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";
};

#  Build the android.test.base-minus-junit library
#  ===============================================
#  This contains the android.test classes from android.test.base plus
#  the com.android.internal.util.Predicate[s] classes. This is only
#  intended for inclusion in android.test.legacy and must not be used
#  elsewhere.
"android.test.base-minus-junit" = java_library_static {
    name = "android.test.base-minus-junit";

    srcs = [
        "src/android/test/AndroidTestCase.java"
        "src/android/test/FlakyTest.java"
        "src/android/test/InstrumentationTestCase.java"
        "src/android/test/InstrumentationTestSuite.java"
        "src/android/test/PerformanceTestCase.java"
        "src/android/test/RepetitiveTest.java"
        "src/android/test/UiThreadTest.java"
        "src/android/test/suitebuilder/annotation/LargeTest.java"
        "src/android/test/suitebuilder/annotation/MediumTest.java"
        "src/android/test/suitebuilder/annotation/SmallTest.java"
        "src/android/test/suitebuilder/annotation/Smoke.java"
        "src/android/test/suitebuilder/annotation/Suppress.java"
        "src/com/android/internal/util/Predicate.java"
    ];

    sdk_version = "current";
    libs = [
        "junit"
    ];
};

#  Make the current.txt available for use by the cts/tests/signature tests.
#  ========================================================================
"android-test-base-current.txt" = filegroup {
    name = "android-test-base-current.txt";
    visibility = [
        "//cts/tests/signature/api"
    ];
    srcs = [
        "api/current.txt"
    ];
};

in { inherit "android-test-base-current.txt" "android.test.base" "android.test.base-minus-junit" "android.test.base_static" "repackaged.android.test.base"; }
