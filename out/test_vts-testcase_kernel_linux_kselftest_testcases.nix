{ sh_test }:
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

vts_linux_kselftest_arm_64 = sh_test {
    name = "vts_linux_kselftest_arm_64";
    src = "phony_kselftest_arm64.sh";
    test_suites = ["vts"];
    test_config = "vts_linux_kselftest_arm_64.xml";
};

vts_linux_kselftest_arm_32 = sh_test {
    name = "vts_linux_kselftest_arm_32";
    src = "phony_kselftest_arm.sh";
    test_suites = ["vts"];
    test_config = "vts_linux_kselftest_arm_32.xml";
};

vts_linux_kselftest_x86_64 = sh_test {
    name = "vts_linux_kselftest_x86_64";
    src = "phony_kselftest_x86_64.sh";
    test_suites = ["vts"];
    test_config = "vts_linux_kselftest_x86_64.xml";
};

vts_linux_kselftest_x86_32 = sh_test {
    name = "vts_linux_kselftest_x86_32";
    src = "phony_kselftest_x86.sh";
    test_suites = ["vts"];
    test_config = "vts_linux_kselftest_x86_32.xml";
};

in { inherit vts_linux_kselftest_arm_32 vts_linux_kselftest_arm_64 vts_linux_kselftest_x86_32 vts_linux_kselftest_x86_64; }
