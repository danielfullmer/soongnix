{ prebuilt_etc, sh_binary }:
let

#
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
#

"preloads_copy.sh" = sh_binary {
    name = "preloads_copy.sh";

    src = "preloads_copy.sh";
};

"cppreopts.sh" = sh_binary {
    name = "cppreopts.sh";

    init_rc = ["cppreopts.rc"];
    src = "cppreopts.sh";
    required = [
        "preopt2cachename"
        "preloads_copy.sh"
        "fstab.postinstall"
    ];
};

"fstab.postinstall" = prebuilt_etc {
    name = "fstab.postinstall";
    src = "fstab.postinstall";
};

in { inherit "cppreopts.sh" "fstab.postinstall" "preloads_copy.sh"; }
