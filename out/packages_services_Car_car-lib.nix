{ cc_library, droidstubs, genrule, java_library, stubs_defaults }:
let

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

libcarpowermanager = cc_library {
    name = "libcarpowermanager";

    aidl = {
        export_aidl_headers = true;
        local_include_dirs = [
            "src"
        ];
    };

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];

    include_dirs = [
        "packages/services/Car/car-lib/native/include"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
    ];

    srcs = [
        "src/android/car/ICar.aidl"
        "src/android/car/hardware/power/ICarPower.aidl"
        "src/android/car/hardware/power/ICarPowerStateListener.aidl"
        "native/CarPowerManager/CarPowerManager.cpp"
    ];
};

"android.car.cluster.navigation" = java_library {
    name = "android.car.cluster.navigation";
    proto = {
        type = "lite";
    };
    static_libs = ["libprotobuf-java-lite"];
    srcs = ["src/android/car/navigation/navigation_state.proto"];
};

#  library to access settings from CarSettings
"android.car.settings" = java_library {
    name = "android.car.settings";
    srcs = ["src/android/car/settings/CarSettings.java"];
};

"android.car" = java_library {
    name = "android.car";
    srcs = [
        "src/android/car/AoapService.java"
        "src/android/car/Car.java"
        "src/android/car/CarAppFocusManager.java"
        "src/android/car/CarBluetoothManager.java"
        "src/android/car/CarBugreportManager.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarProjectionManager.java"
        "src/android/car/CarTransactionException.java"
        "src/android/car/EvConnectorType.java"
        "src/android/car/FuelType.java"
        "src/android/car/PortLocationType.java"
        "src/android/car/VehicleAreaDoor.java"
        "src/android/car/VehicleAreaMirror.java"
        "src/android/car/VehicleAreaSeat.java"
        "src/android/car/VehicleAreaType.java"
        "src/android/car/VehicleAreaWheel.java"
        "src/android/car/VehicleAreaWindow.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/FutureFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/cluster/CarInstrumentClusterManager.java"
        "src/android/car/cluster/ClusterActivityState.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderer.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderingService.java"
        "src/android/car/cluster/renderer/NavigationRenderer.java"
        "src/android/car/content/pm/AppBlockingPackageInfo.java"
        "src/android/car/content/pm/CarAppBlockingPolicy.java"
        "src/android/car/content/pm/CarAppBlockingPolicyService.java"
        "src/android/car/content/pm/CarPackageManager.java"
        "src/android/car/diagnostic/CarDiagnosticEvent.java"
        "src/android/car/diagnostic/CarDiagnosticManager.java"
        "src/android/car/diagnostic/FloatSensorIndex.java"
        "src/android/car/diagnostic/IntegerSensorIndex.java"
        "src/android/car/drivingstate/CarDrivingStateEvent.java"
        "src/android/car/drivingstate/CarDrivingStateManager.java"
        "src/android/car/drivingstate/CarUxRestrictions.java"
        "src/android/car/drivingstate/CarUxRestrictionsConfiguration.java"
        "src/android/car/drivingstate/CarUxRestrictionsManager.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/projection/ProjectionOptions.java"
        "src/android/car/projection/ProjectionStatus.java"
        "src/android/car/settings/CarConfigurationManager.java"
        "src/android/car/settings/CarSettings.java"
        "src/android/car/settings/SpeedBumpConfiguration.java"
        "src/android/car/storagemonitoring/CarStorageMonitoringManager.java"
        "src/android/car/storagemonitoring/IoStats.java"
        "src/android/car/storagemonitoring/IoStatsEntry.java"
        "src/android/car/storagemonitoring/LifetimeWriteInfo.java"
        "src/android/car/storagemonitoring/UidIoRecord.java"
        "src/android/car/storagemonitoring/WearEstimate.java"
        "src/android/car/storagemonitoring/WearEstimateChange.java"
        "src/android/car/test/CarLocationTestHelper.java"
        "src/android/car/test/CarTestManagerBinderWrapper.java"
        "src/android/car/trust/CarTrustAgentEnrollmentManager.java"
        "src/android/car/trust/TrustedDeviceInfo.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/com/android/car/internal/CarPermission.java"
        "src/com/android/car/internal/CarRatedFloatListeners.java"
        "src/com/android/car/internal/CarRatedListeners.java"
        "src/com/android/car/internal/FeatureUtil.java"
        "src/com/android/car/internal/PropertyPermissionMapping.java"
        "src/com/android/car/internal/SingleMessageHandler.java"
        "src_feature_future/com/android/car/internal/FeatureConfiguration.java"
        "src/android/car/IAppFocus.aidl"
        "src/android/car/IAppFocusListener.aidl"
        "src/android/car/IAppFocusOwnershipCallback.aidl"
        "src/android/car/ICar.aidl"
        "src/android/car/ICarBluetooth.aidl"
        "src/android/car/ICarBluetoothUserService.aidl"
        "src/android/car/ICarBugreportCallback.aidl"
        "src/android/car/ICarBugreportService.aidl"
        "src/android/car/ICarConnectionListener.aidl"
        "src/android/car/ICarInfo.aidl"
        "src/android/car/ICarProjection.aidl"
        "src/android/car/ICarProjectionKeyEventHandler.aidl"
        "src/android/car/ICarProjectionStatusListener.aidl"
        "src/android/car/ICarUserService.aidl"
        "src/android/car/ILocationManagerProxy.aidl"
        "src/android/car/cluster/IInstrumentClusterManagerCallback.aidl"
        "src/android/car/cluster/IInstrumentClusterManagerService.aidl"
        "src/android/car/cluster/renderer/IInstrumentCluster.aidl"
        "src/android/car/cluster/renderer/IInstrumentClusterHelper.aidl"
        "src/android/car/cluster/renderer/IInstrumentClusterNavigation.aidl"
        "src/android/car/content/pm/ICarAppBlockingPolicy.aidl"
        "src/android/car/content/pm/ICarAppBlockingPolicySetter.aidl"
        "src/android/car/content/pm/ICarPackageManager.aidl"
        "src/android/car/diagnostic/ICarDiagnostic.aidl"
        "src/android/car/diagnostic/ICarDiagnosticEventListener.aidl"
        "src/android/car/drivingstate/ICarDrivingState.aidl"
        "src/android/car/drivingstate/ICarDrivingStateChangeListener.aidl"
        "src/android/car/drivingstate/ICarUxRestrictionsChangeListener.aidl"
        "src/android/car/drivingstate/ICarUxRestrictionsManager.aidl"
        "src/android/car/hardware/ICarSensor.aidl"
        "src/android/car/hardware/ICarSensorEventListener.aidl"
        "src/android/car/hardware/power/ICarPower.aidl"
        "src/android/car/hardware/power/ICarPowerStateListener.aidl"
        "src/android/car/hardware/property/ICarProperty.aidl"
        "src/android/car/hardware/property/ICarPropertyEventListener.aidl"
        "src/android/car/input/ICarInputListener.aidl"
        "src/android/car/media/ICarAudio.aidl"
        "src/android/car/media/ICarMedia.aidl"
        "src/android/car/media/ICarMediaSourceListener.aidl"
        "src/android/car/media/ICarVolumeCallback.aidl"
        "src/android/car/settings/ICarConfigurationManager.aidl"
        "src/android/car/storagemonitoring/ICarStorageMonitoring.aidl"
        "src/android/car/storagemonitoring/IIoStatsListener.aidl"
        "src/android/car/storagemonitoring/IoStats.aidl"
        "src/android/car/storagemonitoring/IoStatsEntry.aidl"
        "src/android/car/trust/ICarTrustAgentBleCallback.aidl"
        "src/android/car/trust/ICarTrustAgentEnrollment.aidl"
        "src/android/car/trust/ICarTrustAgentEnrollmentCallback.aidl"
        "src/android/car/user/IUserNotice.aidl"
        "src/android/car/user/IUserNoticeUI.aidl"
        "src/android/car/vms/IVmsPublisherClient.aidl"
        "src/android/car/vms/IVmsPublisherService.aidl"
        "src/android/car/vms/IVmsSubscriberClient.aidl"
        "src/android/car/vms/IVmsSubscriberService.aidl"
    ];
    aidl = {
        include_dirs = [
            "system/bt/binder"
        ];
    };
    exclude_srcs = [
        "src/android/car/storagemonitoring/IoStats.aidl"
        "src/android/car/storagemonitoring/IoStatsEntry.aidl"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    installable = true;
};

"android.car-docs-default" = stubs_defaults {
    name = "android.car-docs-default";
    srcs = [
        "src/android/car/AoapService.java"
        "src/android/car/Car.java"
        "src/android/car/CarAppFocusManager.java"
        "src/android/car/CarBluetoothManager.java"
        "src/android/car/CarBugreportManager.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarProjectionManager.java"
        "src/android/car/CarTransactionException.java"
        "src/android/car/EvConnectorType.java"
        "src/android/car/FuelType.java"
        "src/android/car/PortLocationType.java"
        "src/android/car/VehicleAreaDoor.java"
        "src/android/car/VehicleAreaMirror.java"
        "src/android/car/VehicleAreaSeat.java"
        "src/android/car/VehicleAreaType.java"
        "src/android/car/VehicleAreaWheel.java"
        "src/android/car/VehicleAreaWindow.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/FutureFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/cluster/CarInstrumentClusterManager.java"
        "src/android/car/cluster/ClusterActivityState.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderer.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderingService.java"
        "src/android/car/cluster/renderer/NavigationRenderer.java"
        "src/android/car/content/pm/AppBlockingPackageInfo.java"
        "src/android/car/content/pm/CarAppBlockingPolicy.java"
        "src/android/car/content/pm/CarAppBlockingPolicyService.java"
        "src/android/car/content/pm/CarPackageManager.java"
        "src/android/car/diagnostic/CarDiagnosticEvent.java"
        "src/android/car/diagnostic/CarDiagnosticManager.java"
        "src/android/car/diagnostic/FloatSensorIndex.java"
        "src/android/car/diagnostic/IntegerSensorIndex.java"
        "src/android/car/drivingstate/CarDrivingStateEvent.java"
        "src/android/car/drivingstate/CarDrivingStateManager.java"
        "src/android/car/drivingstate/CarUxRestrictions.java"
        "src/android/car/drivingstate/CarUxRestrictionsConfiguration.java"
        "src/android/car/drivingstate/CarUxRestrictionsManager.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/projection/ProjectionOptions.java"
        "src/android/car/projection/ProjectionStatus.java"
        "src/android/car/settings/CarConfigurationManager.java"
        "src/android/car/settings/CarSettings.java"
        "src/android/car/settings/SpeedBumpConfiguration.java"
        "src/android/car/storagemonitoring/CarStorageMonitoringManager.java"
        "src/android/car/storagemonitoring/IoStats.java"
        "src/android/car/storagemonitoring/IoStatsEntry.java"
        "src/android/car/storagemonitoring/LifetimeWriteInfo.java"
        "src/android/car/storagemonitoring/UidIoRecord.java"
        "src/android/car/storagemonitoring/WearEstimate.java"
        "src/android/car/storagemonitoring/WearEstimateChange.java"
        "src/android/car/test/CarLocationTestHelper.java"
        "src/android/car/test/CarTestManagerBinderWrapper.java"
        "src/android/car/trust/CarTrustAgentEnrollmentManager.java"
        "src/android/car/trust/TrustedDeviceInfo.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/com/android/car/internal/CarPermission.java"
        "src/com/android/car/internal/CarRatedFloatListeners.java"
        "src/com/android/car/internal/CarRatedListeners.java"
        "src/com/android/car/internal/FeatureUtil.java"
        "src/com/android/car/internal/PropertyPermissionMapping.java"
        "src/com/android/car/internal/SingleMessageHandler.java"
        "src_feature_future/com/android/car/internal/FeatureConfiguration.java"
    ];
    libs = [
        "android.car"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

android-car-last-released-api = genrule {
    name = "android-car-last-released-api";
    srcs = [
        "api/released/1.txt"
        "api/released/2.txt"
        "api/released/3.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -n | tail -1) $(genDir)/last-released-api.txt";
    out = [
        "last-released-api.txt"
    ];
};

android-car-last-released-system-api = genrule {
    name = "android-car-last-released-system-api";
    srcs = [
        "api/system-released/system-1.txt"
        "api/system-released/system-2.txt"
    ];
    cmd = "cp -f $$(echo $(in) | tr \" \" \"\\n\" | sort -n | tail -1) $(genDir)/last-released-system-api.txt";
    out = [
        "last-released-system-api.txt"
    ];
};

"android.car-stubs-docs" = droidstubs {
    name = "android.car-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* ";
    installable = false;
    check_api = {
        last_released = {
            api_file = ":android-car-last-released-api";
            removed_api_file = "api/removed.txt";
            args = " -hide 2 -hide 3 -hide 4 -hide 5 -hide 6 -hide 24 -hide 25 -hide 26 -hide 27 " +
                " -warning 7 -warning 8 -warning 9 -warning 10 -warning 11 -warning 12 " +
                " -warning 13 -warning 14 -warning 15 -warning 16 -warning 17 -warning 18 -hide 113 ";
        };
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-system-stubs-docs" = droidstubs {
    name = "android.car-system-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR_SYSTEM";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* " +
        "--show-annotation android.annotation.SystemApi ";
    installable = false;
    check_api = {
        last_released = {
            api_file = ":android-car-last-released-system-api";
            removed_api_file = "api/system-removed.txt";
            args = " -hide 2 -hide 3 -hide 4 -hide 5 -hide 6 -hide 24 -hide 25 -hide 26 -hide 27 " +
                " -warning 7 -warning 8 -warning 9 -warning 10 -warning 11 -warning 12 " +
                " -warning 13 -warning 14 -warning 15 -warning 16 -warning 17 -warning 18 -hide 113 ";
        };
        current = {
            api_file = "api/system-current.txt";
            removed_api_file = "api/system-removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-test-stubs-docs" = droidstubs {
    name = "android.car-test-stubs-docs";
    defaults = ["android.car-docs-default"];
    api_tag_name = "ANDROID_CAR_SYSTEM";
    api_filename = "api.txt";
    removed_api_filename = "removed.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* " +
        "--show-annotation android.annotation.TestApi ";
    installable = false;
    check_api = {
        current = {
            api_file = "api/test-current.txt";
            removed_api_file = "api/test-removed.txt";
            args = " -error 2 -error 3 -error 4 -error 5 -error 6 -error 7 -error 8 -error 9 -error 10 -error 11 " +
                " -error 12 -error 13 -error 14 -error 15 -error 16 -error 17 -error 18 -error 19 -error 20 " +
                " -error 21 -error 23 -error 24 -error 25 -hide 113 ";
        };
    };
};

"android.car-stub-docs" = droidstubs {
    name = "android.car-stub-docs";
    srcs = [
        "src/android/car/AoapService.java"
        "src/android/car/Car.java"
        "src/android/car/CarAppFocusManager.java"
        "src/android/car/CarBluetoothManager.java"
        "src/android/car/CarBugreportManager.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarProjectionManager.java"
        "src/android/car/CarTransactionException.java"
        "src/android/car/EvConnectorType.java"
        "src/android/car/FuelType.java"
        "src/android/car/PortLocationType.java"
        "src/android/car/VehicleAreaDoor.java"
        "src/android/car/VehicleAreaMirror.java"
        "src/android/car/VehicleAreaSeat.java"
        "src/android/car/VehicleAreaType.java"
        "src/android/car/VehicleAreaWheel.java"
        "src/android/car/VehicleAreaWindow.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/FutureFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/cluster/CarInstrumentClusterManager.java"
        "src/android/car/cluster/ClusterActivityState.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderer.java"
        "src/android/car/cluster/renderer/InstrumentClusterRenderingService.java"
        "src/android/car/cluster/renderer/NavigationRenderer.java"
        "src/android/car/content/pm/AppBlockingPackageInfo.java"
        "src/android/car/content/pm/CarAppBlockingPolicy.java"
        "src/android/car/content/pm/CarAppBlockingPolicyService.java"
        "src/android/car/content/pm/CarPackageManager.java"
        "src/android/car/diagnostic/CarDiagnosticEvent.java"
        "src/android/car/diagnostic/CarDiagnosticManager.java"
        "src/android/car/diagnostic/FloatSensorIndex.java"
        "src/android/car/diagnostic/IntegerSensorIndex.java"
        "src/android/car/drivingstate/CarDrivingStateEvent.java"
        "src/android/car/drivingstate/CarDrivingStateManager.java"
        "src/android/car/drivingstate/CarUxRestrictions.java"
        "src/android/car/drivingstate/CarUxRestrictionsConfiguration.java"
        "src/android/car/drivingstate/CarUxRestrictionsManager.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/projection/ProjectionOptions.java"
        "src/android/car/projection/ProjectionStatus.java"
        "src/android/car/settings/CarConfigurationManager.java"
        "src/android/car/settings/CarSettings.java"
        "src/android/car/settings/SpeedBumpConfiguration.java"
        "src/android/car/storagemonitoring/CarStorageMonitoringManager.java"
        "src/android/car/storagemonitoring/IoStats.java"
        "src/android/car/storagemonitoring/IoStatsEntry.java"
        "src/android/car/storagemonitoring/LifetimeWriteInfo.java"
        "src/android/car/storagemonitoring/UidIoRecord.java"
        "src/android/car/storagemonitoring/WearEstimate.java"
        "src/android/car/storagemonitoring/WearEstimateChange.java"
        "src/android/car/test/CarLocationTestHelper.java"
        "src/android/car/test/CarTestManagerBinderWrapper.java"
        "src/android/car/trust/CarTrustAgentEnrollmentManager.java"
        "src/android/car/trust/TrustedDeviceInfo.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/com/android/car/internal/CarPermission.java"
        "src/com/android/car/internal/CarRatedFloatListeners.java"
        "src/com/android/car/internal/CarRatedListeners.java"
        "src/com/android/car/internal/FeatureUtil.java"
        "src/com/android/car/internal/PropertyPermissionMapping.java"
        "src/com/android/car/internal/SingleMessageHandler.java"
    ];
    libs = [
        "android.car"
    ];
    api_tag_name = "ANDROID_CAR_STUB";
    api_filename = "api.txt";
    args = "--hide UnavailableSymbol --no-docs --stub-packages android.car* ";
    installable = false;
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

"android.car-stubs" = java_library {
    name = "android.car-stubs";
    srcs = [
        ":android.car-stub-docs"
    ];
    sdk_version = "current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-system-stubs" = java_library {
    name = "android.car-system-stubs";
    srcs = [
        ":android.car-system-stubs-docs"
        "src_stub/android/media/AudioPatch.java"
    ];
    sdk_version = "system_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-test-stubs" = java_library {
    name = "android.car-test-stubs";
    srcs = [
        ":android.car-test-stubs-docs"
    ];
    sdk_version = "test_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
    dist = {
        targets = ["dist_files"];
    };
};

in { inherit "android.car" "android.car-docs-default" "android.car-stub-docs" "android.car-stubs" "android.car-stubs-docs" "android.car-system-stubs" "android.car-system-stubs-docs" "android.car-test-stubs" "android.car-test-stubs-docs" "android.car.cluster.navigation" "android.car.settings" android-car-last-released-api android-car-last-released-system-api libcarpowermanager; }
