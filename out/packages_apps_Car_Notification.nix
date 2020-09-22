{ android_app, android_library }:
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
#

CarNotification = android_app {
    name = "CarNotification";

    srcs = [
        "src/com/android/car/notification/AlertEntry.java"
        "src/com/android/car/notification/Beeper.java"
        "src/com/android/car/notification/CarHeadsUpNotificationManager.java"
        "src/com/android/car/notification/CarNotificationCenterActivity.java"
        "src/com/android/car/notification/CarNotificationDiff.java"
        "src/com/android/car/notification/CarNotificationItemController.java"
        "src/com/android/car/notification/CarNotificationItemTouchListener.java"
        "src/com/android/car/notification/CarNotificationListener.java"
        "src/com/android/car/notification/CarNotificationTypeItem.java"
        "src/com/android/car/notification/CarNotificationView.java"
        "src/com/android/car/notification/CarNotificationViewAdapter.java"
        "src/com/android/car/notification/CarUxRestrictionManagerWrapper.java"
        "src/com/android/car/notification/DismissAnimationHelper.java"
        "src/com/android/car/notification/HeadsUpEntry.java"
        "src/com/android/car/notification/HeadsUpNotificationOnTouchListener.java"
        "src/com/android/car/notification/NotificationApplication.java"
        "src/com/android/car/notification/NotificationClickHandlerFactory.java"
        "src/com/android/car/notification/NotificationDataManager.java"
        "src/com/android/car/notification/NotificationGroup.java"
        "src/com/android/car/notification/NotificationUtils.java"
        "src/com/android/car/notification/NotificationViewController.java"
        "src/com/android/car/notification/NotificationViewType.java"
        "src/com/android/car/notification/PreprocessingManager.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationAppContainer.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationContainer.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationBottomAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationRightAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationTopAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/HeadsUpNotificationAnimationHelper.java"
        "src/com/android/car/notification/template/BasicNotificationViewHolder.java"
        "src/com/android/car/notification/template/CallNotificationViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationActionsView.java"
        "src/com/android/car/notification/template/CarNotificationBaseViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationBodyView.java"
        "src/com/android/car/notification/template/CarNotificationFooterViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationHeaderView.java"
        "src/com/android/car/notification/template/CarNotificationHeaderViewHolder.java"
        "src/com/android/car/notification/template/EmergencyNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupSummaryNotificationViewHolder.java"
        "src/com/android/car/notification/template/InboxNotificationViewHolder.java"
        "src/com/android/car/notification/template/MessageNotificationViewHolder.java"
        "src/com/android/car/notification/template/NavigationNotificationViewHolder.java"
        "src/com/android/car/notification/template/ProgressNotificationViewHolder.java"
    ];

    resource_dirs = ["res"];

    platform_apis = true;
    certificate = "platform";
    privileged = true;

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.palette_palette"
        "car-assist-client-lib"
        "car-ui-lib"
        "android.car.userlib"
        "androidx-constraintlayout_constraintlayout"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

#  Duplicate of CarNotification which includes testing only resources for Robolectric
CarNotificationForTesting = android_app {
    name = "CarNotificationForTesting";

    srcs = [
        "src/com/android/car/notification/AlertEntry.java"
        "src/com/android/car/notification/Beeper.java"
        "src/com/android/car/notification/CarHeadsUpNotificationManager.java"
        "src/com/android/car/notification/CarNotificationCenterActivity.java"
        "src/com/android/car/notification/CarNotificationDiff.java"
        "src/com/android/car/notification/CarNotificationItemController.java"
        "src/com/android/car/notification/CarNotificationItemTouchListener.java"
        "src/com/android/car/notification/CarNotificationListener.java"
        "src/com/android/car/notification/CarNotificationTypeItem.java"
        "src/com/android/car/notification/CarNotificationView.java"
        "src/com/android/car/notification/CarNotificationViewAdapter.java"
        "src/com/android/car/notification/CarUxRestrictionManagerWrapper.java"
        "src/com/android/car/notification/DismissAnimationHelper.java"
        "src/com/android/car/notification/HeadsUpEntry.java"
        "src/com/android/car/notification/HeadsUpNotificationOnTouchListener.java"
        "src/com/android/car/notification/NotificationApplication.java"
        "src/com/android/car/notification/NotificationClickHandlerFactory.java"
        "src/com/android/car/notification/NotificationDataManager.java"
        "src/com/android/car/notification/NotificationGroup.java"
        "src/com/android/car/notification/NotificationUtils.java"
        "src/com/android/car/notification/NotificationViewController.java"
        "src/com/android/car/notification/NotificationViewType.java"
        "src/com/android/car/notification/PreprocessingManager.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationAppContainer.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationContainer.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationBottomAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationRightAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationTopAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/HeadsUpNotificationAnimationHelper.java"
        "src/com/android/car/notification/template/BasicNotificationViewHolder.java"
        "src/com/android/car/notification/template/CallNotificationViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationActionsView.java"
        "src/com/android/car/notification/template/CarNotificationBaseViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationBodyView.java"
        "src/com/android/car/notification/template/CarNotificationFooterViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationHeaderView.java"
        "src/com/android/car/notification/template/CarNotificationHeaderViewHolder.java"
        "src/com/android/car/notification/template/EmergencyNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupSummaryNotificationViewHolder.java"
        "src/com/android/car/notification/template/InboxNotificationViewHolder.java"
        "src/com/android/car/notification/template/MessageNotificationViewHolder.java"
        "src/com/android/car/notification/template/NavigationNotificationViewHolder.java"
        "src/com/android/car/notification/template/ProgressNotificationViewHolder.java"
    ];

    #  Testing only resources must be applied last so they take precedence.
    resource_dirs = [
        "res"
        "tests/robotests/res"
    ];

    platform_apis = true;
    certificate = "platform";
    privileged = true;

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.palette_palette"
        "car-assist-client-lib"
        "car-ui-lib"
        "android.car.userlib"
        "androidx-constraintlayout_constraintlayout"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

#  As Lib
CarNotificationLib = android_library {
    name = "CarNotificationLib";
    srcs = [
        "src/com/android/car/notification/AlertEntry.java"
        "src/com/android/car/notification/Beeper.java"
        "src/com/android/car/notification/CarHeadsUpNotificationManager.java"
        "src/com/android/car/notification/CarNotificationCenterActivity.java"
        "src/com/android/car/notification/CarNotificationDiff.java"
        "src/com/android/car/notification/CarNotificationItemController.java"
        "src/com/android/car/notification/CarNotificationItemTouchListener.java"
        "src/com/android/car/notification/CarNotificationListener.java"
        "src/com/android/car/notification/CarNotificationTypeItem.java"
        "src/com/android/car/notification/CarNotificationView.java"
        "src/com/android/car/notification/CarNotificationViewAdapter.java"
        "src/com/android/car/notification/CarUxRestrictionManagerWrapper.java"
        "src/com/android/car/notification/DismissAnimationHelper.java"
        "src/com/android/car/notification/HeadsUpEntry.java"
        "src/com/android/car/notification/HeadsUpNotificationOnTouchListener.java"
        "src/com/android/car/notification/NotificationApplication.java"
        "src/com/android/car/notification/NotificationClickHandlerFactory.java"
        "src/com/android/car/notification/NotificationDataManager.java"
        "src/com/android/car/notification/NotificationGroup.java"
        "src/com/android/car/notification/NotificationUtils.java"
        "src/com/android/car/notification/NotificationViewController.java"
        "src/com/android/car/notification/NotificationViewType.java"
        "src/com/android/car/notification/PreprocessingManager.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationAppContainer.java"
        "src/com/android/car/notification/headsup/CarHeadsUpNotificationContainer.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationBottomAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationRightAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/CarHeadsUpNotificationTopAnimationHelper.java"
        "src/com/android/car/notification/headsup/animationhelper/HeadsUpNotificationAnimationHelper.java"
        "src/com/android/car/notification/template/BasicNotificationViewHolder.java"
        "src/com/android/car/notification/template/CallNotificationViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationActionsView.java"
        "src/com/android/car/notification/template/CarNotificationBaseViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationBodyView.java"
        "src/com/android/car/notification/template/CarNotificationFooterViewHolder.java"
        "src/com/android/car/notification/template/CarNotificationHeaderView.java"
        "src/com/android/car/notification/template/CarNotificationHeaderViewHolder.java"
        "src/com/android/car/notification/template/EmergencyNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupNotificationViewHolder.java"
        "src/com/android/car/notification/template/GroupSummaryNotificationViewHolder.java"
        "src/com/android/car/notification/template/InboxNotificationViewHolder.java"
        "src/com/android/car/notification/template/MessageNotificationViewHolder.java"
        "src/com/android/car/notification/template/NavigationNotificationViewHolder.java"
        "src/com/android/car/notification/template/ProgressNotificationViewHolder.java"
    ];

    resource_dirs = ["res"];

    manifest = "AndroidManifest-withoutActivity.xml";

    platform_apis = true;

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.palette_palette"
        "car-assist-client-lib"
        "android.car.userlib"
        "androidx-constraintlayout_constraintlayout"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarNotification CarNotificationForTesting CarNotificationLib; }
