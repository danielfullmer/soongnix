{ filegroup, java_library_host, java_plugin, java_test_host }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

java_api_finder = java_plugin {
    name = "java_api_finder";

    static_libs = [
        "java_api_used_by_mainline_module"
    ];
};

java_api_used_by_mainline_module = java_library_host {
    name = "java_api_used_by_mainline_module";

    srcs = ["src/main/com/android/apifinder/JavaApiUsedByMainlineModule.java"];

    static_libs = [
        "//external/error_prone:error_prone_core"
        "//external/dagger2:dagger2-auto-service"
    ];

    plugins = [
        "//external/dagger2:dagger2-auto-service"
    ];

    javacflags = ["-verbose"];
};

JavaApiUsedByMainlineModuleTest = java_test_host {
    name = "JavaApiUsedByMainlineModuleTest";
    srcs = ["src/test/com/android/apifinder/JavaApiUsedByMainlineModuleTest.java"];
    java_resource_dirs = ["src/test/res"];
    java_resources = [":java_api_used_by_mainline_module_testdata"];
    static_libs = [
        "java_api_used_by_mainline_module"
        "error_prone_test_helpers"
        "hamcrest-library"
        "hamcrest"
        "platform-test-annotations"
        "junit"
    ];
};

java_api_used_by_mainline_module_testdata = filegroup {
    name = "java_api_used_by_mainline_module_testdata";
    path = "src/test/res";
    srcs = ["src/test/res/com/android/apifinder/JavaApiUsedByMainlineModuleCases.java"];
};

in { inherit JavaApiUsedByMainlineModuleTest java_api_finder java_api_used_by_mainline_module java_api_used_by_mainline_module_testdata; }
