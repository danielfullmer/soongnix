{ cc_binary }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

"android.hardware.automotive.occupant_awareness@1.0-service" = cc_binary {
    name = "android.hardware.automotive.occupant_awareness@1.0-service";
    init_rc = ["android.hardware.automotive.occupant_awareness@1.0-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "service.cpp"
        "OccupantAwareness.cpp"
    ];
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "libutils"
        "android.hardware.automotive.occupant_awareness-ndk_platform"
    ];
};

in { inherit "android.hardware.automotive.occupant_awareness@1.0-service"; }
