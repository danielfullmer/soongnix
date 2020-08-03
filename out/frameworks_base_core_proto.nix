{ cc_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

#  C++ library for Bluetooth platform wide protobuf definitions
libbt-platform-protos-lite = cc_library_static {
    name = "libbt-platform-protos-lite";
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = [
        "android/bluetooth/a2dp/enums.proto"
        "android/bluetooth/enums.proto"
        "android/bluetooth/hci/enums.proto"
        "android/bluetooth/hfp/enums.proto"
        "android/bluetooth/smp/enums.proto"
    ];
};

in { inherit libbt-platform-protos-lite; }
