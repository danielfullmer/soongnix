{ sh_binary_host }:
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

vts-tradefed = sh_binary_host {
    name = "vts-tradefed";
    src = "vts-tradefed";
};

vtf = sh_binary_host {
    name = "vtf";
    src = "vtf";
};

vts-tradefed_win = sh_binary_host {
    name = "vts-tradefed_win";
    src = "vts-tradefed_win.bat";
    filename_from_src = true;

    target = {
        not_windows = {
            enabled = false;
        };
        windows = {
            enabled = true;
        };
    };
};

in { inherit vtf vts-tradefed vts-tradefed_win; }
