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

#  Build rules for the APIs that the various core libraries can depend on from
#  each other: public SDK APIs and "intra-core" APIs. Intra-core APIs are not
#  for use by other parts of the Android software stack.

#  Generates stub source files for the {public SDK + intra-core} API
#  of the core jars.
core-intra-stubs = droidstubs {
    name = "core-intra-stubs";
    srcs = [":core_api_files"];
    no_standard_libs = true;
    libs = ["core-all"];

    installable = false;
    args = "--hide-annotation libcore.api.Hide " +
        "--show-single-annotation libcore.api.IntraCoreApi " +
        "--skip-annotation-instance-methods=false ";
    merge_inclusion_annotations_dirs = ["ojluni-annotated-mmodule-stubs"];

    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    previous_api = "previous.txt";
    check_api = {
        current = {
            api_file = "api/intra/current-api.txt";
            removed_api_file = "api/intra/current-removed.txt";
        };
        last_released = {
            api_file = "api/intra/last-api.txt";
            removed_api_file = "api/intra/last-removed.txt";
        };
    };
};

#  A library containing the {public SDK + intra-core} API stubs for the
#  core jars.
"core.intra.stubs" = java_library {
    name = "core.intra.stubs";
    srcs = [":core-intra-stubs"];

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };
};

#  Used when compiling against core.intra.stubs.
core-intra-stubs-system-modules = java_system_modules {
    name = "core-intra-stubs-system-modules";
    libs = ["core.intra.stubs"];
};

#  A rule that checks we can build core-libart and core-oj using only the source
#  for core-libart and core-oj and the APIs in core-intra-stubs. This proves we
#  don't actually depend on things from (for example) conscrypt we haven't added
#  to the intra-core API.
"core-libart-oj.depscheck" = java_library {
    name = "core-libart-oj.depscheck";
    srcs = [
        ":core_libart_java_files"
        ":core_oj_java_files"
    ];
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF" #  Ignore missing @Override.
            "-Xep:ConstantOverflow:WARN" #  Known constant overflow in SplittableRandom
        ];
    };

    installable = false;

    no_standard_libs = true;
    libs = ["core.intra.stubs"];
    system_modules = "core-intra-stubs-system-modules";
    java_version = "1.9";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };
};

in { inherit "core-libart-oj.depscheck" "core.intra.stubs" core-intra-stubs core-intra-stubs-system-modules; }
