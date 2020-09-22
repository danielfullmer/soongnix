{ aidl_interface }:
let

"android.automotive.computepipe.runner" = aidl_interface {
    name = "android.automotive.computepipe.runner";
    vendor_available = true;
    srcs = [
        "android/automotive/computepipe/runner/IPipeDebugger.aidl"
        "android/automotive/computepipe/runner/IPipeRunner.aidl"
        "android/automotive/computepipe/runner/IPipeStateCallback.aidl"
        "android/automotive/computepipe/runner/IPipeStream.aidl"
        "android/automotive/computepipe/runner/PacketDescriptor.aidl"
        "android/automotive/computepipe/runner/PacketDescriptorPacketType.aidl"
        "android/automotive/computepipe/runner/PipeDescriptor.aidl"
        "android/automotive/computepipe/runner/PipeInputConfig.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigCameraDesc.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigCameraType.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigFormatType.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigImageFileDesc.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigImageFileType.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigInputSourceDesc.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigInputType.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigVideoFileDesc.aidl"
        "android/automotive/computepipe/runner/PipeInputConfigVideoFileType.aidl"
        "android/automotive/computepipe/runner/PipeOffloadConfig.aidl"
        "android/automotive/computepipe/runner/PipeOffloadConfigOffloadDesc.aidl"
        "android/automotive/computepipe/runner/PipeOffloadConfigOffloadType.aidl"
        "android/automotive/computepipe/runner/PipeOutputConfig.aidl"
        "android/automotive/computepipe/runner/PipeOutputConfigOutputDesc.aidl"
        "android/automotive/computepipe/runner/PipeOutputConfigPacketType.aidl"
        "android/automotive/computepipe/runner/PipeProfilingType.aidl"
        "android/automotive/computepipe/runner/PipeState.aidl"
        "android/automotive/computepipe/runner/PipeTerminationConfig.aidl"
        "android/automotive/computepipe/runner/PipeTerminationConfigTerminationDesc.aidl"
        "android/automotive/computepipe/runner/PipeTerminationConfigTerminationType.aidl"
        "android/automotive/computepipe/runner/ProfilingData.aidl"

    ];
    imports = [
        "android.hardware.graphics.common"
    ];
    stability = "vintf";
    backend = {
        java = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    versions = ["1"];
};

"android.automotive.computepipe.registry" = aidl_interface {
    name = "android.automotive.computepipe.registry";
    vendor_available = true;
    imports = ["android.automotive.computepipe.runner"];
    srcs = [
        "android/automotive/computepipe/registry/IClientInfo.aidl"
        "android/automotive/computepipe/registry/IPipeQuery.aidl"
        "android/automotive/computepipe/registry/IPipeRegistration.aidl"

    ];
    stability = "vintf";
    backend = {
        java = {
            enabled = false;
        };
        cpp = {
            enabled = false;
        };
    };
    versions = ["1"];
};

in { inherit "android.automotive.computepipe.registry" "android.automotive.computepipe.runner"; }
