{ android_test }:
let

#  Copyright 2010, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

FrameworkTestRunnerTests = android_test {
    name = "FrameworkTestRunnerTests";

    #  We only want this apk build for tests.
    #
    #  Run the tests using the following commands:
    #    adb install -r ${ANDROID_PRODUCT_OUT}/data/app/FrameworkTestRunnerTests/FrameworkTestRunnerTests.apk
    #    adb shell am instrument \
    #      -e notAnnotation android.test.suitebuilder.examples.error.RunAsPartOfSeparateTest \
    #      -w com.android.frameworks.testrunner.tests/android.test.InstrumentationTestRunner \
    #

    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    static_libs = ["junit"];

    #  Include all test java files.
    srcs = [
        "src/android/test/AndroidTestRunnerTest.java"
        "src/android/test/InstrumentationTestRunnerTest.java"
        "src/android/test/TestCaseUtilTest.java"
        "src/android/test/suitebuilder/AssignableFromTest.java"
        "src/android/test/suitebuilder/ListTestCaseNames.java"
        "src/android/test/suitebuilder/SmokeTestSuiteBuilderTest.java"
        "src/android/test/suitebuilder/TestGroupingTest.java"
        "src/android/test/suitebuilder/TestPredicatesTest.java"
        "src/android/test/suitebuilder/TestSuiteBuilderTest.java"
        "src/android/test/suitebuilder/UnitTestSuiteBuilderTest.java"
        "src/android/test/suitebuilder/examples/OuterTest.java"
        "src/android/test/suitebuilder/examples/constructor/NoPublicConstructorTest.java"
        "src/android/test/suitebuilder/examples/constructor/ProtectedConstructorTest.java"
        "src/android/test/suitebuilder/examples/constructor/PublicConstructorTest.java"
        "src/android/test/suitebuilder/examples/error/ErrorTest.java"
        "src/android/test/suitebuilder/examples/error/FailingTest.java"
        "src/android/test/suitebuilder/examples/error/RunAsPartOfSeparateTest.java"
        "src/android/test/suitebuilder/examples/instrumentation/InstrumentationTest.java"
        "src/android/test/suitebuilder/examples/nested/Level1Test.java"
        "src/android/test/suitebuilder/examples/nested/nested/Level2Test.java"
        "src/android/test/suitebuilder/examples/simple/AnotherSimpleTest.java"
        "src/android/test/suitebuilder/examples/simple/SimpleTest.java"
        "src/android/test/suitebuilder/examples/smoke/NonSmokeTest.java"
        "src/android/test/suitebuilder/examples/smoke/SmokeTest.java"
        "src/android/test/suitebuilder/examples/subclass/SubclassTest.java"
        "src/android/test/suitebuilder/examples/subclass/SuperclassTest.java"
        "src/android/test/suitebuilder/examples/suppress/PartiallySuppressedTest.java"
        "src/android/test/suitebuilder/examples/suppress/SuppressedTest.java"
    ];

    #  Because of android.test.mock.
    platform_apis = true;

};

in { inherit FrameworkTestRunnerTests; }
