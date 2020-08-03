{ java_binary_host, java_genrule, java_genrule_host, java_library, java_library_host }:
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

cts-vmtests-dot = java_library {
    name = "cts-vmtests-dot";
    libs = ["junit"];
    srcs = ["src/dot/**/*.java"];
    installable = false;
    include_srcs = true;
    host_supported = true;
};

vmtests-buildutil = java_binary_host {
    name = "vmtests-buildutil";
    static_libs = [
        "cts-vmtests-dot"
        "junit"
    ];
    srcs = [
        "build/src/util/build/BuildCTSHostSources.java"
        "build/src/util/build/BuildCTSMainsSources.java"
        "build/src/util/build/BuildUtilBase.java"
        "build/src/util/build/FileUtil.java"
        "build/src/util/build/JUnitTestCollector.java"
    ];
    wrapper = "etc/vmtests-buildutil.sh";
};

vmtests_generated_host_test_sources = java_genrule_host {
    name = "vmtests_generated_host_test_sources";
    tools = [
        "vmtests-buildutil"
        "soong_zip"
    ];
    cmd = "$(location vmtests-buildutil) util.build.BuildCTSHostSources $(genDir) " +
        " && $(location soong_zip) -jar -o $(out) -C $(genDir) -D $(genDir)/dot";
    out = ["vmtests.host.generated.srcjar"];
};

host-cts-vmtests = java_library_host {
    name = "host-cts-vmtests";
    libs = [
        "junit"
        "tradefed"
    ];
    srcs = [":vmtests_generated_host_test_sources"];
    installable = false;
};

vmtests-dfh-dex-generated = java_genrule_host {
    name = "vmtests-dfh-dex-generated";
    tools = [
        "cfassembler"
        "soong_zip"
    ];
    tool_files = ["etc/vmtests-cfassembler.sh"];
    srcs = ["src/dot/**/*.dfh"];
    cmd = "$(location etc/vmtests-cfassembler.sh) $(location cfassembler) $(location soong_zip) $(genDir) $(out) $(in)";
    out = ["vmtests_dfh_dex_generated.jar"];
};

vmtests-dasm-dex-generated = java_genrule_host {
    name = "vmtests-dasm-dex-generated";
    tools = [
        "dasm"
        "soong_zip"
    ];
    tool_files = ["etc/vmtests-dasm.sh"];
    srcs = ["src/dot/**/*.d"];
    cmd = "$(location etc/vmtests-dasm.sh) $(location dasm) $(location soong_zip) $(genDir) $(out) $(in)";
    out = ["vmtests_dasm_dex_generated.jar"];
};

vmtests_generated_mains_test_sources = java_genrule {
    name = "vmtests_generated_mains_test_sources";
    tools = [
        "vmtests-buildutil"
        "soong_zip"
    ];
    cmd = "mkdir $(genDir)/src" +
        " && $(location vmtests-buildutil) util.build.BuildCTSMainsSources $(genDir)/src " +
        " && $(location soong_zip) -jar -o $(out) -C $(genDir)/src -D $(genDir)/src";
    out = ["vmtests.mains.generated.srcjar"];
};

vmtests-mains = java_library {
    name = "vmtests-mains";
    installable = true;
    libs = ["cts-vmtests-dot"];
    srcs = [":vmtests_generated_mains_test_sources"];
};

#  TODO: Add vmtests-mains' dex jar to vmtests-generated-resources when
#        it can be addressed.

vmtests-generated-resources = java_library_host {
    name = "vmtests-generated-resources";
    static_libs = [
        "host-cts-vmtests"
        "vmtests-dfh-dex-generated"
        "vmtests-dasm-dex-generated"
    ];
    installable = false;
};

in { inherit cts-vmtests-dot host-cts-vmtests vmtests-buildutil vmtests-dasm-dex-generated vmtests-dfh-dex-generated vmtests-generated-resources vmtests-mains vmtests_generated_host_test_sources vmtests_generated_mains_test_sources; }
