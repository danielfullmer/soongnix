{ cc_binary, cc_defaults, cc_library_static, cc_test, genrule, prebuilt_etc }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

linkerconfig_defaults = cc_defaults {
    name = "linkerconfig_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
    defaults = ["libapexutil-deps"];
    static_libs = [
        "libapexutil"
        "libbase"
        "liblog"
    ];
    host_supported = true;
};

linkerconfig_test_defaults = cc_defaults {
    name = "linkerconfig_test_defaults";
    defaults = ["linkerconfig_defaults"];
    cflags = [
        "-g"
        "-Wunused"
    ];
    test_suites = ["general-tests"];
};

linkerconfig_modules = cc_library_static {
    name = "linkerconfig_modules";
    defaults = ["linkerconfig_defaults"];
    export_include_dirs = ["modules/include"];
    srcs = [
        "modules/apex.cc"
        "modules/basecontext.cc"
        "modules/configuration.cc"
        "modules/configwriter.cc"
        "modules/environment.cc"
        "modules/link.cc"
        "modules/namespace.cc"
        "modules/section.cc"
        "modules/stringutil.cc"
        "modules/variables.cc"
    ];
};

linkerconfig_contents = cc_library_static {
    name = "linkerconfig_contents";
    defaults = ["linkerconfig_defaults"];
    export_include_dirs = ["contents/include"];
    static_libs = [
        "linkerconfig_modules"
    ];
    srcs = [
        "contents/namespace/apexartdefault.cc"
        "contents/namespace/apexdefault.cc"
        "contents/namespace/apexplatform.cc"
        "contents/namespace/art.cc"
        "contents/namespace/namespacebuilder.cc"
        "contents/namespace/postinstall.cc"
        "contents/namespace/productdefault.cc"
        "contents/namespace/recoverydefault.cc"
        "contents/namespace/rs.cc"
        "contents/namespace/sphal.cc"
        "contents/namespace/system.cc"
        "contents/namespace/systemdefault.cc"
        "contents/namespace/unrestricteddefault.cc"
        "contents/namespace/vendordefault.cc"
        "contents/namespace/vndk.cc"
        "contents/namespace/vndkinsystem.cc"
        "contents/section/apexart.cc"
        "contents/section/apexdefault.cc"
        "contents/section/legacy.cc"
        "contents/section/postinstall.cc"
        "contents/section/product.cc"
        "contents/section/recovery.cc"
        "contents/section/sectionbuilder.cc"
        "contents/section/system.cc"
        "contents/section/unrestricted.cc"
        "contents/section/vendor.cc"
        "contents/configuration/apexconfig.cc"
        "contents/configuration/baseconfig.cc"
        "contents/configuration/legacy.cc"
        "contents/configuration/recovery.cc"
        "contents/context/context.cc"
        "contents/common/system_links.cc"
    ];
};

linkerconfig_generator = cc_library_static {
    name = "linkerconfig_generator";
    defaults = ["linkerconfig_defaults"];
    export_include_dirs = ["generator/include"];
    static_libs = [
        "linkerconfig_modules"
        "linkerconfig_contents"
        "libc++fs"
    ];
    srcs = [
        "generator/librarylistloader.cc"
        "generator/variableloader.cc"
    ];
};

linkerconfig = cc_binary {
    name = "linkerconfig";
    defaults = ["linkerconfig_defaults"];
    static_libs = [
        "linkerconfig_modules"
        "linkerconfig_contents"
        "linkerconfig_generator"
    ];
    srcs = [
        "main.cc"
    ];
    static_executable = true;
    required = [
        #  files from /system/etc
        "sanitizer.libraries.txt"
        "vndkcorevariant.libraries.txt"
        #  Note that even thought linkerconfig requires at least one version of VNDK APEXes,
        #  we can't list it here because the exact version is unknown at build-time. It is decided
        #  at runtime according to ro.vndk.version (or ro.product.vndk.version)
    ];
};

linkerconfig_modules_unittest = cc_test {
    name = "linkerconfig_modules_unittest";
    defaults = ["linkerconfig_test_defaults"];
    srcs = [
        "modules/tests/apex_test.cc"
        "modules/tests/configuration_test.cc"
        "modules/tests/configwriter_test.cc"
        "modules/tests/link_test.cc"
        "modules/tests/namespace_test.cc"
        "modules/tests/section_test.cc"
        "modules/tests/variables_test.cc"
    ];
    static_libs = [
        "libgmock"
        "linkerconfig_modules"
    ];
};

linkerconfig_backward_compatibility_test = cc_test {
    name = "linkerconfig_backward_compatibility_test";
    defaults = ["linkerconfig_test_defaults"];
    srcs = [
        "contents/tests/backward_compatibility/default_test.cc"
        "contents/tests/backward_compatibility/legacy_test.cc"
        "contents/tests/backward_compatibility/vndklite_test.cc"
    ];
    static_libs = [
        "linkerconfig_modules"
        "linkerconfig_contents"
    ];
};

linkerconfig_generator_unittest = cc_test {
    name = "linkerconfig_generator_unittest";
    defaults = ["linkerconfig_test_defaults"];
    srcs = [
        "generator/tests/librarylistloader_test.cc"
    ];
    static_libs = [
        "linkerconfig_modules"
        "linkerconfig_contents"
        "linkerconfig_generator"
    ];
    data = [
        "generator/tests/data/library_list_a.txt"
        "generator/tests/data/library_list_b.txt"
        "generator/tests/data/library_list_c.txt"
    ];
};

linkerconfig_contents_fulltest = cc_test {
    name = "linkerconfig_contents_fulltest";
    defaults = ["linkerconfig_test_defaults"];
    local_include_dirs = [
        "contents/tests/configuration/include"
    ];
    srcs = [
        "contents/tests/configuration/apexconfig_test.cc"
        "contents/tests/configuration/baseconfig_test.cc"
        "contents/tests/configuration/legacy_test.cc"
        "contents/tests/configuration/recovery_test.cc"
        "contents/tests/configuration/sphal_test.cc"
        "contents/tests/configuration/vndk_test.cc"
    ];
    static_libs = [
        "linkerconfig_modules"
        "linkerconfig_contents"
    ];
};

"ld.config.recovery.txt" = prebuilt_etc {
    name = "ld.config.recovery.txt";
    recovery = true;
    filename = "ld.config.txt";
    src = ":generate_recovery_linker_config";
};

generate_recovery_linker_config = genrule {
    name = "generate_recovery_linker_config";
    recovery = true;
    out = ["ld.config.txt"];
    tools = ["linkerconfig"];
    cmd = "$(location linkerconfig) --recovery --target $(genDir)";
};

in { inherit "ld.config.recovery.txt" generate_recovery_linker_config linkerconfig linkerconfig_backward_compatibility_test linkerconfig_contents linkerconfig_contents_fulltest linkerconfig_defaults linkerconfig_generator linkerconfig_generator_unittest linkerconfig_modules linkerconfig_modules_unittest linkerconfig_test_defaults; }
