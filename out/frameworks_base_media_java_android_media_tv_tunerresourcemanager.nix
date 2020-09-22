{ filegroup, java_library }:
let

framework-media-tv-tunerresourcemanager-sources = filegroup {
    name = "framework-media-tv-tunerresourcemanager-sources";
    srcs = [
        "CasSessionRequest.java"
        "ResourceClientProfile.java"
        "TunerDemuxRequest.java"
        "TunerDescramblerRequest.java"
        "TunerFrontendInfo.java"
        "TunerFrontendRequest.java"
        "TunerLnbRequest.java"
        "TunerResourceManager.java"
        "CasSessionRequest.aidl"
        "IResourcesReclaimListener.aidl"
        "ITunerResourceManager.aidl"
        "ResourceClientProfile.aidl"
        "TunerDemuxRequest.aidl"
        "TunerDescramblerRequest.aidl"
        "TunerFrontendInfo.aidl"
        "TunerFrontendRequest.aidl"
        "TunerLnbRequest.aidl"
    ];
    path = ".";
};

framework-media-tv-trm-sources = java_library {
    name = "framework-media-tv-trm-sources";
    srcs = [":framework-media-tv-tunerresourcemanager-sources"];
    installable = true;
    visibility = [
        "//frameworks/base"
    ];
};

in { inherit framework-media-tv-trm-sources framework-media-tv-tunerresourcemanager-sources; }
