{ java_library, java_library_host }:
let

#  Copyright (C) 2020 Google Inc.
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

incremental-install-common-lib = java_library {
    name = "incremental-install-common-lib";
    srcs = ["src/android/incrementalinstall/common/Consts.java"];
    sdk_version = "test_current";
};

incremental-install-common-host-lib = java_library_host {
    name = "incremental-install-common-host-lib";
    srcs = ["src/android/incrementalinstall/common/Consts.java"];
};

in { inherit incremental-install-common-host-lib incremental-install-common-lib; }
