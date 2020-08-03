{ android_library_import, java_import, java_import_host, java_plugin }:
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

car-androidx-room-compiler = java_plugin {
    name = "car-androidx-room-compiler";
    static_libs = [
        "car-androidx-annotation-nodeps-bp"
        "car-androidx-room-common-nodeps-bp"
        "car-androidx-room-compiler-nodeps-bp"
        "car-androidx-room-compiler-tools-common-m2-deps"
        "car-androidx-room-migration-nodeps-bp"
        "kotlin-stdlib"
    ];
    processor_class = "androidx.room.RoomProcessor";
    generates_api = true;
};

car-androidx-room-runtime-nodeps-bp = android_library_import {
    name = "car-androidx-room-runtime-nodeps-bp";
    aars = ["androidx.room/room-runtime-2.0.0-alpha1.aar"];
    sdk_version = "current";
};

car-androidx-room-common-nodeps-bp = java_import {
    name = "car-androidx-room-common-nodeps-bp";
    jars = ["androidx.room/room-common-2.0.0-alpha1.jar"];
    host_supported = true;
};

car-androidx-room-compiler-nodeps-bp = java_import_host {
    name = "car-androidx-room-compiler-nodeps-bp";
    jars = ["androidx.room/room-compiler-2.0.0-alpha1.jar"];
};

car-androidx-room-migration-nodeps-bp = java_import_host {
    name = "car-androidx-room-migration-nodeps-bp";
    jars = ["androidx.room/room-migration-2.0.0-alpha1.jar"];
};

car-androidx-annotation-nodeps-bp = java_import_host {
    name = "car-androidx-annotation-nodeps-bp";
    jars = ["annotation-1.0.0-alpha1.jar"];
};

in { inherit car-androidx-annotation-nodeps-bp car-androidx-room-common-nodeps-bp car-androidx-room-compiler car-androidx-room-compiler-nodeps-bp car-androidx-room-migration-nodeps-bp car-androidx-room-runtime-nodeps-bp; }
