{ aidl_interface, filegroup, java_library_static }:
let

#  AIDL interfaces between the core system and the networking mainline module.
ipmemorystore-aidl-interfaces = aidl_interface {
    name = "ipmemorystore-aidl-interfaces";
    local_include_dir = "java";
    srcs = [
        "java/android/net/IIpMemoryStore.aidl"
        "java/android/net/IIpMemoryStoreCallbacks.aidl"
        "java/android/net/ipmemorystore/Blob.aidl"
        "java/android/net/ipmemorystore/IOnBlobRetrievedListener.aidl"
        "java/android/net/ipmemorystore/IOnL2KeyResponseListener.aidl"
        "java/android/net/ipmemorystore/IOnNetworkAttributesRetrievedListener.aidl"
        "java/android/net/ipmemorystore/IOnSameL3NetworkResponseListener.aidl"
        "java/android/net/ipmemorystore/IOnStatusListener.aidl"
        "java/android/net/ipmemorystore/NetworkAttributesParcelable.aidl"
        "java/android/net/ipmemorystore/SameL3NetworkResponseParcelable.aidl"
        "java/android/net/ipmemorystore/StatusParcelable.aidl"
    ];
    backend = {
        ndk = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    api_dir = "aidl/ipmemorystore";
    versions = [
        "1"
        "2"
        "3"
    ];
};

networkstack-aidl-interfaces = aidl_interface {
    name = "networkstack-aidl-interfaces";
    local_include_dir = "java";
    include_dirs = ["frameworks/base/core/java"]; #  For framework parcelables.
    srcs = [
        "java/android/net/DhcpResultsParcelable.aidl"
        "java/android/net/INetworkMonitor.aidl"
        "java/android/net/INetworkMonitorCallbacks.aidl"
        "java/android/net/INetworkStackConnector.aidl"
        "java/android/net/INetworkStackStatusCallback.aidl"
        "java/android/net/InitialConfigurationParcelable.aidl"
        "java/android/net/NattKeepalivePacketDataParcelable.aidl"
        "java/android/net/PrivateDnsConfigParcel.aidl"
        "java/android/net/ProvisioningConfigurationParcelable.aidl"
        "java/android/net/TcpKeepalivePacketDataParcelable.aidl"
        "java/android/net/dhcp/DhcpServingParamsParcel.aidl"
        "java/android/net/dhcp/IDhcpServer.aidl"
        "java/android/net/dhcp/IDhcpServerCallbacks.aidl"
        "java/android/net/ip/IIpClient.aidl"
        "java/android/net/ip/IIpClientCallbacks.aidl"
    ];
    backend = {
        ndk = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    api_dir = "aidl/networkstack";
    imports = ["ipmemorystore-aidl-interfaces"];
    versions = [
        "1"
        "2"
        "3"
    ];
};

"services.net" = java_library_static {
    name = "services.net";
    srcs = [
        "java/android/net/IpMemoryStore.java"
        "java/android/net/IpMemoryStoreClient.java"
        "java/android/net/NetworkMonitorManager.java"
        "java/android/net/NetworkStackClient.java"
        "java/android/net/TcpKeepalivePacketData.java"
        "java/android/net/dhcp/DhcpServerCallbacks.java"
        "java/android/net/dhcp/DhcpServingParamsParcelExt.java"
        "java/android/net/ip/InterfaceController.java"
        "java/android/net/ip/IpClientCallbacks.java"
        "java/android/net/ip/IpClientManager.java"
        "java/android/net/ip/IpClientUtil.java"
        "java/android/net/ip/IpServer.java"
        "java/android/net/ip/RouterAdvertisementDaemon.java"
        "java/android/net/ipmemorystore/NetworkAttributes.java"
        "java/android/net/ipmemorystore/OnBlobRetrievedListener.java"
        "java/android/net/ipmemorystore/OnL2KeyResponseListener.java"
        "java/android/net/ipmemorystore/OnNetworkAttributesRetrievedListener.java"
        "java/android/net/ipmemorystore/OnSameL3NetworkResponseListener.java"
        "java/android/net/ipmemorystore/OnStatusListener.java"
        "java/android/net/ipmemorystore/SameL3NetworkResponse.java"
        "java/android/net/ipmemorystore/Status.java"
        "java/android/net/netlink/ConntrackMessage.java"
        "java/android/net/netlink/InetDiagMessage.java"
        "java/android/net/netlink/NetlinkConstants.java"
        "java/android/net/netlink/NetlinkErrorMessage.java"
        "java/android/net/netlink/NetlinkMessage.java"
        "java/android/net/netlink/NetlinkSocket.java"
        "java/android/net/netlink/RtNetlinkNeighborMessage.java"
        "java/android/net/netlink/StructInetDiagMsg.java"
        "java/android/net/netlink/StructInetDiagReqV2.java"
        "java/android/net/netlink/StructInetDiagSockId.java"
        "java/android/net/netlink/StructNdMsg.java"
        "java/android/net/netlink/StructNdaCacheInfo.java"
        "java/android/net/netlink/StructNfGenMsg.java"
        "java/android/net/netlink/StructNlAttr.java"
        "java/android/net/netlink/StructNlMsgErr.java"
        "java/android/net/netlink/StructNlMsgHdr.java"
        "java/android/net/shared/InitialConfiguration.java"
        "java/android/net/shared/IpConfigurationParcelableUtil.java"
        "java/android/net/shared/LinkPropertiesParcelableUtil.java"
        "java/android/net/shared/NetworkMonitorUtils.java"
        "java/android/net/shared/ParcelableUtil.java"
        "java/android/net/shared/PrivateDnsConfig.java"
        "java/android/net/shared/ProvisioningConfiguration.java"
        "java/android/net/util/InterfaceParams.java"
        "java/android/net/util/InterfaceSet.java"
        "java/android/net/util/KeepalivePacketDataUtil.java"
        "java/android/net/util/NetdService.java"
        "java/android/net/util/NetworkConstants.java"
        "java/android/net/util/PrefixUtils.java"
        "java/android/net/util/SharedLog.java"
        "java/android/net/util/VersionedBroadcastListener.java"
    ];
    static_libs = [
        "dnsresolver_aidl_interface-V2-java"
        "ipmemorystore-client"
        "netd_aidl_interface-V2-java"
        "networkstack-aidl-interfaces-V3-java"
    ];
};

ipmemorystore-client = java_library_static {
    name = "ipmemorystore-client";
    sdk_version = "system_current";
    srcs = [
        ":framework-annotations"
        "java/android/net/IpMemoryStoreClient.java"
        "java/android/net/ipmemorystore/NetworkAttributes.java"
        "java/android/net/ipmemorystore/OnBlobRetrievedListener.java"
        "java/android/net/ipmemorystore/OnL2KeyResponseListener.java"
        "java/android/net/ipmemorystore/OnNetworkAttributesRetrievedListener.java"
        "java/android/net/ipmemorystore/OnSameL3NetworkResponseListener.java"
        "java/android/net/ipmemorystore/OnStatusListener.java"
        "java/android/net/ipmemorystore/SameL3NetworkResponse.java"
        "java/android/net/ipmemorystore/Status.java"
    ];
    static_libs = [
        "ipmemorystore-aidl-interfaces-V3-java"
    ];
};

services-networkstack-shared-srcs = filegroup {
    name = "services-networkstack-shared-srcs";
    srcs = [
        "java/android/net/ip/InterfaceController.java" #  TODO: move to NetworkStack with tethering
        "java/android/net/util/InterfaceParams.java" #  TODO: move to NetworkStack with IpServer
        "java/android/net/shared/InitialConfiguration.java"
        "java/android/net/shared/IpConfigurationParcelableUtil.java"
        "java/android/net/shared/LinkPropertiesParcelableUtil.java"
        "java/android/net/shared/NetworkMonitorUtils.java"
        "java/android/net/shared/ParcelableUtil.java"
        "java/android/net/shared/PrivateDnsConfig.java"
        "java/android/net/shared/ProvisioningConfiguration.java"
        "java/android/net/netlink/ConntrackMessage.java"
        "java/android/net/netlink/InetDiagMessage.java"
        "java/android/net/netlink/NetlinkConstants.java"
        "java/android/net/netlink/NetlinkErrorMessage.java"
        "java/android/net/netlink/NetlinkMessage.java"
        "java/android/net/netlink/NetlinkSocket.java"
        "java/android/net/netlink/RtNetlinkNeighborMessage.java"
        "java/android/net/netlink/StructInetDiagMsg.java"
        "java/android/net/netlink/StructInetDiagReqV2.java"
        "java/android/net/netlink/StructInetDiagSockId.java"
        "java/android/net/netlink/StructNdMsg.java"
        "java/android/net/netlink/StructNdaCacheInfo.java"
        "java/android/net/netlink/StructNfGenMsg.java"
        "java/android/net/netlink/StructNlAttr.java"
        "java/android/net/netlink/StructNlMsgErr.java"
        "java/android/net/netlink/StructNlMsgHdr.java"
    ];
};

in { inherit "services.net" ipmemorystore-aidl-interfaces ipmemorystore-client networkstack-aidl-interfaces services-networkstack-shared-srcs; }
