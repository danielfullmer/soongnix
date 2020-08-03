{ genrule, java_defaults, java_genrule, java_import, java_library, java_library_host, java_library_static, java_test }:
let

#
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
#

icu4j-defaults = java_defaults {
    name = "icu4j-defaults";
    host_supported = true;
    hostdex = true;

    #  Use the same Java language version in the Android build configuration as used
    #  in main/shared/build/common.properties for the ICU4J build configuration.
    java_version = "1.7";
};

icu4j = java_library {
    name = "icu4j";
    defaults = ["icu4j-defaults"];

    srcs = ["main/classes/**/*.java"];
    java_resource_dirs = ["main/classes/*/src"];

    #  User-supplied locale service providers (using the java.text.spi or
    #  java.util.spi mechanisms) are not supported in Android:
    #
    #  http://developer.android.com/reference/java/util/Locale.html
    exclude_srcs = ["main/classes/localespi/**/*.java"];
    exclude_java_resource_dirs = ["main/classes/localespi/src"];

    static_libs = [
        "icu4j-icudata"
        "icu4j-icutzdata"
    ];
};

icu4j-tests = java_test {
    name = "icu4j-tests";
    defaults = ["icu4j-defaults"];

    srcs = ["main/tests/**/*.java"];
    java_resource_dirs = ["main/tests/*/src"];

    exclude_srcs = ["main/tests/localespi/**/*.java"];
    exclude_java_resource_dirs = ["main/tests/localespi/src"];

    static_libs = [
        "icu4j"
        "icu4j-testdata"
        "junit-params"
    ];
};

icu4j-icudata = java_import {
    name = "icu4j-icudata";
    host_supported = true;
    jars = ["main/shared/data/icudata.jar"];
};

icu4j-icutzdata = java_import {
    name = "icu4j-icutzdata";
    host_supported = true;
    jars = ["main/shared/data/icutzdata.jar"];
};

icu4j-testdata = java_import {
    name = "icu4j-testdata";
    host_supported = true;
    jars = ["main/shared/data/testdata.jar"];
};

#  LayoutLib (frameworks/layoutlib) needs JarJar'd versions of the
#  icudata and icutzdata, so add rules for it.
icu4j-icudata-jarjar = java_library_static {
    name = "icu4j-icudata-jarjar";
    defaults = ["icu4j-defaults"];
    static_libs = ["icu4j-icudata"];
    jarjar_rules = "liblayout-jarjar-rules.txt";
};

icu4j-icutzdata-jarjar = java_library_static {
    name = "icu4j-icutzdata-jarjar";
    defaults = ["icu4j-defaults"];
    static_libs = ["icu4j-icutzdata"];
    jarjar_rules = "liblayout-jarjar-rules.txt";
};

#  Compatibility alias until references to icu4j-host are removed
icu4j-host = java_library_host {
    name = "icu4j-host";
    static_libs = ["icu4j"];
};

#  Rules to generate android_icu4j files during build time
#  The following rules are used in the downstream branches master-icu-dev only,
#  but NOT used in AOSP.
generate_script_srcs = [
    "main/**/*"
    "samples/**/*"
];
generate_script_tools = [
    "android_icu4j_srcgen_binary"
    "soong_zip"
];
generate_script_tool_files = [
    ":generate_android_icu4j_script"
];
#  ANDROID_BUILD_TOP is needed to be set for generate_android_icu4j.sh
generate_script_common_cmd = "export ANDROID_BUILD_TOP=$$(pwd) && " +
    "$(location :generate_android_icu4j_script) " +
    "--no-doc-patch " +
    "--gen $(genDir) " +
    "--srcgen-tool $(location android_icu4j_srcgen_binary)";

generated_android_icu4j_src_files = genrule {
    name = "generated_android_icu4j_src_files";
    enabled = false; #  http://b/117312606
    srcs = generate_script_srcs;
    tools = generate_script_tools;
    tool_files = generate_script_tool_files;
    out = ["generated_android_icu4j.srcjar"];
    cmd = generate_script_common_cmd +
        "&& $(location soong_zip) -o $(out) -C $(genDir)/android_icu4j/src/main/java " +
        "-D $(genDir)/android_icu4j/src/main/java";
};

generated_android_icu4j_resources = java_genrule {
    name = "generated_android_icu4j_resources";
    enabled = false; #  http://b/117312606
    host_supported = true;
    srcs = generate_script_srcs;
    tools = generate_script_tools;
    tool_files = generate_script_tool_files;
    out = ["generated_android_icu4j_resources.jar"];
    cmd = generate_script_common_cmd +
        "&& $(location soong_zip) -o $(out) -C $(genDir)/android_icu4j/resources " +
        "-D $(genDir)/android_icu4j/resources";
};

generated_android_icu4j_test_files = genrule {
    name = "generated_android_icu4j_test_files";
    enabled = false; #  http://b/117312606
    srcs = generate_script_srcs;
    tools = generate_script_tools;
    tool_files = generate_script_tool_files;
    out = ["generated_android_icu4j_test.srcjar"];
    cmd = generate_script_common_cmd +
        "&& find $(genDir)/android_icu4j/src/main/tests -type f -not -name \"*.java\" -exec rm {} \\; " +
        "&& $(location soong_zip) -o $(out) -C $(genDir)/android_icu4j/src/main/tests " +
        "-D $(genDir)/android_icu4j/src/main/tests";
};

generated_android_icu4j_test_resources = java_genrule {
    name = "generated_android_icu4j_test_resources";
    enabled = false; #  http://b/117312606
    host_supported = true;
    srcs = generate_script_srcs;
    tools = generate_script_tools;
    tool_files = generate_script_tool_files;
    out = ["generated_android_icu4j_test_resources.jar"];
    cmd = generate_script_common_cmd +
        "&& find $(genDir)/android_icu4j/src/main/tests -type f -name \"*.java\" -exec rm {} \\; " +
        "&& $(location soong_zip) -o $(out) -C $(genDir)/android_icu4j/src/main/tests " +
        "-D $(genDir)/android_icu4j/src/main/tests";
};

in { inherit generated_android_icu4j_resources generated_android_icu4j_src_files generated_android_icu4j_test_files generated_android_icu4j_test_resources icu4j icu4j-defaults icu4j-host icu4j-icudata icu4j-icudata-jarjar icu4j-icutzdata icu4j-icutzdata-jarjar icu4j-testdata icu4j-tests; }
