{ java_library_static }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

CompanionDeviceSupport-proto = java_library_static {
    name = "CompanionDeviceSupport-proto";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = [
        "phone_auth.proto"
        "trusted_device_message.proto"
    ];
    jarjar_rules = "jarjar-rules.txt";
    sdk_version = "28";
};

in { inherit CompanionDeviceSupport-proto; }
