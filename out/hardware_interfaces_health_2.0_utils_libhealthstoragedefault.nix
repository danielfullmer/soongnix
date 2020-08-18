{ cc_library_static }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
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

#  Default implementation for (passthrough) clients that statically links to
#  android.hardware.health@2.0-impl but do no query for storage related
#  information.
libhealthstoragedefault = cc_library_static {
    srcs = ["StorageHealthDefault.cpp"];
    name = "libhealthstoragedefault";
    vendor_available = true;
    recovery_available = true;
    cflags = ["-Werror"];
    shared_libs = [
        "android.hardware.health@2.0"
    ];
};

in { inherit libhealthstoragedefault; }
