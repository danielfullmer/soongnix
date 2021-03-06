{ java_library }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

#  Build the java code
#  ============================================================

ethernet-service = java_library {
    name = "ethernet-service";
    installable = true;

    aidl = {
        local_include_dirs = ["java"];
    };
    srcs = [
        "java/com/android/server/ethernet/EthernetConfigStore.java"
        "java/com/android/server/ethernet/EthernetNetworkFactory.java"
        "java/com/android/server/ethernet/EthernetService.java"
        "java/com/android/server/ethernet/EthernetServiceImpl.java"
        "java/com/android/server/ethernet/EthernetTracker.java"

    ];

    libs = ["services"];
};

in { inherit ethernet-service; }
