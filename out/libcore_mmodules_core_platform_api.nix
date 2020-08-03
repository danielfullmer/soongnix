{ droidstubs, java_library, java_system_modules }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

#  Build rules for the APIs that various core libraries provide to other parts
#  of the Android software stack: these include the public SDK APIs plus some
#  "core platform APIs" that only the Android software stack can use.

#  Generates stub source files for the {public SDK + core platform} API of the
#  core jars.
core-platform-api-stubs = droidstubs {
    name = "core-platform-api-stubs";
    srcs = [":core_api_files"];
    no_standard_libs = true;

    installable = false;
    args = "--hide-annotation libcore.api.Hide " +
        "--show-single-annotation libcore.api.CorePlatformApi " +
        "--skip-annotation-instance-methods=false ";
    merge_inclusion_annotations_dirs = ["ojluni-annotated-mmodule-stubs"];

    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    previous_api = "previous.txt";

    check_api = {
        current = {
            api_file = "api/platform/current-api.txt";
            removed_api_file = "api/platform/current-removed.txt";
        };
        last_released = {
            api_file = "api/platform/last-api.txt";
            removed_api_file = "api/platform/last-removed.txt";
        };
    };
};

#  A library containing the {public SDK + core platform} API stubs for the core jars.
#
#  Although this stubs library is primarily used by the Java compiler / build to indicate
#  the core platform API surface area, compile_dex: true is used so that the Core Platform
#  API annotations are available to the dex tools that enable enforcement of runtime
#  accessibility. b/119068555
"core.platform.api.stubs" = java_library {
    name = "core.platform.api.stubs";
    srcs = [":core-platform-api-stubs"];
    hostdex = true;
    compile_dex = true;

    no_standard_libs = true;
    system_modules = "none";
    patch_module = "java.base";
};

#  Used when compiling higher-level code against core.platform.api.stubs.
core-platform-api-stubs-system-modules = java_system_modules {
    name = "core-platform-api-stubs-system-modules";
    libs = [
        "core.platform.api.stubs"
        #  This one is not on device but it's needed when javac compiles code
        #  containing lambdas.
        "core-lambda-stubs-for-system-modules"
    ];
};

in { inherit "core.platform.api.stubs" core-platform-api-stubs core-platform-api-stubs-system-modules; }
