{ kernel_config }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

"kernel_config_q_4.19" = kernel_config {
    name = "kernel_config_q_4.19";
    srcs = [
        "android-base.config"
    ];
    meta = "android-base-conditional.xml";
};

in { inherit "kernel_config_q_4.19"; }
