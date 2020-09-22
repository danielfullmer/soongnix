{ android_app, android_library }:
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

CompanionDeviceSupport-aidl = android_library {
    name = "CompanionDeviceSupport-aidl";

    srcs = [
        "src/com/android/car/companiondevicesupport/api/external/AssociatedDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/CompanionDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/ConnectedDeviceManagerBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/association/AssociationBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/trust/TrustedDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/IConnectedDeviceManager.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IConnectionCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IDeviceAssociationCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IDeviceCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/association/IAssociatedDeviceManager.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/association/IAssociationCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceAgentDelegate.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceEnrollmentCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceManager.aidl"
    ];

    manifest = "AndroidManifest_aidl.xml";

    resource_dirs = [];

    static_libs = [
        "connected-device-lib"
    ];

    aidl = {
        local_include_dirs = [
            "src/com/android/car/companiondevicesupport/api"
        ];
    };
};

CompanionDeviceSupport-lib = android_library {
    name = "CompanionDeviceSupport-lib";

    srcs = [
        "src/com/android/car/companiondevicesupport/activity/AddAssociatedDeviceFragment.java"
        "src/com/android/car/companiondevicesupport/activity/AssociatedDeviceDetailFragment.java"
        "src/com/android/car/companiondevicesupport/activity/AssociatedDeviceDetails.java"
        "src/com/android/car/companiondevicesupport/activity/AssociatedDeviceViewModel.java"
        "src/com/android/car/companiondevicesupport/activity/AssociationActivity.java"
        "src/com/android/car/companiondevicesupport/activity/AssociationErrorFragment.java"
        "src/com/android/car/companiondevicesupport/activity/ConfirmPairingCodeFragment.java"
        "src/com/android/car/companiondevicesupport/activity/TurnOnBluetoothFragment.java"
        "src/com/android/car/companiondevicesupport/api/external/AssociatedDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/CompanionDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/ConnectedDeviceManagerBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/association/AssociationBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/trust/TrustedDevice.java"
        "src/com/android/car/companiondevicesupport/feature/LocalFeature.java"
        "src/com/android/car/companiondevicesupport/feature/RemoteFeature.java"
        "src/com/android/car/companiondevicesupport/feature/calendarsync/CalendarCleaner.java"
        "src/com/android/car/companiondevicesupport/feature/calendarsync/CalendarImporter.java"
        "src/com/android/car/companiondevicesupport/feature/calendarsync/CalendarSyncFeature.java"
        "src/com/android/car/companiondevicesupport/feature/calendarsync/CalendarSyncManager.java"
        "src/com/android/car/companiondevicesupport/feature/calendarsync/CalendarSyncService.java"
        "src/com/android/car/companiondevicesupport/feature/howitzer/ConnectionHowitzer.java"
        "src/com/android/car/companiondevicesupport/feature/notificationmsg/NotificationMsgDelegate.java"
        "src/com/android/car/companiondevicesupport/feature/notificationmsg/NotificationMsgFeature.java"
        "src/com/android/car/companiondevicesupport/feature/notificationmsg/NotificationMsgService.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceAgentService.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceConstants.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceEventLog.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceFeature.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceManager.java"
        "src/com/android/car/companiondevicesupport/feature/trust/TrustedDeviceManagerService.java"
        "src/com/android/car/companiondevicesupport/feature/trust/storage/TrustedDeviceDao.java"
        "src/com/android/car/companiondevicesupport/feature/trust/storage/TrustedDeviceDatabase.java"
        "src/com/android/car/companiondevicesupport/feature/trust/storage/TrustedDeviceEntity.java"
        "src/com/android/car/companiondevicesupport/feature/trust/ui/TrustedDeviceActivity.java"
        "src/com/android/car/companiondevicesupport/feature/trust/ui/TrustedDeviceDetailFragment.java"
        "src/com/android/car/companiondevicesupport/feature/trust/ui/TrustedDeviceViewModel.java"
        "src/com/android/car/companiondevicesupport/service/CompanionDeviceSupportService.java"
    ];

    exclude_srcs = [
        "src/com/android/car/companiondevicesupport/api/external/AssociatedDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/CompanionDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/ConnectedDeviceManagerBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/association/AssociationBinder.java"
        "src/com/android/car/companiondevicesupport/api/internal/trust/TrustedDevice.java"
        "src/com/android/car/companiondevicesupport/api/external/IConnectedDeviceManager.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IConnectionCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IDeviceAssociationCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/external/IDeviceCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/association/IAssociatedDeviceManager.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/association/IAssociationCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceAgentDelegate.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceEnrollmentCallback.aidl"
        "src/com/android/car/companiondevicesupport/api/internal/trust/ITrustedDeviceManager.aidl"
    ];

    resource_dirs = ["res"];

    platform_apis = true;

    optimize = {
        enabled = false;
    };

    libs = [
        "android.car"
    ];

    static_libs = [
        "CompanionDeviceSupport-aidl"
        "CompanionDeviceSupport-proto"
        "androidx-constraintlayout_constraintlayout"
        "androidx-constraintlayout_constraintlayout-solver"
        "androidx.legacy_legacy-support-v4"
        "androidx.room_room-runtime"
        "car-messenger-common"
        "car-messenger-protos"
        "car-ui-lib"
        "com.google.android.material_material"
        "companion-feature-calendarsync-protos"
        "connected-device-lib"
        "encryption-runner"
    ];

    plugins = [
        "androidx.room_room-compiler-plugin"
    ];
};

CompanionDeviceSupport = android_app {
    name = "CompanionDeviceSupport";

    platform_apis = true;

    certificate = "platform";

    privileged = true;

    static_libs = [
        "CompanionDeviceSupport-aidl"
        "CompanionDeviceSupport-lib"
    ];

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };

    required = ["privapp_whitelist_com.android.car.companiondevicesupport"];
};

in { inherit CompanionDeviceSupport CompanionDeviceSupport-aidl CompanionDeviceSupport-lib; }
