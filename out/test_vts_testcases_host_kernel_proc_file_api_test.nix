{ python_test_host }:
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

vts_kernel_proc_file_api_test = python_test_host {
    name = "vts_kernel_proc_file_api_test";
    main = "vts_kernel_proc_file_api_test.py";
    srcs = [
        "proc_utils.py"
        "target_file_utils.py"
        "vts_kernel_proc_file_api_test.py"
        "proc_tests/KernelProcFileTestBase.py"
        "proc_tests/ProcAsoundTests.py"
        "proc_tests/ProcCmdlineTest.py"
        "proc_tests/ProcCpuFileTests.py"
        "proc_tests/ProcFsFileTests.py"
        "proc_tests/ProcKmsgTest.py"
        "proc_tests/ProcMapsTest.py"
        "proc_tests/ProcMemInfoTest.py"
        "proc_tests/ProcMiscTest.py"
        "proc_tests/ProcModulesTest.py"
        "proc_tests/ProcQtaguidCtrlTest.py"
        "proc_tests/ProcRemoveUidRangeTest.py"
        "proc_tests/ProcShowUidStatTest.py"
        "proc_tests/ProcSimpleFileTests.py"
        "proc_tests/ProcStatTest.py"
        "proc_tests/ProcUidConcurrentTimeTests.py"
        "proc_tests/ProcUidCpuPowerTests.py"
        "proc_tests/ProcUidIoStatsTest.py"
        "proc_tests/ProcUidTimeInStateTest.py"
        "proc_tests/ProcVersionTest.py"
        "proc_tests/ProcVmallocInfoTest.py"
        "proc_tests/ProcVmstatTest.py"
        "proc_tests/ProcZoneInfoTest.py"
        "proc_tests/__init__.py"
    ];
    libs = [
        "py-parse_type"
        "py-ply"
        "vndk_utils"
        "vts_vndk_utils"
    ];
    version = {
        py2 = {
            enabled = false;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
    test_suites = [
        "vts"
    ];
    test_config = "kernel_proc_file_api_test.xml";
};

in { inherit vts_kernel_proc_file_api_test; }
