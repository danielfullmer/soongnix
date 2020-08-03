{ droidstubs, java_library, java_library_host }:
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

#  Build jacoco-agent from sources for the platform
#
#  Note: this is only intended to be used for the platform development. This is *not* intended
#  to be used in the SDK where apps can use the official jacoco release.
jacocoagent = java_library {
    name = "jacocoagent";
    installable = true;

    srcs = [
        "org.jacoco.core/src/**/*.java"
        "org.jacoco.agent/src/**/*.java"
        "org.jacoco.agent.rt/src/**/*.java"
    ];

    #  Some Jacoco source files depend on classes that do not exist in Android.
    #  While these classes are not executed at runtime (because we use offline
    #  instrumentation), they will cause issues when compiling them with ART
    #  during dex pre-opting. Therefore, it would prevent from applying code
    #  coverage on classes in the bootclasspath (frameworks, services, ...) or
    #  system apps.
    #  Note: we still may need to update the source code to cut dependencies in
    #  mandatory jacoco classes.
    exclude_srcs = [
        "org.jacoco.core/src/org/jacoco/core/runtime/ModifiedSystemClassRuntime.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/PreMain.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/CoverageTransformer.java"
        "org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/JmxRegistration.java"
    ];

    #  In order to include Jacoco in core libraries, we cannot depend on
    #  anything in the bootclasspath (or we would create dependency cycle).
    #  Therefore we compile against the SDK android.jar which gives the same
    #  APIs Jacoco depends on.
    sdk_version = "9";

    #  TODO(b/69671801): there's no bytecode on the device, so these shouldn't
    #  be necessary.
    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "asm-tree-6.0"
    ];
};

#  Generates stubs containing the classes that will be referenced by instrumented bytecode.
jacoco-stubs-gen = droidstubs {
    name = "jacoco-stubs-gen";
    srcs = ["org.jacoco.agent.rt/src/org/jacoco/agent/rt/internal/Offline.java"];
};

#  A stubs target containing the parts of JaCoCo that we need to add to the hidden API whitelist.
jacoco-stubs = java_library {
    name = "jacoco-stubs";
    compile_dex = true;
    srcs = [":jacoco-stubs-gen"];
};

#  Build jacoco-cli from sources for the platform

#  TODO(jeffrygaston) it'd be nice to keep the build process and/or list of source files in sync with
#  what is defined in the pom.xml files, although it's probably much more trouble than it's worth
jacoco-cli = java_library_host {
    name = "jacoco-cli";

    manifest = "org.jacoco.cli/src/MANIFEST.MF";

    srcs = [
        "org.jacoco.core/src/**/*.java"
        "org.jacoco.report/src/**/*.java"
        "org.jacoco.cli/src/**/*.java"
    ];

    java_resource_dirs = [
        "org.jacoco.core/src"
        "org.jacoco.report/src"
    ];

    static_libs = [
        "asm-6.0"
        "asm-commons-6.0"
        "asm-tree-6.0"
        "args4j-2.0.28"
    ];

    dist = {
        targets = [
            "dist_files"
            "apps_only"
        ];
    };
};

in { inherit jacoco-cli jacoco-stubs jacoco-stubs-gen jacocoagent; }
