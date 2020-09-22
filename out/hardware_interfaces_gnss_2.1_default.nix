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

"android.hardware.gnss@2.1-service" = cc_binary {
    name = "android.hardware.gnss@2.1-service";
    init_rc = ["android.hardware.gnss@2.1-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    vintf_fragments = ["android.hardware.gnss@2.1-service.xml"];
    srcs = [
        "Gnss.cpp"
        "GnssAntennaInfo.cpp"
        "GnssDebug.cpp"
        "GnssMeasurement.cpp"
        "GnssMeasurementCorrections.cpp"
        "GnssConfiguration.cpp"
        "service.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libutils"
        "liblog"
        "android.hardware.gnss.measurement_corrections@1.1"
        "android.hardware.gnss.measurement_corrections@1.0"
        "android.hardware.gnss.visibility_control@1.0"
        "android.hardware.gnss@2.1"
        "android.hardware.gnss@1.0"
        "android.hardware.gnss@1.1"
        "android.hardware.gnss@2.0"
    ];
    static_libs = [
        "android.hardware.gnss@common-default-lib"
    ];
};

in { inherit "android.hardware.gnss@2.1-service"; }
