{ cc_library_static, filegroup }:
let

/**
 * Copyright (c) 2018, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

incidentcompanion_aidl = filegroup {
    name = "incidentcompanion_aidl";
    srcs = [
        "binder/android/os/IIncidentAuthListener.aidl"
        "binder/android/os/IIncidentCompanion.aidl"
    ];
    path = "binder";
};

libincidentcompanion = cc_library_static {
    name = "libincidentcompanion";
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    aidl = {
        local_include_dirs = ["binder"];
        export_aidl_headers = true;
    };
    srcs = [
        ":incidentcompanion_aidl"
        "src/IncidentManager.cpp"
    ];
    export_include_dirs = [
        "binder"
        "include"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];
};

in { inherit incidentcompanion_aidl libincidentcompanion; }
