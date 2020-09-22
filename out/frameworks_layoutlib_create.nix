{ java_binary_host }:
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

layoutlib_create = java_binary_host {
    name = "layoutlib_create";

    srcs = [
        "src/com/android/tools/layoutlib/annotations/LayoutlibDelegate.java"
        "src/com/android/tools/layoutlib/annotations/Nullable.java"
        "src/com/android/tools/layoutlib/annotations/VisibleForTesting.java"
        "src/com/android/tools/layoutlib/create/AbstractClassAdapter.java"
        "src/com/android/tools/layoutlib/create/AfterConstructorMethodAdapter.java"
        "src/com/android/tools/layoutlib/create/AsmAnalyzer.java"
        "src/com/android/tools/layoutlib/create/AsmGenerator.java"
        "src/com/android/tools/layoutlib/create/ChangeFileVersionAdapter.java"
        "src/com/android/tools/layoutlib/create/ClassHasNativeVisitor.java"
        "src/com/android/tools/layoutlib/create/CreateInfo.java"
        "src/com/android/tools/layoutlib/create/DelegateClassAdapter.java"
        "src/com/android/tools/layoutlib/create/DelegateMethodAdapter.java"
        "src/com/android/tools/layoutlib/create/DependencyFinder.java"
        "src/com/android/tools/layoutlib/create/ICreateInfo.java"
        "src/com/android/tools/layoutlib/create/InjectMethodRunnables.java"
        "src/com/android/tools/layoutlib/create/InjectMethodsAdapter.java"
        "src/com/android/tools/layoutlib/create/JarUtil.java"
        "src/com/android/tools/layoutlib/create/Log.java"
        "src/com/android/tools/layoutlib/create/LogAbortException.java"
        "src/com/android/tools/layoutlib/create/Main.java"
        "src/com/android/tools/layoutlib/create/MethodAdapter.java"
        "src/com/android/tools/layoutlib/create/MethodListener.java"
        "src/com/android/tools/layoutlib/create/OverrideMethod.java"
        "src/com/android/tools/layoutlib/create/PromoteClassClassAdapter.java"
        "src/com/android/tools/layoutlib/create/PromoteFieldClassAdapter.java"
        "src/com/android/tools/layoutlib/create/RefactorClassAdapter.java"
        "src/com/android/tools/layoutlib/create/RenameClassAdapter.java"
        "src/com/android/tools/layoutlib/create/ReplaceMethodCallsAdapter.java"
        "src/com/android/tools/layoutlib/create/StubCallMethodAdapter.java"
        "src/com/android/tools/layoutlib/create/StubClassAdapter.java"
        "src/com/android/tools/layoutlib/create/StubExceptionMethodAdapter.java"
        "src/com/android/tools/layoutlib/java/LinkedHashMap_Delegate.java"
        "src/com/android/tools/layoutlib/java/System_Delegate.java"
    ];

    main_class = "com.android.tools.layoutlib.create.Main";
    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "guava"
        "layoutlib-common"
    ];
};

in { inherit layoutlib_create; }
