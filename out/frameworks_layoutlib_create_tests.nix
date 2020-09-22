{ java_library_host, java_test_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

layoutlib-create-tests = java_test_host {
    name = "layoutlib-create-tests";

    #  Only compile source java files in this lib.
    srcs = [
        "src/com/android/tools/layoutlib/create/AsmAnalyzerTest.java"
        "src/com/android/tools/layoutlib/create/AsmGeneratorTest.java"
        "src/com/android/tools/layoutlib/create/ClassHasNativeVisitorTest.java"
        "src/com/android/tools/layoutlib/create/CreateInfoAdapter.java"
        "src/com/android/tools/layoutlib/create/DelegateClassAdapterTest.java"
        "src/com/android/tools/layoutlib/create/LogTest.java"
        "src/com/android/tools/layoutlib/create/MockLog.java"
        "src/com/android/tools/layoutlib/create/PromoteClassClassAdapterTest.java"
        "src/com/android/tools/layoutlib/create/RefactorClassAdapterTest.java"
        "src/com/android/tools/layoutlib/create/RenameClassAdapterTest.java"
        "src/com/android/tools/layoutlib/create/StubClassAdapterTest.java"
        "src/com/android/tools/layoutlib/create/StubMethodAdapterTest.java"
        "src/com/android/tools/layoutlib/create/TestClassLoader.java"
        "src/com/android/tools/layoutlib/create/dataclass/ClassWithNative.java"
        "src/com/android/tools/layoutlib/create/dataclass/ClassWithNative_Delegate.java"
        "src/com/android/tools/layoutlib/create/dataclass/JavaClass.java"
        "src/com/android/tools/layoutlib/create/dataclass/OuterClass.java"
        "src/com/android/tools/layoutlib/create/dataclass/OuterClass_Delegate.java"
        "src/com/android/tools/layoutlib/create/dataclass/OuterClass_InnerClass_Delegate.java"
        "src/com/android/tools/layoutlib/create/dataclass/OuterClass_StaticInnerClass_Delegate.java"
        "src/com/android/tools/layoutlib/create/dataclass/StubClass.java"
        "src/com/android/tools/layoutlib/create/dataclass/UsageClass.java"
    ];

    java_resource_dirs = ["res"];

    libs = [
        "layoutlib_create"
        "junit"
        "hamcrest"
    ];
    static_libs = ["asm-6.0"];

    #  Copy the jar to DIST_DIR for sdk builds
    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
    };
};

mock_android = java_library_host {
    name = "mock_android";

    srcs = [
        "res/mock_data/mock_android/dummy/DummyClass.java"
        "res/mock_data/mock_android/dummy/InnerTest.java"
        "res/mock_data/mock_android/dummy/subpackage/SubpackageClassA.java"
        "res/mock_data/mock_android/dummy/subpackage/SubpackageClassB.java"
        "res/mock_data/mock_android/dummy/subpackage/SubpackageClassC.java"
        "res/mock_data/mock_android/dummy2/DummyClass.java"
        "res/mock_data/mock_android/dummy2/keep/DoNotRemove.java"
        "res/mock_data/mock_android/util/EmptyArray.java"
        "res/mock_data/mock_android/util/NotNeeded.java"
        "res/mock_data/mock_android/view/View.java"
        "res/mock_data/mock_android/view/ViewGroup.java"
        "res/mock_data/mock_android/widget/LinearLayout.java"
        "res/mock_data/mock_android/widget/TableLayout.java"
        "res/mock_data/notjava/lang/JavaClass.java"
    ];
    java_resource_dirs = ["res/mock_data"];
};

in { inherit layoutlib-create-tests mock_android; }
