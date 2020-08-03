{ droiddoc_host, droidstubs_host, java_defaults, java_library_host }:
let

#  Copyright 2018 The Android Open Source Project
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

#  Set of error prone rules to ensure code quality
#  PackageLocation check requires the androidCompatible=false otherwise it does not do anything.
tradefed_errorprone_defaults = java_defaults {
    name = "tradefed_errorprone_defaults";
    errorprone = {
        javacflags = [
            "-XDandroidCompatible=false"
            "-Xep:ArrayToString:ERROR"
            "-Xep:BoxedPrimitiveConstructor:ERROR"
            "-Xep:ConstantField:ERROR"
            "-Xep:DeadException:ERROR"
            "-Xep:EqualsIncompatibleType:ERROR"
            "-Xep:ExtendingJUnitAssert:ERROR"
            "-Xep:FormatString:ERROR"
            "-Xep:GetClassOnClass:ERROR"
            "-Xep:IdentityBinaryExpression:ERROR"
            "-Xep:JUnit3TestNotRun:ERROR"
            "-Xep:JUnit4ClassUsedInJUnit3:ERROR"
            "-Xep:JUnitAmbiguousTestClass:ERROR"
            "-Xep:MissingFail:ERROR"
            "-Xep:MissingOverride:ERROR"
            "-Xep:ModifiedButNotUsed:ERROR"
            "-Xep:MustBeClosedChecker:ERROR"
            "-Xep:Overrides:ERROR"
            "-Xep:PackageLocation:ERROR"
            "-Xep:ParameterName:ERROR"
            "-Xep:ReferenceEquality:ERROR"
            "-Xep:RemoveUnusedImports:ERROR"
            "-Xep:ReturnValueIgnored:ERROR"
            "-Xep:SelfEquals:ERROR"
            "-Xep:SizeGreaterThanOrEqualsZero:ERROR"
            "-Xep:TryFailThrowable:ERROR"
        ];
    };
};

tradefed_defaults = java_defaults {
    name = "tradefed_defaults";
    defaults = ["tradefed_errorprone_defaults"];
    javacflags = [
        "-g"
        "-Xlint"
    ];
};

tradefed-protos = java_library_host {
    name = "tradefed-protos";
    srcs = ["proto/**/*.proto"];
    libs = [
        "libprotobuf-java-full"
    ];
    proto = {
        include_dirs = ["external/protobuf/src"];
        type = "full";
    };
    static_libs = [
        "platformprotos"
        "asuite_proto_java"
    ];
};

tradefed = java_library_host {
    name = "tradefed";
    defaults = ["tradefed_defaults"];
    srcs = [
        "src/**/*.java"
        "clearcut_client/**/*.java"
    ];
    java_resource_dirs = [
        "res"
    ];
    openjdk9 = {
        javacflags = [
            "--add-modules=java.xml.bind"
        ];
    };
    static_libs = [
        "protobuf-java-util-prebuilt-jar"
        "aoa-helper"
        "commons-compress-prebuilt"
        "error_prone_annotations-2.0.18"
        "google-api-java-client-min-repackaged"
        "google-api-services-compute"
        "google-api-services-storage"
        "gson-prebuilt-jar"
        "guice"
        "jacoco-cli"
        "jline-1.0"
        "junit"
        "junit-params"
        "kxml2-2.3.0"
        "libprotobuf-java-full"
        "longevity-host-lib"
        "perfetto_config-full"
        "platform-test-annotations"
        "test-composers"
        "tf-remote-client"
        "tradefed-protos"
    ];
    libs = [
        "loganalysis"
    ];
    manifest = "MANIFEST.mf";
};

#  Turn off various doclava warnings when generating
#  the docs. These are the same warnings that are
#  turned off in frameworks/base, plus error 101
#  which is necessary here because tradefed is
#  referencing bootclasspath classes that are not
#  feed to metalava when generating the stubs.
tradefed_docs_only_args = " -hide 101 -hide 111 -hide 113 -hide 125 -hide 126 -hide 127 -hide 128 ";

tradefed-doc-stubs = droidstubs_host {
    name = "tradefed-doc-stubs";
    srcs = [
        "src/**/*.java"
    ];
    libs = [
        "loganalysis"
        "tradefed"
    ];
    args = tradefed_docs_only_args + "--package";
    create_doc_stubs = true;
};

tradefed-docs = droiddoc_host {
    name = "tradefed-docs";
    srcs = [
        ":tradefed-doc-stubs"
    ];
    libs = [
        "loganalysis"
        "tradefed"
    ];
    custom_template = "droiddoc-templates-sdk";
    hdf = [
        "sac true"
        "devices true"
        "android.whichdoc online"
        "css.path /reference/assets/css/doclava-devsite.css"
        "book.root toc"
        "book.path /_book.yaml"
    ];
    args = tradefed_docs_only_args +
        "-yaml _book.yaml " +
        "-apidocsdir reference/tradefed/ " +
        "-werror " +
        "-package " +
        "-devsite ";
    create_stubs = false;
};

in { inherit tradefed tradefed-doc-stubs tradefed-docs tradefed-protos tradefed_defaults tradefed_errorprone_defaults; }
