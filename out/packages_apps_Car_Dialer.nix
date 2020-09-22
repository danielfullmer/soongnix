{ android_app }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

CarDialerApp = android_app {
    name = "CarDialerApp";

    srcs = [
        "src/com/android/car/dialer/Constants.java"
        "src/com/android/car/dialer/DialerApplication.java"
        "src/com/android/car/dialer/livedata/AudioRouteLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothErrorStringLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothHfpStateLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothPairListLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothStateLiveData.java"
        "src/com/android/car/dialer/livedata/CallDetailLiveData.java"
        "src/com/android/car/dialer/livedata/CallHistoryLiveData.java"
        "src/com/android/car/dialer/livedata/CallStateLiveData.java"
        "src/com/android/car/dialer/livedata/HeartBeatLiveData.java"
        "src/com/android/car/dialer/livedata/HfpDeviceListLiveData.java"
        "src/com/android/car/dialer/livedata/SharedPreferencesLiveData.java"
        "src/com/android/car/dialer/livedata/UnreadMissedCallLiveData.java"
        "src/com/android/car/dialer/log/L.java"
        "src/com/android/car/dialer/notification/InCallNotificationController.java"
        "src/com/android/car/dialer/notification/MissedCallNotificationController.java"
        "src/com/android/car/dialer/notification/MissedCallReceiver.java"
        "src/com/android/car/dialer/notification/NotificationService.java"
        "src/com/android/car/dialer/notification/NotificationUtils.java"
        "src/com/android/car/dialer/storage/BluetoothBondedListReceiver.java"
        "src/com/android/car/dialer/storage/CipherConverter.java"
        "src/com/android/car/dialer/storage/CipherWrapper.java"
        "src/com/android/car/dialer/storage/FavoriteNumberDao.java"
        "src/com/android/car/dialer/storage/FavoriteNumberDatabase.java"
        "src/com/android/car/dialer/storage/FavoriteNumberEntity.java"
        "src/com/android/car/dialer/storage/FavoriteNumberRepository.java"
        "src/com/android/car/dialer/telecom/InCallRouter.java"
        "src/com/android/car/dialer/telecom/InCallServiceImpl.java"
        "src/com/android/car/dialer/telecom/ProjectionCallHandler.java"
        "src/com/android/car/dialer/telecom/UiBluetoothMonitor.java"
        "src/com/android/car/dialer/telecom/UiCallManager.java"
        "src/com/android/car/dialer/ui/NoHfpActivity.java"
        "src/com/android/car/dialer/ui/NoHfpActivityViewModel.java"
        "src/com/android/car/dialer/ui/TelecomActivity.java"
        "src/com/android/car/dialer/ui/TelecomActivityViewModel.java"
        "src/com/android/car/dialer/ui/TelecomPageTab.java"
        "src/com/android/car/dialer/ui/ToolbarTitleLiveData.java"
        "src/com/android/car/dialer/ui/activecall/ConferenceProfileAdapter.java"
        "src/com/android/car/dialer/ui/activecall/ConferenceProfileViewHolder.java"
        "src/com/android/car/dialer/ui/activecall/InCallActivity.java"
        "src/com/android/car/dialer/ui/activecall/InCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/InCallViewModel.java"
        "src/com/android/car/dialer/ui/activecall/IncomingCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/OnGoingCallControllerBarFragment.java"
        "src/com/android/car/dialer/ui/activecall/OnHoldCallUserProfileFragment.java"
        "src/com/android/car/dialer/ui/activecall/OngoingCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/OngoingConfCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/RingingCallControllerBarFragment.java"
        "src/com/android/car/dialer/ui/calllog/CallHistoryFragment.java"
        "src/com/android/car/dialer/ui/calllog/CallHistoryViewModel.java"
        "src/com/android/car/dialer/ui/calllog/CallLogAdapter.java"
        "src/com/android/car/dialer/ui/calllog/CallLogViewHolder.java"
        "src/com/android/car/dialer/ui/common/ContactResultsLiveData.java"
        "src/com/android/car/dialer/ui/common/DialerBaseFragment.java"
        "src/com/android/car/dialer/ui/common/DialerListBaseFragment.java"
        "src/com/android/car/dialer/ui/common/DialerUtils.java"
        "src/com/android/car/dialer/ui/common/OnItemClickedListener.java"
        "src/com/android/car/dialer/ui/common/UiCallLogLiveData.java"
        "src/com/android/car/dialer/ui/common/entity/ActionButton.java"
        "src/com/android/car/dialer/ui/common/entity/ContactSortingInfo.java"
        "src/com/android/car/dialer/ui/common/entity/Header.java"
        "src/com/android/car/dialer/ui/common/entity/HeaderViewHolder.java"
        "src/com/android/car/dialer/ui/common/entity/UiCallLog.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsAdapter.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsFragment.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsViewHolder.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsViewModel.java"
        "src/com/android/car/dialer/ui/contact/ContactListAdapter.java"
        "src/com/android/car/dialer/ui/contact/ContactListFragment.java"
        "src/com/android/car/dialer/ui/contact/ContactListViewHolder.java"
        "src/com/android/car/dialer/ui/contact/ContactListViewModel.java"
        "src/com/android/car/dialer/ui/dialpad/AbstractDialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/DialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/InCallDialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/KeypadButton.java"
        "src/com/android/car/dialer/ui/dialpad/KeypadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/TypeDownResultsAdapter.java"
        "src/com/android/car/dialer/ui/dialpad/TypeDownResultsViewModel.java"
        "src/com/android/car/dialer/ui/favorite/AddFavoriteFragment.java"
        "src/com/android/car/dialer/ui/favorite/BluetoothFavoriteContactsLiveData.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteAdapter.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteContactViewHolder.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteFragment.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteViewModel.java"
        "src/com/android/car/dialer/ui/search/ContactResultViewHolder.java"
        "src/com/android/car/dialer/ui/search/ContactResultsAdapter.java"
        "src/com/android/car/dialer/ui/search/ContactResultsFragment.java"
        "src/com/android/car/dialer/ui/search/ContactResultsViewModel.java"
        "src/com/android/car/dialer/ui/settings/DialerSettingsActivity.java"
        "src/com/android/car/dialer/ui/settings/DialerSettingsFragment.java"
        "src/com/android/car/dialer/ui/view/CircleBitmapDrawable.java"
        "src/com/android/car/dialer/ui/view/ContactAvatarOutputlineProvider.java"
        "src/com/android/car/dialer/ui/view/ListItemOutlineProvider.java"
        "src/com/android/car/dialer/ui/view/ScaleSpan.java"
        "src/com/android/car/dialer/ui/view/VerticalListDividerDecoration.java"
        "src/com/android/car/dialer/ui/warning/NoHfpFragment.java"
        "src/com/android/car/dialer/widget/CallTypeIconsView.java"
        "src/com/android/car/dialer/widget/CheckableRelativeLayout.java"
        "src/com/android/car/dialer/widget/LoadingFrameLayout.java"
    ];

    resource_dirs = ["res"];

    platform_apis = true;

    required = ["privapp_whitelist_com.android.car.dialer"];

    overrides = ["Dialer"];

    libs = ["android.car"];

    static_libs = [
        "androidx.recyclerview_recyclerview"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
        "androidx.legacy_legacy-support-v4"
        "androidx.cardview_cardview"
        "car-apps-common"
        "car-arch-common"
        "car-telephony-common"
        "car-theme-lib"
        "car-ui-lib"
        "androidx-constraintlayout_constraintlayout-solver"
        "guava"
        "glide-prebuilt"
        "libphonenumber"
        "androidx.sqlite_sqlite-framework"
        "androidx.sqlite_sqlite"
        "androidx.room_room-runtime"
    ];

    plugins = ["androidx.room_room-compiler-plugin"];

    optimize = {
        enabled = false;
    };

    privileged = true;

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

# ##################################################################################
#  Duplicate of CarDialerApp which includes testing only resources for Robolectric #
# ##################################################################################

CarDialerAppForTesting = android_app {
    name = "CarDialerAppForTesting";

    srcs = [
        "src/com/android/car/dialer/Constants.java"
        "src/com/android/car/dialer/DialerApplication.java"
        "src/com/android/car/dialer/livedata/AudioRouteLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothErrorStringLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothHfpStateLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothPairListLiveData.java"
        "src/com/android/car/dialer/livedata/BluetoothStateLiveData.java"
        "src/com/android/car/dialer/livedata/CallDetailLiveData.java"
        "src/com/android/car/dialer/livedata/CallHistoryLiveData.java"
        "src/com/android/car/dialer/livedata/CallStateLiveData.java"
        "src/com/android/car/dialer/livedata/HeartBeatLiveData.java"
        "src/com/android/car/dialer/livedata/HfpDeviceListLiveData.java"
        "src/com/android/car/dialer/livedata/SharedPreferencesLiveData.java"
        "src/com/android/car/dialer/livedata/UnreadMissedCallLiveData.java"
        "src/com/android/car/dialer/log/L.java"
        "src/com/android/car/dialer/notification/InCallNotificationController.java"
        "src/com/android/car/dialer/notification/MissedCallNotificationController.java"
        "src/com/android/car/dialer/notification/MissedCallReceiver.java"
        "src/com/android/car/dialer/notification/NotificationService.java"
        "src/com/android/car/dialer/notification/NotificationUtils.java"
        "src/com/android/car/dialer/storage/BluetoothBondedListReceiver.java"
        "src/com/android/car/dialer/storage/CipherConverter.java"
        "src/com/android/car/dialer/storage/CipherWrapper.java"
        "src/com/android/car/dialer/storage/FavoriteNumberDao.java"
        "src/com/android/car/dialer/storage/FavoriteNumberDatabase.java"
        "src/com/android/car/dialer/storage/FavoriteNumberEntity.java"
        "src/com/android/car/dialer/storage/FavoriteNumberRepository.java"
        "src/com/android/car/dialer/telecom/InCallRouter.java"
        "src/com/android/car/dialer/telecom/InCallServiceImpl.java"
        "src/com/android/car/dialer/telecom/ProjectionCallHandler.java"
        "src/com/android/car/dialer/telecom/UiBluetoothMonitor.java"
        "src/com/android/car/dialer/telecom/UiCallManager.java"
        "src/com/android/car/dialer/ui/NoHfpActivity.java"
        "src/com/android/car/dialer/ui/NoHfpActivityViewModel.java"
        "src/com/android/car/dialer/ui/TelecomActivity.java"
        "src/com/android/car/dialer/ui/TelecomActivityViewModel.java"
        "src/com/android/car/dialer/ui/TelecomPageTab.java"
        "src/com/android/car/dialer/ui/ToolbarTitleLiveData.java"
        "src/com/android/car/dialer/ui/activecall/ConferenceProfileAdapter.java"
        "src/com/android/car/dialer/ui/activecall/ConferenceProfileViewHolder.java"
        "src/com/android/car/dialer/ui/activecall/InCallActivity.java"
        "src/com/android/car/dialer/ui/activecall/InCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/InCallViewModel.java"
        "src/com/android/car/dialer/ui/activecall/IncomingCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/OnGoingCallControllerBarFragment.java"
        "src/com/android/car/dialer/ui/activecall/OnHoldCallUserProfileFragment.java"
        "src/com/android/car/dialer/ui/activecall/OngoingCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/OngoingConfCallFragment.java"
        "src/com/android/car/dialer/ui/activecall/RingingCallControllerBarFragment.java"
        "src/com/android/car/dialer/ui/calllog/CallHistoryFragment.java"
        "src/com/android/car/dialer/ui/calllog/CallHistoryViewModel.java"
        "src/com/android/car/dialer/ui/calllog/CallLogAdapter.java"
        "src/com/android/car/dialer/ui/calllog/CallLogViewHolder.java"
        "src/com/android/car/dialer/ui/common/ContactResultsLiveData.java"
        "src/com/android/car/dialer/ui/common/DialerBaseFragment.java"
        "src/com/android/car/dialer/ui/common/DialerListBaseFragment.java"
        "src/com/android/car/dialer/ui/common/DialerUtils.java"
        "src/com/android/car/dialer/ui/common/OnItemClickedListener.java"
        "src/com/android/car/dialer/ui/common/UiCallLogLiveData.java"
        "src/com/android/car/dialer/ui/common/entity/ActionButton.java"
        "src/com/android/car/dialer/ui/common/entity/ContactSortingInfo.java"
        "src/com/android/car/dialer/ui/common/entity/Header.java"
        "src/com/android/car/dialer/ui/common/entity/HeaderViewHolder.java"
        "src/com/android/car/dialer/ui/common/entity/UiCallLog.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsAdapter.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsFragment.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsViewHolder.java"
        "src/com/android/car/dialer/ui/contact/ContactDetailsViewModel.java"
        "src/com/android/car/dialer/ui/contact/ContactListAdapter.java"
        "src/com/android/car/dialer/ui/contact/ContactListFragment.java"
        "src/com/android/car/dialer/ui/contact/ContactListViewHolder.java"
        "src/com/android/car/dialer/ui/contact/ContactListViewModel.java"
        "src/com/android/car/dialer/ui/dialpad/AbstractDialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/DialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/InCallDialpadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/KeypadButton.java"
        "src/com/android/car/dialer/ui/dialpad/KeypadFragment.java"
        "src/com/android/car/dialer/ui/dialpad/TypeDownResultsAdapter.java"
        "src/com/android/car/dialer/ui/dialpad/TypeDownResultsViewModel.java"
        "src/com/android/car/dialer/ui/favorite/AddFavoriteFragment.java"
        "src/com/android/car/dialer/ui/favorite/BluetoothFavoriteContactsLiveData.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteAdapter.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteContactViewHolder.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteFragment.java"
        "src/com/android/car/dialer/ui/favorite/FavoriteViewModel.java"
        "src/com/android/car/dialer/ui/search/ContactResultViewHolder.java"
        "src/com/android/car/dialer/ui/search/ContactResultsAdapter.java"
        "src/com/android/car/dialer/ui/search/ContactResultsFragment.java"
        "src/com/android/car/dialer/ui/search/ContactResultsViewModel.java"
        "src/com/android/car/dialer/ui/settings/DialerSettingsActivity.java"
        "src/com/android/car/dialer/ui/settings/DialerSettingsFragment.java"
        "src/com/android/car/dialer/ui/view/CircleBitmapDrawable.java"
        "src/com/android/car/dialer/ui/view/ContactAvatarOutputlineProvider.java"
        "src/com/android/car/dialer/ui/view/ListItemOutlineProvider.java"
        "src/com/android/car/dialer/ui/view/ScaleSpan.java"
        "src/com/android/car/dialer/ui/view/VerticalListDividerDecoration.java"
        "src/com/android/car/dialer/ui/warning/NoHfpFragment.java"
        "src/com/android/car/dialer/widget/CallTypeIconsView.java"
        "src/com/android/car/dialer/widget/CheckableRelativeLayout.java"
        "src/com/android/car/dialer/widget/LoadingFrameLayout.java"
    ];

    resource_dirs = [
        "res"
        "tests/robotests/res"
    ];

    platform_apis = true;

    libs = ["android.car"];

    static_libs = [
        "androidx.recyclerview_recyclerview"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.preference_preference"
        "androidx-constraintlayout_constraintlayout"
        "androidx.legacy_legacy-support-v4"
        "androidx.cardview_cardview"
        "car-apps-common"
        "car-arch-common"
        "car-telephony-common"
        "car-theme-lib"
        "car-ui-lib"
        "androidx-constraintlayout_constraintlayout-solver"
        "guava"
        "glide-prebuilt"
        "libphonenumber"
        "androidx.sqlite_sqlite-framework"
        "androidx.sqlite_sqlite"
        "androidx.room_room-runtime"
    ];

    plugins = ["androidx.room_room-compiler-plugin"];

    optimize = {
        enabled = false;
    };

    privileged = true;

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

# ##################################################################################

in { inherit CarDialerApp CarDialerAppForTesting; }
