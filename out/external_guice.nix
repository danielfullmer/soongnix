{ filegroup, genrule, java_binary_host, java_library_static }:
let

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

#
#  Build support for guice within the Android Open Source Project
#  See https://source.android.com/source/building.html for more information
#

# ##################################
#            Guice                 #
# ##################################

#
#  Builds the 'no_aop' flavor for Android.
#  -- see core/pom.xml NO_AOP rule.
#

guice_srcs = filegroup {
    name = "guice_srcs";
    srcs = ["core/src/**/*.java"];
    exclude_srcs = [
        "core/src/com/google/inject/spi/InterceptorBinding.java"
        "core/src/com/google/inject/internal/InterceptorBindingProcessor.java"
        "core/src/com/google/inject/internal/InterceptorStackCallback.java"
        "core/src/com/google/inject/internal/InterceptorStackCallback.java"
        "core/src/com/google/inject/internal/util/LineNumbers.java"
        "core/src/com/google/inject/internal/MethodAspect.java"
        "core/src/com/google/inject/internal/ProxyFactory.java"
    ];
};

guice_test_src_files = filegroup {
    name = "guice_test_src_files";
    srcs = ["core/test/**/*.java"];
    exclude_srcs = [
        "core/test/com/googlecode/guice/BytecodeGenTest.java"
        "core/test/com/google/inject/IntegrationTest.java"
        "core/test/com/google/inject/MethodInterceptionTest.java"
        "core/test/com/google/inject/internal/ProxyFactoryTest.java"
    ];
};

#  Copy munge.jar to a srcjar.
#  Remove MungeTask.java, which is missing ant dependencies in Android.
guice_munge_srcjar = genrule {
    name = "guice_munge_srcjar";
    out = ["guice_munge.srcjar"];
    srcs = ["lib/build/munge.jar"];
    cmd = "zip --temp-path $${TMPDIR:-/tmp} $(in) -O $(out) -d MungeTask.java";
};

guice_munge_manifest = genrule {
    name = "guice_munge_manifest";
    out = ["guice_munge.manifest"];
    srcs = ["lib/build/munge.jar"];
    cmd = "unzip -qc $(in) META-INF/MANIFEST.MF > $(out)";
};

guice_munge = java_binary_host {
    name = "guice_munge";
    srcs = [":guice_munge_srcjar"];
    manifest = ":guice_munge_manifest";
    libs = ["junit"];
};

guice_munged_srcs = genrule {
    name = "guice_munged_srcs";
    srcs = [":guice_srcs"];
    out = ["guice_munged_srcs.srcjar"];
    tools = [
        "guice_munge"
        "soong_zip"
    ];
    cmd = "for src in $(in); do " +
        "  mkdir -p $$(dirname $(genDir)/$${src}) && " +
        "  $(location guice_munge) -DNO_AOP $${src} > $(genDir)/$${src} || exit 1; " +
        " done && " +
        " $(location soong_zip) -o $(out) -C $(genDir) -D $(genDir)";
};

#  Target-side Dalvik, host-side, and host-side Dalvik build

guice = java_library_static {
    name = "guice";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [":guice_munged_srcs"];
    static_libs = [
        "guava"
        "jsr330"
    ];
};

#  Variation that doesn't link guava statically
guice-no-guava = java_library_static {
    name = "guice-no-guava";
    host_supported = true;
    hostdex = true;
    sdk_version = "core_current";
    srcs = [":guice_munged_srcs"];
    libs = [
        "guava"
    ];
    static_libs = [
        "jsr330"
    ];
};

#  TODO: Consider adding tests.

in { inherit guice guice-no-guava guice_munge guice_munge_manifest guice_munge_srcjar guice_munged_srcs guice_srcs guice_test_src_files; }
