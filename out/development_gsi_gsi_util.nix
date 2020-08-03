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
        "gsi_util/*.py"
        "gsi_util/checkers/*.py"
        "gsi_util/commands/*.py"
        "gsi_util/commands/common/*.py"
        "gsi_util/dumpers/*.py"
        "gsi_util/mounters/*.py"
        "gsi_util/utils/*.py"
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
