{ java_binary_host, python_binary_host }:
let

#  Copyright (C) 2020 Google LLC
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

update_apn = python_binary_host {
    name = "update_apn";
    main = "python/update_apn.py";
    srcs = [
        "python/update_apn.py"
        "proto/carrier_list.proto"
        "proto/carrier_settings.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
    libs = [
        "libprotobuf-python"
        "py-six"
    ];
};

update_carrier_data = python_binary_host {
    name = "update_carrier_data";
    main = "python/update_carrier_data.py";
    srcs = [
        "python/compare.py"
        "python/update_carrier_data.py"
        "proto/carrier_list.proto"
        "proto/carrier_settings.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
    libs = [
        "libprotobuf-python"
        "py-six"
    ];
};

CarrierConfigConverterV2 = java_binary_host {
    name = "CarrierConfigConverterV2";
    srcs = [
        "java/CarrierConfigConverterV2.java"
        "java/CarrierProtoUtils.java"
        "proto/carrier_list.proto"
        "proto/carrier_settings.proto"
        ":telephonyprovider-proto-sources"
    ];
    java_resources = [
        ":telephonyprovider-assets-carrierlist"
    ];
    main_class = "com.google.carrier.CarrierConfigConverterV2";
    proto = {
        type = "full";
        canonical_path_from_root = false;
    };
    plugins = [
        "dagger2-auto-value"
    ];
    static_libs = [
        "dagger2-auto-value"
        "guava-21.0"
        "jcommander"
        "libprotobuf-java-full"
    ];
};

GenCarrierList = java_binary_host {
    name = "GenCarrierList";
    srcs = [
        "java/CarrierProtoUtils.java"
        "java/GenCarrierList.java"
        "proto/carrier_list.proto"
        "proto/carrier_settings.proto"
    ];
    main_class = "com.google.carrier.GenCarrierList";
    proto = {
        type = "full";
        canonical_path_from_root = false;
    };
    static_libs = [
        "guava-21.0"
        "jcommander"
        "libprotobuf-java-full"
    ];
};

GenDeviceSettings = java_binary_host {
    name = "GenDeviceSettings";
    srcs = [
        "java/CarrierProtoUtils.java"
        "java/GenDeviceSettings.java"
        "proto/carrier_list.proto"
        "proto/carrier_settings.proto"
    ];
    main_class = "com.google.carrier.GenDeviceSettings";
    proto = {
        type = "full";
        canonical_path_from_root = false;
    };
    static_libs = [
        "guava-21.0"
        "jcommander"
        "libprotobuf-java-full"
    ];
};

in { inherit CarrierConfigConverterV2 GenCarrierList GenDeviceSettings update_apn update_carrier_data; }
