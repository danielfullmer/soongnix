{ cc_library, droidstubs, filegroup, genrule, java_library, stubs_defaults }:
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

libcarpowermanager_aidl = filegroup {
    name = "libcarpowermanager_aidl";
    srcs = [
        "src/android/car/ICar.aidl"
        "src/android/car/hardware/power/ICarPower.aidl"
        "src/android/car/hardware/power/ICarPowerStateListener.aidl"
    ];
    path = "src";
};

libcarpowermanager = cc_library {
    name = "libcarpowermanager";
    vendor_available = true;

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
        ":libcarpowermanager_aidl"
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
        "src/android/car/CarFeatures.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarOccupantZoneManager.java"
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
        "src/android/car/VehicleGear.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/ExperimentalFeature.java"
        "src/android/car/annotation/MandatoryFeature.java"
        "src/android/car/annotation/OptionalFeature.java"
        "src/android/car/annotation/RequiredFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/app/CarActivityView.java"
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
        "src/android/car/hardware/CarHvacFanDirection.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarInternalErrorException.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/hardware/property/PropertyAccessDeniedSecurityException.java"
        "src/android/car/hardware/property/PropertyNotAvailableAndRetryException.java"
        "src/android/car/hardware/property/PropertyNotAvailableException.java"
        "src/android/car/hardware/property/VehicleHalStatusCode.java"
        "src/android/car/hardware/property/VehicleVendorPermission.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/input/CarInputManager.java"
        "src/android/car/input/RotaryEvent.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/occupantawareness/DriverMonitoringDetection.java"
        "src/android/car/occupantawareness/GazeDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessManager.java"
        "src/android/car/occupantawareness/Point3D.java"
        "src/android/car/occupantawareness/SystemStatusEvent.java"
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
        "src/android/car/user/CarUserManager.java"
        "src/android/car/user/CommonResults.java"
        "src/android/car/user/ExperimentalCarUserManager.java"
        "src/android/car/user/UserCreationResult.java"
        "src/android/car/user/UserIdentificationAssociationResponse.java"
        "src/android/car/user/UserRemovalResult.java"
        "src/android/car/user/UserSwitchResult.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsClient.java"
        "src/android/car/vms/VmsClientManager.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsProviderInfo.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsRegistrationInfo.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionHelper.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/android/car/watchdog/CarWatchdogManager.java"
        "src/com/android/car/internal/CarPermission.java"
        "src/com/android/car/internal/CarRatedFloatListeners.java"
        "src/com/android/car/internal/CarRatedListeners.java"
        "src/com/android/car/internal/FeatureUtil.java"
        "src/com/android/car/internal/PropertyPermissionMapping.java"
        "src/com/android/car/internal/SingleMessageHandler.java"
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
        "src/android/car/ICarOccupantZone.aidl"
        "src/android/car/ICarOccupantZoneCallback.aidl"
        "src/android/car/ICarProjection.aidl"
        "src/android/car/ICarProjectionKeyEventHandler.aidl"
        "src/android/car/ICarProjectionStatusListener.aidl"
        "src/android/car/ICarUserService.aidl"
        "src/android/car/IExperimentalCar.aidl"
        "src/android/car/IExperimentalCarHelper.aidl"
        "src/android/car/ILocationManagerProxy.aidl"
        "src/android/car/IPerUserCarService.aidl"
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
        "src/android/car/input/ICarInput.aidl"
        "src/android/car/input/ICarInputCallback.aidl"
        "src/android/car/input/ICarInputListener.aidl"
        "src/android/car/media/ICarAudio.aidl"
        "src/android/car/media/ICarMedia.aidl"
        "src/android/car/media/ICarMediaSourceListener.aidl"
        "src/android/car/media/ICarVolumeCallback.aidl"
        "src/android/car/occupantawareness/IOccupantAwarenessEventCallback.aidl"
        "src/android/car/occupantawareness/IOccupantAwarenessManager.aidl"
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
        "src/android/car/vms/IVmsBrokerService.aidl"
        "src/android/car/vms/IVmsClientCallback.aidl"
        "src/android/car/watchdog/ICarWatchdogService.aidl"
    ];
    aidl = {
        include_dirs = [
            "system/bt/binder"
            "packages/services/Car/watchdog/aidl"
        ];
    };
    exclude_srcs = [
        "src/android/car/storagemonitoring/IoStats.aidl"
        "src/android/car/storagemonitoring/IoStatsEntry.aidl"
    ];
    static_libs = [
        "android.car.internal.event-log-tags"
        "carwatchdog_aidl_interface-java"
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
        "src/android/car/CarFeatures.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarOccupantZoneManager.java"
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
        "src/android/car/VehicleGear.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/ExperimentalFeature.java"
        "src/android/car/annotation/MandatoryFeature.java"
        "src/android/car/annotation/OptionalFeature.java"
        "src/android/car/annotation/RequiredFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/app/CarActivityView.java"
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
        "src/android/car/hardware/CarHvacFanDirection.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarInternalErrorException.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/hardware/property/PropertyAccessDeniedSecurityException.java"
        "src/android/car/hardware/property/PropertyNotAvailableAndRetryException.java"
        "src/android/car/hardware/property/PropertyNotAvailableException.java"
        "src/android/car/hardware/property/VehicleHalStatusCode.java"
        "src/android/car/hardware/property/VehicleVendorPermission.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/input/CarInputManager.java"
        "src/android/car/input/RotaryEvent.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/occupantawareness/DriverMonitoringDetection.java"
        "src/android/car/occupantawareness/GazeDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessManager.java"
        "src/android/car/occupantawareness/Point3D.java"
        "src/android/car/occupantawareness/SystemStatusEvent.java"
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
        "src/android/car/user/CarUserManager.java"
        "src/android/car/user/CommonResults.java"
        "src/android/car/user/ExperimentalCarUserManager.java"
        "src/android/car/user/UserCreationResult.java"
        "src/android/car/user/UserIdentificationAssociationResponse.java"
        "src/android/car/user/UserRemovalResult.java"
        "src/android/car/user/UserSwitchResult.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsClient.java"
        "src/android/car/vms/VmsClientManager.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsProviderInfo.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsRegistrationInfo.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionHelper.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/android/car/watchdog/CarWatchdogManager.java"
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
    removed_dex_api_filename = "removed-dex.txt";
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
        api_lint = {
            enabled = true;
            baseline_file = "api/lint-baseline.txt";
        };
    };
};

"android.car-system-stubs-docs" = droidstubs {
    name = "android.car-system-stubs-docs";
    defaults = ["android.car-docs-default"];
    removed_dex_api_filename = "system-removed-dex.txt";
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
        api_lint = {
            enabled = true;
            baseline_file = "api/system-lint-baseline.txt";
        };
    };
};

"android.car-test-stubs-docs" = droidstubs {
    name = "android.car-test-stubs-docs";
    defaults = ["android.car-docs-default"];
    args = "--hide HiddenSuperclass --hide UnavailableSymbol --no-docs --stub-packages android.car* " +
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
        "src/android/car/CarFeatures.java"
        "src/android/car/CarInfoManager.java"
        "src/android/car/CarLibLog.java"
        "src/android/car/CarManagerBase.java"
        "src/android/car/CarNotConnectedException.java"
        "src/android/car/CarOccupantZoneManager.java"
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
        "src/android/car/VehicleGear.java"
        "src/android/car/VehicleHvacFanDirection.java"
        "src/android/car/VehicleLightState.java"
        "src/android/car/VehicleLightSwitch.java"
        "src/android/car/VehicleOilLevel.java"
        "src/android/car/VehiclePropertyAccess.java"
        "src/android/car/VehiclePropertyIds.java"
        "src/android/car/VehiclePropertyType.java"
        "src/android/car/VehicleSeatOccupancyState.java"
        "src/android/car/VehicleUnit.java"
        "src/android/car/annotation/ExperimentalFeature.java"
        "src/android/car/annotation/MandatoryFeature.java"
        "src/android/car/annotation/OptionalFeature.java"
        "src/android/car/annotation/RequiredFeature.java"
        "src/android/car/annotation/ValueTypeDef.java"
        "src/android/car/app/CarActivityView.java"
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
        "src/android/car/hardware/CarHvacFanDirection.java"
        "src/android/car/hardware/CarPropertyConfig.java"
        "src/android/car/hardware/CarPropertyValue.java"
        "src/android/car/hardware/CarSensorConfig.java"
        "src/android/car/hardware/CarSensorEvent.java"
        "src/android/car/hardware/CarSensorManager.java"
        "src/android/car/hardware/CarVendorExtensionManager.java"
        "src/android/car/hardware/cabin/CarCabinManager.java"
        "src/android/car/hardware/hvac/CarHvacManager.java"
        "src/android/car/hardware/power/CarPowerManager.java"
        "src/android/car/hardware/property/CarInternalErrorException.java"
        "src/android/car/hardware/property/CarPropertyEvent.java"
        "src/android/car/hardware/property/CarPropertyManager.java"
        "src/android/car/hardware/property/PropertyAccessDeniedSecurityException.java"
        "src/android/car/hardware/property/PropertyNotAvailableAndRetryException.java"
        "src/android/car/hardware/property/PropertyNotAvailableException.java"
        "src/android/car/hardware/property/VehicleHalStatusCode.java"
        "src/android/car/hardware/property/VehicleVendorPermission.java"
        "src/android/car/input/CarInputHandlingService.java"
        "src/android/car/input/CarInputManager.java"
        "src/android/car/input/RotaryEvent.java"
        "src/android/car/media/CarAudioManager.java"
        "src/android/car/media/CarAudioPatchHandle.java"
        "src/android/car/media/CarMediaManager.java"
        "src/android/car/navigation/CarNavigationInstrumentCluster.java"
        "src/android/car/navigation/CarNavigationStatusManager.java"
        "src/android/car/occupantawareness/DriverMonitoringDetection.java"
        "src/android/car/occupantawareness/GazeDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessDetection.java"
        "src/android/car/occupantawareness/OccupantAwarenessManager.java"
        "src/android/car/occupantawareness/Point3D.java"
        "src/android/car/occupantawareness/SystemStatusEvent.java"
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
        "src/android/car/user/CarUserManager.java"
        "src/android/car/user/CommonResults.java"
        "src/android/car/user/ExperimentalCarUserManager.java"
        "src/android/car/user/UserCreationResult.java"
        "src/android/car/user/UserIdentificationAssociationResponse.java"
        "src/android/car/user/UserRemovalResult.java"
        "src/android/car/user/UserSwitchResult.java"
        "src/android/car/vms/VmsAssociatedLayer.java"
        "src/android/car/vms/VmsAvailableLayers.java"
        "src/android/car/vms/VmsClient.java"
        "src/android/car/vms/VmsClientManager.java"
        "src/android/car/vms/VmsLayer.java"
        "src/android/car/vms/VmsLayerDependency.java"
        "src/android/car/vms/VmsLayersOffering.java"
        "src/android/car/vms/VmsOperationRecorder.java"
        "src/android/car/vms/VmsProviderInfo.java"
        "src/android/car/vms/VmsPublisherClientService.java"
        "src/android/car/vms/VmsRegistrationInfo.java"
        "src/android/car/vms/VmsSubscriberManager.java"
        "src/android/car/vms/VmsSubscriptionHelper.java"
        "src/android/car/vms/VmsSubscriptionState.java"
        "src/android/car/watchdog/CarWatchdogManager.java"
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
    api_filename = "api.txt";
    args = "--hide HiddenSuperclass --hide UnavailableSymbol --no-docs --stub-packages android.car* ";
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
    installable = false;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-stubs-dex" = java_library {
    name = "android.car-stubs-dex";
    static_libs = ["android.car-stubs"];
    sdk_version = "current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
};

"android.car-system-stubs" = java_library {
    name = "android.car-system-stubs";
    srcs = [
        ":android.car-system-stubs-docs"
    ];
    sdk_version = "system_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    installable = false;
    dist = {
        targets = ["dist_files"];
    };
};

"android.car-system-stubs-dex" = java_library {
    name = "android.car-system-stubs-dex";
    static_libs = ["android.car-system-stubs"];
    sdk_version = "system_current";
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
    compile_dex = true;
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
    installable = false;
};

"android.car-test-stubs-dex" = java_library {
    name = "android.car-test-stubs-dex";
    static_libs = ["android.car-test-stubs"];
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

#  Export the api/system-current.txt file.
"car-api-system-current.txt" = filegroup {
    name = "car-api-system-current.txt";
    visibility = [
        "//cts/tests/signature/api"
    ];
    srcs = [
        "api/system-current.txt"
    ];
};

#  Export the api/system-removed.txt file.
"car-api-system-removed.txt" = filegroup {
    name = "car-api-system-removed.txt";
    visibility = [
        "//cts/tests/signature/api"
    ];
    srcs = [
        "api/system-removed.txt"
    ];
};

in { inherit "android.car" "android.car-docs-default" "android.car-stub-docs" "android.car-stubs" "android.car-stubs-dex" "android.car-stubs-docs" "android.car-system-stubs" "android.car-system-stubs-dex" "android.car-system-stubs-docs" "android.car-test-stubs" "android.car-test-stubs-dex" "android.car-test-stubs-docs" "android.car.cluster.navigation" "android.car.settings" "car-api-system-current.txt" "car-api-system-removed.txt" android-car-last-released-api android-car-last-released-system-api libcarpowermanager libcarpowermanager_aidl; }
