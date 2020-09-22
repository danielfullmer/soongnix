{ aidl_interface, java_library }:
let

#
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
#

#  AIDL interfaces between the core system and the networking mainline module.
ipmemorystore-aidl-interfaces = aidl_interface {
    name = "ipmemorystore-aidl-interfaces";
    local_include_dir = "src";
    srcs = [
        "src/android/net/IIpMemoryStore.aidl"
        "src/android/net/IIpMemoryStoreCallbacks.aidl"
        "src/android/net/ipmemorystore/Blob.aidl"
        "src/android/net/ipmemorystore/IOnBlobRetrievedListener.aidl"
        "src/android/net/ipmemorystore/IOnL2KeyResponseListener.aidl"
        "src/android/net/ipmemorystore/IOnNetworkAttributesRetrievedListener.aidl"
        "src/android/net/ipmemorystore/IOnSameL3NetworkResponseListener.aidl"
        "src/android/net/ipmemorystore/IOnStatusAndCountListener.aidl"
        "src/android/net/ipmemorystore/IOnStatusListener.aidl"
        "src/android/net/ipmemorystore/NetworkAttributesParcelable.aidl"
        "src/android/net/ipmemorystore/SameL3NetworkResponseParcelable.aidl"
        "src/android/net/ipmemorystore/StatusParcelable.aidl"
    ];
    backend = {
        java = {
            apex_available = [
                "//apex_available:platform"
                "com.android.wifi"
            ];
        };
        ndk = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    versions = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
    ];
    visibility = [
        "//system/tools/aidl/build"
    ];
};

networkstack-aidl-interfaces = aidl_interface {
    name = "networkstack-aidl-interfaces";
    local_include_dir = "src";
    include_dirs = [
        "frameworks/base/core/java" #  For framework parcelables.
        "frameworks/native/aidl/binder/android/os" #  For PersistableBundle.aidl
        "frameworks/base/wifi/aidl-export" #  For wifi parcelables.
    ];
    srcs = [
        "src/android/net/DataStallReportParcelable.aidl"
        "src/android/net/DhcpResultsParcelable.aidl"
        "src/android/net/INetworkMonitor.aidl"
        "src/android/net/INetworkMonitorCallbacks.aidl"
        "src/android/net/INetworkStackConnector.aidl"
        "src/android/net/INetworkStackStatusCallback.aidl"
        "src/android/net/InitialConfigurationParcelable.aidl"
        "src/android/net/InformationElementParcelable.aidl"
        "src/android/net/Layer2InformationParcelable.aidl"
        "src/android/net/Layer2PacketParcelable.aidl"
        "src/android/net/NattKeepalivePacketDataParcelable.aidl"
        "src/android/net/NetworkTestResultParcelable.aidl"
        "src/android/net/PrivateDnsConfigParcel.aidl"
        "src/android/net/ProvisioningConfigurationParcelable.aidl"
        "src/android/net/ScanResultInfoParcelable.aidl"
        "src/android/net/TcpKeepalivePacketDataParcelable.aidl"
        "src/android/net/dhcp/DhcpLeaseParcelable.aidl"
        "src/android/net/dhcp/DhcpServingParamsParcel.aidl"
        "src/android/net/dhcp/IDhcpEventCallbacks.aidl"
        "src/android/net/dhcp/IDhcpServer.aidl"
        "src/android/net/dhcp/IDhcpServerCallbacks.aidl"
        "src/android/net/ip/IIpClient.aidl"
        "src/android/net/ip/IIpClientCallbacks.aidl"
    ];
    backend = {
        java = {
            apex_available = [
                "//apex_available:platform"
                "com.android.bluetooth.updatable"
                "com.android.wifi"
            ];
        };
        ndk = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    imports = ["ipmemorystore-aidl-interfaces"];
    versions = [
        "1"
        "2"
        "3"
        "4"
        "5"
        "6"
        "7"
    ];
    #  TODO: have tethering depend on networkstack-client and set visibility to private
    visibility = [
        "//system/tools/aidl/build"
        "//frameworks/base/packages/Tethering"
    ];
};

networkstack-client = java_library {
    name = "networkstack-client";
    sdk_version = "system_current";
    srcs = [
        ":framework-annotations"
        "src/android/net/IpMemoryStoreClient.java"
        "src/android/net/ipmemorystore/NetworkAttributes.java"
        "src/android/net/ipmemorystore/OnBlobRetrievedListener.java"
        "src/android/net/ipmemorystore/OnDeleteStatusListener.java"
        "src/android/net/ipmemorystore/OnL2KeyResponseListener.java"
        "src/android/net/ipmemorystore/OnNetworkAttributesRetrievedListener.java"
        "src/android/net/ipmemorystore/OnSameL3NetworkResponseListener.java"
        "src/android/net/ipmemorystore/OnStatusListener.java"
        "src/android/net/ipmemorystore/SameL3NetworkResponse.java"
        "src/android/net/ipmemorystore/Status.java"
        "src/android/net/networkstack/ModuleNetworkStackClient.java"
        "src/android/net/networkstack/NetworkStackClientBase.java"
        "src/android/net/shared/IpConfigurationParcelableUtil.java"
    ];
    static_libs = [
        "ipmemorystore-aidl-interfaces-java"
        "networkstack-aidl-interfaces-java"
    ];
    visibility = [
        "//frameworks/base/packages/Tethering"
        "//frameworks/base/services/net"
        "//frameworks/opt/net/wifi/service"
        "//packages/modules/NetworkStack"
    ];
};

in { inherit ipmemorystore-aidl-interfaces networkstack-aidl-interfaces networkstack-client; }
