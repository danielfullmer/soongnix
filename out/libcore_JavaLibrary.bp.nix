{ droiddoc_exported_dir, droidstubs, filegroup, java_defaults, java_library, java_library_host, java_library_static, java_system_modules, java_test }:
let

#  Copyright (C) 2007 The Android Open Source Project
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
#  Definitions for building the Android core library and associated tests.
#

#  The Android core library provides low-level APIs for use by the rest of the
#  Android software stack. It is made up of various parts, some of which can be
#  found in libcore/ and other parts that can be found in various external/
#  directories. See the "core-system-modules" definition for the parts.

#  libcore has some sub-directories that follow a common structure:
#  e.g. dalvik, dom, harmony-tests, json, jsr166-tests, luni, libart, ojluni,
#  support, xml, xmlpull.
#
#  The structure of these is generally:
#
#    src/
#        main/               # To be shipped on every device.
#             java/          # Java source for library code.
#             native/        # C/C++ source for library code.
#             resources/     # Support files.
#        test/               # Built only on demand, for testing.
#             java/          # Java source for tests.
#             native/        # C/C++ source for tests (rare).
#             resources/     # Support files.
#
#  All subdirectories are optional.

build = [
    "openjdk_java_files.bp"
    "non_openjdk_java_files.bp"
];

#  The Java files and their associated resources.
core_resource_dirs = [
    "luni/src/main/java"
    "ojluni/src/main/resources/"
];

#  The source files that go into core-oj.
core_oj_java_files = filegroup {
    name = "core_oj_java_files";
    srcs = [":openjdk_java_files"];
};

#  OpenJDK source is not annotated with @hide so we need this separate
#  filegroup for just the parts that contribute to the API.
core_oj_api_files = filegroup {
    name = "core_oj_api_files";
    srcs = [":openjdk_javadoc_files"];
};

#  The source files that go into core-libart.
core_libart_java_files = filegroup {
    name = "core_libart_java_files";
    srcs = [
        ":non_openjdk_java_files"
        ":android_icu4j_src_files"
    ];
};

#  Some parts of libart are not annotated with @hide so we need this separate
#  filegroup for just the parts that contribute to the API.
core_libart_api_files = filegroup {
    name = "core_libart_api_files";
    srcs = [
        ":non_openjdk_javadoc_files"
        ":android_icu4j_src_files"
    ];
};

#  The set of files for the core library that have been marked up with @hide
#  for the public SDK APIs. Used from frameworks/base/ to indicate the source
#  files for inclusion in the public SDK docs.
core_public_api_files = filegroup {
    name = "core_public_api_files";
    srcs = [
        ":core_oj_api_files"
        ":core_libart_api_files"
        ":conscrypt_public_api_files"
    ];
};

#  The set of files for the core library that have been marked up with @hide and
#  API-related annotations. Note that this includes the intra-core and
#  core-platform APIs as well as the public APIs.
#
#  Some source files in :core_oj_api_files and :openjdk_mmodule_extra_files are
#  annotated by applying annotations to the .annotated.java stubs files in
#  ojluni/annotated/mmodules and rather than in the original source. See the comments
#  in openjdk_java_files.bp for more details.
core_api_files = filegroup {
    name = "core_api_files";
    srcs = [
        ":apache-xml_api_files"
        ":bouncycastle_java_files"
        ":conscrypt_java_files"
        ":core_oj_api_files"
        ":core_libart_api_files"
        ":okhttp_api_files"
        ":openjdk_mmodule_extra_files"
    ];
};

libcore_java_defaults = java_defaults {
    name = "libcore_java_defaults";
    javacflags = [
        # "-Xlint:all",
        # "-Xlint:-serial,-deprecation,-unchecked",
    ];
    dxflags = ["--core-library"];
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF" #  Ignore missing @Override.
            "-Xep:ConstantOverflow:WARN" #  Known constant overflow in SplittableRandom
        ];
    };
};

#
#  Build for the target (device).
#

#  Rule generating resource lib for android_icu4j.
#  In the downstream branch master-icu-dev, the resource files are generated.
#  This rule can't be moved external/icu because soong enforces that no_standard_libs:true can only
#  be used in libcore/ or development/
android_icu4j_resources_lib = java_library {
    name = "android_icu4j_resources_lib";
    java_resources = [":android_icu4j_resources"];
    no_standard_libs = true;
    system_modules = "none";
};

#  A target used to bootstrap compilation for the core library.
#  See core-all-system-modules for more details.
core-all = java_library {
    name = "core-all";
    defaults = ["libcore_java_defaults"];

    srcs = [
        ":core_oj_java_files"
        ":core_libart_java_files"
        ":openjdk_lambda_stub_files"
    ];

    no_standard_libs = true;
    system_modules = "none";
    openjdk9 = {
        srcs = ["luni/src/module/java/module-info.java"];
        javacflags = ["--patch-module=java.base=."];
    };

    java_resource_dirs = core_resource_dirs;
    static_libs = ["android_icu4j_resources_lib"];
    java_version = "1.9";

    installable = false;
};

#  A system modules definition for use by core library targets only. It only
#  contains the core-all jar, which contains the classes that end up in core-oj,
#  core-libart as well as the lambda stubs needed to compile Java lambda code.
#  It does not contain other parts of core library like conscrypt, bouncycastle,
#  etc. This system_modules definition is used to bootstrap compilation for
#  other parts of the core library like core-oj, core-libart, conscrypt,
#  bouncycastle, etc.
#
#  If you want to compile against the entire core library implementation, for
#  example to build core library tests, see "core-system-modules" instead.
core-all-system-modules = java_system_modules {
    name = "core-all-system-modules";
    libs = ["core-all"];
};

#  Contains the parts of core library associated with OpenJDK.
core-oj = java_library {
    name = "core-oj";
    defaults = ["libcore_java_defaults"];
    installable = true;
    hostdex = true;

    srcs = [":core_oj_java_files"];
    java_resource_dirs = core_resource_dirs;

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };

    jacoco = {
        exclude_filter = [
            "java.lang.Class"
            "java.lang.Long"
            "java.lang.Number"
            "java.lang.Object"
            "java.lang.String"
            "java.lang.invoke.MethodHandle"
            "java.lang.ref.Reference"
            "java.lang.reflect.Proxy"
            "java.util.AbstractMap"
            "java.util.HashMap"
            "java.util.HashMap$Node"
            "java.util.Map"
        ];
    };

    notice = "ojluni/NOTICE";

};

#  Contains parts of core library not associated with OpenJDK. Contains not
#  just java.*, javax.* code but also android.icu.*, android.system.* and
#  various internal libcore.* packages.
core-libart = java_library {
    name = "core-libart";
    defaults = ["libcore_java_defaults"];
    installable = true;
    hostdex = true;

    srcs = [":core_libart_java_files"];
    static_libs = ["android_icu4j_resources_lib"];
    java_version = "1.9";

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };

    jacoco = {
        exclude_filter = [
            "java.lang.DexCache"
            "dalvik.system.ClassExt"
        ];
    };

    required = [
        #  Device files put in /system.
        "tzdata"
        "tz_version"
        #  Files used to simulate the /system and runtime APEX dir
        #  structure on host.
        "tzdata_host"
        "tzdata_host_runtime_apex"
        "tzlookup.xml_host_runtime_apex"
        "tz_version_host"
        "tz_version_host_runtime_apex"
    ];
};

#  Provided solely to contribute information about which hidden parts of the
#  core-oj API are used by apps.
core-oj-hiddenapi = java_library {
    name = "core-oj-hiddenapi";
    defaults = ["libcore_java_defaults"];
    compile_dex = true;

    srcs = [":openjdk_hiddenapi_javadoc_files"];

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };
};

#
#  Guaranteed unstripped versions of core-oj and core-libart.
#
#  The build system may or may not strip the core-oj and core-libart jars,
#  but these will not be stripped. See b/24535627.
#

core-oj-testdex = java_library {
    name = "core-oj-testdex";
    installable = true;
    static_libs = ["core-oj"];
    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    dxflags = ["--core-library"];
    dex_preopt = {
        enabled = false;
    };
    java_version = "1.9";
    notice = "ojluni/NOTICE";
};

core-libart-testdex = java_library {
    name = "core-libart-testdex";
    installable = true;
    static_libs = ["core-libart"];
    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    dxflags = ["--core-library"];
    dex_preopt = {
        enabled = false;
    };
    notice = "ojluni/NOTICE";
};

core_lambda_stubs_defaults = java_defaults {
    name = "core_lambda_stubs_defaults";
    defaults = ["libcore_java_defaults"];
    hostdex = true;

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };

    notice = "ojluni/NOTICE";

    installable = false;
    include_srcs = true;
};

#  Creates a jar that exists to satisfy javac when compiling source code that
#  contains lambdas. This contains all classes / methods required by javac
#  when generating invoke-dynamic lambda implementation code, even those that
#  are also in the public SDK API from API level 26 onwards.
core-lambda-stubs = java_library {
    name = "core-lambda-stubs";
    defaults = ["core_lambda_stubs_defaults"];
    srcs = [
        ":openjdk_lambda_stub_files"
        ":openjdk_lambda_duplicate_stub_files"
    ];
};

#  An alternative to core-lambda-stubs that omits openjdk_lambda_duplicate_stub_files
#  because those classes are also part of the core library public SDK API
#  (since API level 26).
core-lambda-stubs-for-system-modules = java_library {
    name = "core-lambda-stubs-for-system-modules";
    defaults = ["core_lambda_stubs_defaults"];
    srcs = [
        ":openjdk_lambda_stub_files"
    ];
};

#  A system modules definition containing the implementations for the various
#  parts that make up the core library.
#
#  This system module is intended for use by tests that may need access to
#  core library internals. It should not be generally used; most of the
#  platform build should build against API stubs instead. See
#  "core-platform-api-stubs-system-modules", which is the default used by the
#  Android build.
#
#  This module also includes lambda stubs for compiling source containing
#  Java lambdas.
core-system-modules = java_system_modules {
    name = "core-system-modules";
    libs = [
        "core-oj"
        "core-libart"
        "bouncycastle"
        "conscrypt"
        "okhttp"
        "apache-xml"
        #  This one is not on device but it's needed when javac compiles code
        #  containing lambdas.
        "core-lambda-stubs-for-system-modules"
    ];
};

#  Builds libcore test rules
core-test-rules = java_library_static {
    name = "core-test-rules";
    hostdex = true;
    srcs = [
        "dalvik/test-rules/src/main/**/*.java"
        "test-rules/src/main/**/*.java"
    ];
    static_libs = ["junit"];

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
};

#  Builds the core-tests-support library used by various tests.
core-tests-support = java_library_static {
    name = "core-tests-support";
    hostdex = true;
    srcs = ["support/src/test/java/**/*.java"];

    no_framework_libs = true;
    libs = ["junit"];
    static_libs = [
        "bouncycastle-unbundled"
        "bouncycastle-bcpkix-unbundled"
        "bouncycastle-ocsp-unbundled"
    ];
};

#  Builds the jsr166-tests library.
jsr166-tests = java_test {
    name = "jsr166-tests";
    srcs = ["jsr166-tests/src/test/java/**/*.java"];
    no_standard_libs = true;
    libs = [
        "core-all"
        "junit"
    ];
    system_modules = "core-all-system-modules";
};

#  Builds a library just containing files from luni/src/test/filesystems
#  for use in tests.
filesystemstest = java_library {
    name = "filesystemstest";
    compile_dex = true;
    srcs = ["luni/src/test/filesystems/src/**/*.java"];
    java_resource_dirs = ["luni/src/test/filesystems/resources"];
    no_framework_libs = true;
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

#  Builds a library just containing files from luni/src/test/parameter_metadata
#  for use in tests.
parameter-metadata-test = java_library {
    name = "parameter-metadata-test";
    compile_dex = true;
    srcs = ["luni/src/test/parameter_metadata/src/**/*.java"];
    no_framework_libs = true;
    javacflags = ["-parameters"];
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
};

#  Builds the core-tests library.
core-tests = java_test {
    name = "core-tests";
    defaults = ["libcore_java_defaults"];
    hostdex = true;
    srcs = [
        "dalvik/src/test/java/**/*.java"
        "dalvik/test-rules/src/test/java/**/*.java"
        "dom/src/test/java/**/*.java"
        "harmony-tests/src/test/java/**/*.java"
        "json/src/test/java/**/*.java"
        "luni/src/test/java/**/*.java"
        "test-rules/src/test/java/**/*.java"
        "xml/src/test/java/**/*.java"
    ];
    exclude_srcs = [
        "luni/src/test/java/libcore/java/util/zip/Zip64Test.java"
        "luni/src/test/java/libcore/java/util/zip/Zip64FileTest.java"
    ];

    java_resource_dirs = [
        "*/src/test/java"
        "*/src/test/resources"
    ];
    exclude_java_resource_dirs = [
        "ojluni/src/test/java"
        "ojluni/src/test/resources"
    ];

    java_resources = [
        ":filesystemstest"
        ":parameter-metadata-test"
    ];

    no_standard_libs = true;
    libs = [
        "core-all"
        "okhttp"
        "bouncycastle"
    ];
    system_modules = "core-all-system-modules";

    static_libs = [
        "archive-patcher"
        "core-test-rules"
        "core-tests-support"
        "junit-params"
        "mockftpserver"
        "mockito-target"
        "mockwebserver"
        "nist-pkix-tests"
        "slf4j-jdk14"
        "sqlite-jdbc"
        "tzdata-testing"
        "truth-prebuilt"
    ];

    errorprone = {
        javacflags = [
            "-Xep:TryFailThrowable:ERROR"
            "-Xep:ComparisonOutOfRange:ERROR"
        ];
    };

    test_config = "AndroidTest-core-tests.xml";
};

#  Builds the core-ojtests library that contains test code from OpenJDK.
core-ojtests = java_test {
    name = "core-ojtests";
    defaults = ["libcore_java_defaults"];
    hostdex = true;

    srcs = [
        "ojluni/src/test/java/**/*.java"
    ];
    java_resource_dirs = [
        "ojluni/src/test/java"
        "ojluni/src/test/resources"
    ];

    no_standard_libs = true;
    libs = [
        "core-all"
        "okhttp"
        "bouncycastle"
    ];
    system_modules = "core-all-system-modules";

    static_libs = ["testng"];

    #  ojluni/src/test/java/util/stream/{bootlib,boottest}
    #  contains tests that are in packages from java.base;
    #  By default, OpenJDK 9's javac will only compile such
    #  code if it's declared to also be in java.base at
    #  compile time.
    #
    #  For now, we use --patch-module to put all sources
    #  and dependencies from this make target into java.base;
    #  other source directories in this make target are in
    #  packages not from java.base; if this becomes a problem
    #  in future, this could be addressed eg. by splitting
    #  boot{lib,test} out into a separate make target,
    #  deleting those tests or moving them to a different
    #  package.
    patch_module = "java.base";
};

#  Builds the core-ojtests-public library. Excludes any private API tests.
#  Like core-ojtests but smaller.
core-ojtests-public = java_test {
    name = "core-ojtests-public";
    defaults = ["libcore_java_defaults"];
    srcs = [
        "ojluni/src/test/java/**/*.java"
    ];
    #  Filter out the following:
    #  1.) DeserializeMethodTest and SerializedLambdaTest, because they depends on stub classes
    #      and won't actually run, and
    #  2.) util/stream/boot*. Those directories contain classes in the package java.util.stream;
    #      excluding them means we don't need patch_module: "java.base"
    exclude_srcs = [
        "**/DeserializeMethodTest.java"
        "**/SerializedLambdaTest.java"
        "ojluni/src/test/java/util/stream/boot*/**/*"
    ];
    java_resource_dirs = [
        "ojluni/src/test/java"
        "ojluni/src/test/resources"
        #  Include source code as part of JAR
        "ojluni/src/test/dist"
    ];

    no_standard_libs = true;
    libs = [
        "core-all"
        "bouncycastle"
        "okhttp"
        "testng"
    ];
    system_modules = "core-all-system-modules";
};

#  Exports annotated stubs source files in ojluni/annotations/sdk to make them
#  available to metalava. Used for nullability annotations in OpenJDK source.
ojluni-annotated-sdk-stubs = droiddoc_exported_dir {
    name = "ojluni-annotated-sdk-stubs";
    path = "ojluni/annotations/sdk";
};

ojluni-annotated-nullability-stubs = droiddoc_exported_dir {
    name = "ojluni-annotated-nullability-stubs";
    path = "ojluni/annotations/sdk/nullability";
};

#  Exports annotated stubs source files in ojluni/annotations/mmodules to make
#  them available to metalava. Used for core platform API and intra-code API
#  annotations in OpenJDK source.
ojluni-annotated-mmodule-stubs = droiddoc_exported_dir {
    name = "ojluni-annotated-mmodule-stubs";
    path = "ojluni/annotations/mmodule";
};

#  A file containing the list of tags that are "known" to us from the OpenJdk
#  source code and so should not cause an error or warning.
known-oj-tags = filegroup {
    name = "known-oj-tags";
    srcs = [
        "known_oj_tags.txt"
    ];
};

#  Generates stubs for the parts of the public SDK API provided by the core
#  library.
#
#  Only for use by core.current.stubs target below.
core-current-stubs-gen = droidstubs {
    name = "core-current-stubs-gen";
    srcs = [":core_api_files"];
    java_version = "1.9";
    installable = false;
    no_framework_libs = true;
    args = " --exclude-annotations " +
        "--hide-annotation libcore.api.Hide";
    merge_inclusion_annotations_dirs = ["ojluni-annotated-mmodule-stubs"];
};

#  A stubs target containing the parts of the public SDK API provided by the
#  core library.
#
#  Don't use this directly, use "sdk_version: core_current".
"core.current.stubs" = java_library {
    name = "core.current.stubs";
    srcs = [":core-current-stubs-gen"];
    errorprone = {
        javacflags = [
            "-Xep:MissingOverride:OFF"
        ];
    };
    openjdk9 = {
        javacflags = ["--patch-module=java.base=."];
    };
    no_standard_libs = true;
    system_modules = "none";

    dist = {
        targets = [
            "sdk"
            "win_sdk"
        ];
    };
};

#  Target for validating nullability annotations for correctness and
#  completeness. To check that there are no nullability errors:
#    make core-current-stubs-nullability-validation
#  To check that there are only the expected nullability warnings:
#    make core-current-stubs-nullability-validation-check-nullability-warnings
#  To update the the list of known expected nullability warnings:
#    make core-current-stubs-nullability-validation-update-nullability-warnings
core-current-stubs-nullability-validation = droidstubs {
    name = "core-current-stubs-nullability-validation";
    srcs = [":core_api_files"];
    installable = false;
    no_framework_libs = true;
    annotations_enabled = true;
    args = "--hide-annotation libcore.api.Hide " +
        "--validate-nullability-from-merged-stubs ";
    merge_inclusion_annotations_dirs = ["ojluni-annotated-mmodule-stubs"];
    merge_annotations_dirs = [
        "metalava-manual"
        #  N.B. Stubs in this filegroup will be validated:
        "ojluni-annotated-nullability-stubs"
    ];
    #  The list of classes which have nullability annotations included in the source.
    #  (This is in addition to those which have annotations in the merged stubs.)
    validate_nullability_from_list = "nullability_annotated_classes.txt";
    #  The expected set of warnings about missing annotations:
    check_nullability_warnings = "nullability_warnings.txt";
};

#  A host library containing time zone related classes. Used for
#  host-side tools and tests that have to deal with Android
#  time zone data.
timezone-host = java_library_host {
    name = "timezone-host";
    srcs = [":timezone_host_files"];
};

in { inherit "core.current.stubs" android_icu4j_resources_lib core-all core-all-system-modules core-current-stubs-gen core-current-stubs-nullability-validation core-lambda-stubs core-lambda-stubs-for-system-modules core-libart core-libart-testdex core-oj core-oj-hiddenapi core-oj-testdex core-ojtests core-ojtests-public core-system-modules core-test-rules core-tests core-tests-support core_api_files core_lambda_stubs_defaults core_libart_api_files core_libart_java_files core_oj_api_files core_oj_java_files core_public_api_files filesystemstest jsr166-tests known-oj-tags libcore_java_defaults ojluni-annotated-mmodule-stubs ojluni-annotated-nullability-stubs ojluni-annotated-sdk-stubs parameter-metadata-test timezone-host; }
