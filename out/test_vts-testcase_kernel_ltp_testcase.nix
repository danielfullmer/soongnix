{ genrule, sh_test }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

vts_ltp_test_arm_64 = sh_test {
    name = "vts_ltp_test_arm_64";
    src = "phony_ltp_test_arm64.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm_64";
};

ltp_config_arm_64 = genrule {
    name = "ltp_config_arm_64";
    out = ["vts_ltp_test_arm_64.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 64 False False $(out)";
};

vts_ltp_test_arm_64_lowmem = sh_test {
    name = "vts_ltp_test_arm_64_lowmem";
    src = "phony_ltp_test_arm64_lowmem.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm_64_lowmem";
};

ltp_config_arm_64_lowmem = genrule {
    name = "ltp_config_arm_64_lowmem";
    out = ["vts_ltp_test_arm_64_lowmem.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 64 True False $(out)";
};

vts_ltp_test_arm_64_hwasan = sh_test {
    name = "vts_ltp_test_arm_64_hwasan";
    src = "phony_ltp_test_arm64_hwasan.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm_64_hwasan";
};

ltp_config_arm_64_hwasan = genrule {
    name = "ltp_config_arm_64_hwasan";
    out = ["vts_ltp_test_arm_64_hwasan.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 64 False True $(out)";
};

vts_ltp_test_arm_64_lowmem_hwasan = sh_test {
    name = "vts_ltp_test_arm_64_lowmem_hwasan";
    src = "phony_ltp_test_arm64_lowmem_hwasan.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm_64_lowmem_hwasan";
};

ltp_config_arm_64_lowmem_hwasan = genrule {
    name = "ltp_config_arm_64_lowmem_hwasan";
    out = ["vts_ltp_test_arm_64_lowmem_hwasan.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 64 True True $(out)";
};

vts_ltp_test_arm = sh_test {
    name = "vts_ltp_test_arm";
    src = "phony_ltp_test_arm.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm";
};

ltp_config_arm = genrule {
    name = "ltp_config_arm";
    out = ["vts_ltp_test_arm.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 32 False False $(out)";
};

vts_ltp_test_arm_lowmem = sh_test {
    name = "vts_ltp_test_arm_lowmem";
    src = "phony_ltp_test_arm_lowmem.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_arm_lowmem";
};

ltp_config_arm_lowmem = genrule {
    name = "ltp_config_arm_lowmem";
    out = ["vts_ltp_test_arm_lowmem.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) arm 32 True False $(out)";
};

vts_ltp_test_x86_64 = sh_test {
    name = "vts_ltp_test_x86_64";
    src = "phony_ltp_test_x86_64.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_x86_64";
};

ltp_config_x86_64 = genrule {
    name = "ltp_config_x86_64";
    out = ["vts_ltp_test_x86_64.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) x86 64 False False $(out)";
};

vts_ltp_test_x86 = sh_test {
    name = "vts_ltp_test_x86";
    src = "phony_ltp_test_x86.sh";
    test_suites = ["vts"];
    test_config = ":ltp_config_x86";
};

ltp_config_x86 = genrule {
    name = "ltp_config_x86";
    out = ["vts_ltp_test_x86.xml"];
    tool_files = [
        "tools/gen_ltp_config.py"
    ];
    cmd = "export ANDROID_BUILD_TOP=$$(pwd) && python3 $(location tools/gen_ltp_config.py) x86 32 False False $(out)";
};

in { inherit ltp_config_arm ltp_config_arm_64 ltp_config_arm_64_hwasan ltp_config_arm_64_lowmem ltp_config_arm_64_lowmem_hwasan ltp_config_arm_lowmem ltp_config_x86 ltp_config_x86_64 vts_ltp_test_arm vts_ltp_test_arm_64 vts_ltp_test_arm_64_hwasan vts_ltp_test_arm_64_lowmem vts_ltp_test_arm_64_lowmem_hwasan vts_ltp_test_arm_lowmem vts_ltp_test_x86 vts_ltp_test_x86_64; }
