{ python_binary_host }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

gsi_util = python_binary_host {
    name = "gsi_util";
    srcs = [
        "gsi_util.py"
        "gsi_util/__init__.py"
        "gsi_util/checkers/__init__.py"
        "gsi_util/checkers/check_result.py"
        "gsi_util/checkers/checker.py"
        "gsi_util/checkers/sepolicy_checker.py"
        "gsi_util/checkers/vintf_checker.py"
        "gsi_util/commands/__init__.py"
        "gsi_util/commands/check_compat.py"
        "gsi_util/commands/dump.py"
        "gsi_util/commands/flash_gsi.py"
        "gsi_util/commands/pull.py"
        "gsi_util/commands/common/__init__.py"
        "gsi_util/commands/common/image_sources.py"
        "gsi_util/dumpers/__init__.py"
        "gsi_util/dumpers/dump_info_list.py"
        "gsi_util/dumpers/dumper.py"
        "gsi_util/dumpers/prop_dumper.py"
        "gsi_util/dumpers/xml_dumper.py"
        "gsi_util/mounters/__init__.py"
        "gsi_util/mounters/adb_mounter.py"
        "gsi_util/mounters/base_mounter.py"
        "gsi_util/mounters/composite_mounter.py"
        "gsi_util/mounters/folder_mounter.py"
        "gsi_util/mounters/image_mounter.py"
        "gsi_util/utils/__init__.py"
        "gsi_util/utils/adb_utils.py"
        "gsi_util/utils/cmd_utils.py"
        "gsi_util/utils/debugfs.py"
        "gsi_util/utils/fastboot_utils.py"
        "gsi_util/utils/file_utils.py"
        "gsi_util/utils/image_utils.py"
        "gsi_util/utils/sepolicy_utils.py"
        "gsi_util/utils/vintf_utils.py"
    ];
    required = [
        "adb"
        "avbtool"
        "checkvintf"
        "secilc"
        "simg2img"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

in { inherit gsi_util; }
