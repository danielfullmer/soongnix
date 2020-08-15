{ java_library, java_library_static, java_sdk_library }:
let

#
#  Copyright (C) 2008 The Android Open Source Project
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

#  Build the android.test.runner library
#  =====================================
"android.test.runner" = java_sdk_library {
    name = "android.test.runner";

    srcs = [
        "src/android/test/ActivityInstrumentationTestCase.java"
        "src/android/test/ActivityInstrumentationTestCase2.java"
        "src/android/test/ActivityTestCase.java"
        "src/android/test/ActivityUnitTestCase.java"
        "src/android/test/AndroidTestRunner.java"
        "src/android/test/ApplicationTestCase.java"
        "src/android/test/AssertionFailedError.java"
        "src/android/test/ClassPathPackageInfoSource.java"
        "src/android/test/ComparisonFailure.java"
        "src/android/test/InstrumentationTestRunner.java"
        "src/android/test/IsolatedContext.java"
        "src/android/test/LaunchPerformanceBase.java"
        "src/android/test/LoaderTestCase.java"
        "src/android/test/MoreAsserts.java"
        "src/android/test/NoExecTestResult.java"
        "src/android/test/ProviderTestCase.java"
        "src/android/test/ProviderTestCase2.java"
        "src/android/test/RenamingDelegatingContext.java"
        "src/android/test/ServiceTestCase.java"
        "src/android/test/SimpleCache.java"
        "src/android/test/SingleLaunchActivityTestCase.java"
        "src/android/test/SyncBaseInstrumentation.java"
        "src/android/test/TestCaseUtil.java"
        "src/android/test/TestPrinter.java"
        "src/android/test/TestSuiteProvider.java"
        "src/android/test/TouchUtils.java"
        "src/android/test/ViewAsserts.java"
        "src/android/test/suitebuilder/AssignableFrom.java"
        "src/android/test/suitebuilder/SmokeTestSuiteBuilder.java"
        "src/android/test/suitebuilder/TestGrouping.java"
        "src/android/test/suitebuilder/TestMethod.java"
        "src/android/test/suitebuilder/TestPredicates.java"
        "src/android/test/suitebuilder/TestSuiteBuilder.java"
        "src/android/test/suitebuilder/UnitTestSuiteBuilder.java"
        "src/junit/runner/BaseTestRunner.java"
        "src/junit/runner/StandardTestSuiteLoader.java"
        "src/junit/runner/TestRunListener.java"
        "src/junit/runner/TestSuiteLoader.java"
        "src/junit/runner/Version.java"
        "src/junit/runner/package-info.java"
        "src/junit/textui/ResultPrinter.java"
        "src/junit/textui/TestRunner.java"
        "src/junit/textui/package-info.java"
    ];

    errorprone = {
        javacflags = ["-Xep:DepAnn:ERROR"];
    };

    libs = [
        "android.test.base"
        "android.test.mock"
    ];
    stub_only_libs = [
        "android.test.base"
        "android.test.mock"
    ];
    api_packages = [
        "android.test"
        "android.test.suitebuilder"
        "junit.runner"
        "junit.textui"
    ];

    compile_dex = true;
};

#  Build the android.test.runner-minus-junit library
#  =================================================
#  This is only intended for inclusion in the android.test.legacy static
#  library and must not be used elsewhere.
"android.test.runner-minus-junit" = java_library {
    name = "android.test.runner-minus-junit";

    srcs = [
        "src/android/test/ActivityInstrumentationTestCase.java"
        "src/android/test/ActivityInstrumentationTestCase2.java"
        "src/android/test/ActivityTestCase.java"
        "src/android/test/ActivityUnitTestCase.java"
        "src/android/test/AndroidTestRunner.java"
        "src/android/test/ApplicationTestCase.java"
        "src/android/test/AssertionFailedError.java"
        "src/android/test/ClassPathPackageInfoSource.java"
        "src/android/test/ComparisonFailure.java"
        "src/android/test/InstrumentationTestRunner.java"
        "src/android/test/IsolatedContext.java"
        "src/android/test/LaunchPerformanceBase.java"
        "src/android/test/LoaderTestCase.java"
        "src/android/test/MoreAsserts.java"
        "src/android/test/NoExecTestResult.java"
        "src/android/test/ProviderTestCase.java"
        "src/android/test/ProviderTestCase2.java"
        "src/android/test/RenamingDelegatingContext.java"
        "src/android/test/ServiceTestCase.java"
        "src/android/test/SimpleCache.java"
        "src/android/test/SingleLaunchActivityTestCase.java"
        "src/android/test/SyncBaseInstrumentation.java"
        "src/android/test/TestCaseUtil.java"
        "src/android/test/TestPrinter.java"
        "src/android/test/TestSuiteProvider.java"
        "src/android/test/TouchUtils.java"
        "src/android/test/ViewAsserts.java"
        "src/android/test/suitebuilder/AssignableFrom.java"
        "src/android/test/suitebuilder/SmokeTestSuiteBuilder.java"
        "src/android/test/suitebuilder/TestGrouping.java"
        "src/android/test/suitebuilder/TestMethod.java"
        "src/android/test/suitebuilder/TestPredicates.java"
        "src/android/test/suitebuilder/TestSuiteBuilder.java"
        "src/android/test/suitebuilder/UnitTestSuiteBuilder.java"
    ];

    sdk_version = "current";
    libs = [
        "android.test.base_static"
        "android.test.mock"
        "junit"
    ];
};

#  Build the repackaged.android.test.runner library
#  ================================================
"repackaged.android.test.runner" = java_library_static {
    name = "repackaged.android.test.runner";

    srcs = [
        "src/android/test/ActivityInstrumentationTestCase.java"
        "src/android/test/ActivityInstrumentationTestCase2.java"
        "src/android/test/ActivityTestCase.java"
        "src/android/test/ActivityUnitTestCase.java"
        "src/android/test/AndroidTestRunner.java"
        "src/android/test/ApplicationTestCase.java"
        "src/android/test/AssertionFailedError.java"
        "src/android/test/ClassPathPackageInfoSource.java"
        "src/android/test/ComparisonFailure.java"
        "src/android/test/InstrumentationTestRunner.java"
        "src/android/test/IsolatedContext.java"
        "src/android/test/LaunchPerformanceBase.java"
        "src/android/test/LoaderTestCase.java"
        "src/android/test/MoreAsserts.java"
        "src/android/test/NoExecTestResult.java"
        "src/android/test/ProviderTestCase.java"
        "src/android/test/ProviderTestCase2.java"
        "src/android/test/RenamingDelegatingContext.java"
        "src/android/test/ServiceTestCase.java"
        "src/android/test/SimpleCache.java"
        "src/android/test/SingleLaunchActivityTestCase.java"
        "src/android/test/SyncBaseInstrumentation.java"
        "src/android/test/TestCaseUtil.java"
        "src/android/test/TestPrinter.java"
        "src/android/test/TestSuiteProvider.java"
        "src/android/test/TouchUtils.java"
        "src/android/test/ViewAsserts.java"
        "src/android/test/suitebuilder/AssignableFrom.java"
        "src/android/test/suitebuilder/SmokeTestSuiteBuilder.java"
        "src/android/test/suitebuilder/TestGrouping.java"
        "src/android/test/suitebuilder/TestMethod.java"
        "src/android/test/suitebuilder/TestPredicates.java"
        "src/android/test/suitebuilder/TestSuiteBuilder.java"
        "src/android/test/suitebuilder/UnitTestSuiteBuilder.java"
        "src/junit/runner/BaseTestRunner.java"
        "src/junit/runner/StandardTestSuiteLoader.java"
        "src/junit/runner/TestRunListener.java"
        "src/junit/runner/TestSuiteLoader.java"
        "src/junit/runner/Version.java"
        "src/junit/runner/package-info.java"
        "src/junit/textui/ResultPrinter.java"
        "src/junit/textui/TestRunner.java"
        "src/junit/textui/package-info.java"
    ];
    exclude_srcs = [
        "src/android/test/ActivityUnitTestCase.java"
        "src/android/test/ApplicationTestCase.java"
        "src/android/test/IsolatedContext.java"
        "src/android/test/ProviderTestCase.java"
        "src/android/test/ProviderTestCase2.java"
        "src/android/test/RenamingDelegatingContext.java"
        "src/android/test/ServiceTestCase.java"
    ];

    sdk_version = "current";
    libs = [
        "android.test.base_static"
    ];

    jarjar_rules = "jarjar-rules.txt";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";
};

in { inherit "android.test.runner" "android.test.runner-minus-junit" "repackaged.android.test.runner"; }
