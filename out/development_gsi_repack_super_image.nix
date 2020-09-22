{ python_binary_host }:
let

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

repack_super_image = python_binary_host {
    name = "repack_super_image";
    main = "repack_super_image.py";
    srcs = [
        "repack_super_image.py"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
    dist = {
        targets = ["gsi_utils"];
    };
};

in { inherit repack_super_image; }