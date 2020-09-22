{ cc_binary, prebuilt_etc }:
let

/*
 * Copyright 2019 The Android Open Source Project
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

#  This is an example of an empty Codec2.0 service.
#
#  To use this, make a copy of this whole directory and rename modules
#  accordingly. The contents of "vendor.cpp" and files in the subdirectory
#  "seccomp_policy" may also need to be modified.

#  Binary file for the service.
#
#  The init_rc file contains the absolute path to this binary on the device.
#  If the name of this module is modified, the content of the init_rc file has
#  to be modified accordingly.
#
#  The seccomp_policy file name and its content can be modified, but note that
#  vendor.cpp also needs to be updated because it needs the absolute path to the
#  seccomp policy file on the device.
"android.hardware.media.c2@1.1-default-service" = cc_binary {
    name = "android.hardware.media.c2@1.1-default-service";
    vendor = true;
    relative_install_path = "hw";

    init_rc = ["android.hardware.media.c2@1.1-default-service.rc"];

    defaults = ["libcodec2-hidl-defaults"];
    srcs = [
        "vendor.cpp"
    ];

    #  minijail is used to protect against unexpected system calls.
    shared_libs = [
        "libavservices_minijail_vendor"
        "libbinder"
    ];
    required = ["android.hardware.media.c2@1.1-default-seccomp_policy"];

    #  The content in manifest_media_c2_V1_1_default.xml can be included
    #  directly in the main device manifest.xml file or via vintf_fragments.
    #  (Remove the line below if the entry is already in the main manifest.)
    vintf_fragments = ["manifest_media_c2_V1_1_default.xml"];
};

#  seccomp policy file.
#
#  This should be modified to suit the target device and architecture.
#
#  Files in the "seccomp_policy" subdirectory are only provided as examples.
#  They may not work on some devices and/or architectures without modification.
"android.hardware.media.c2@1.1-default-seccomp_policy" = prebuilt_etc {
    name = "android.hardware.media.c2@1.1-default-seccomp_policy";
    vendor = true;
    sub_dir = "seccomp_policy";

    #  If a specific architecture is targeted, multiple choices are not needed.
    arch = {
        arm = {
            src = "seccomp_policy/android.hardware.media.c2@1.1-default-arm.policy";
        };
        arm64 = {
            src = "seccomp_policy/android.hardware.media.c2@1.1-default-arm64.policy";
        };
        x86 = {
            src = "seccomp_policy/android.hardware.media.c2@1.1-default-x86.policy";
        };
        x86_64 = {
            src = "seccomp_policy/android.hardware.media.c2@1.1-default-x86_64.policy";
        };
    };

    #  This may be removed.
    required = ["crash_dump.policy"];
};

in { inherit "android.hardware.media.c2@1.1-default-seccomp_policy" "android.hardware.media.c2@1.1-default-service"; }
