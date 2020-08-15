{ android_library }:
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

car-ui-lib-bp = android_library {

    name = "car-ui-lib-bp";

    srcs = [
        "src/com/android/car/ui/AlertDialogBuilder.java"
        "src/com/android/car/ui/baselayout/Insets.java"
        "src/com/android/car/ui/baselayout/InsetsChangedListener.java"
        "src/com/android/car/ui/core/BaseLayoutController.java"
        "src/com/android/car/ui/core/CarUi.java"
        "src/com/android/car/ui/core/CarUiInstaller.java"
        "src/com/android/car/ui/preference/CarUiDialogFragment.java"
        "src/com/android/car/ui/preference/CarUiDropDownPreference.java"
        "src/com/android/car/ui/preference/CarUiEditTextPreference.java"
        "src/com/android/car/ui/preference/CarUiListPreference.java"
        "src/com/android/car/ui/preference/CarUiMultiSelectListPreference.java"
        "src/com/android/car/ui/preference/CarUiPreference.java"
        "src/com/android/car/ui/preference/EditTextPreferenceDialogFragment.java"
        "src/com/android/car/ui/preference/ListPreferenceFragment.java"
        "src/com/android/car/ui/preference/MultiSelectListPreferenceFragment.java"
        "src/com/android/car/ui/preference/PreferenceDialogFragment.java"
        "src/com/android/car/ui/preference/PreferenceFragment.java"
        "src/com/android/car/ui/recyclerview/CarUiCheckBoxListItem.java"
        "src/com/android/car/ui/recyclerview/CarUiContentListItem.java"
        "src/com/android/car/ui/recyclerview/CarUiHeaderListItem.java"
        "src/com/android/car/ui/recyclerview/CarUiListItem.java"
        "src/com/android/car/ui/recyclerview/CarUiListItemAdapter.java"
        "src/com/android/car/ui/recyclerview/CarUiRadioButtonListItem.java"
        "src/com/android/car/ui/recyclerview/CarUiRadioButtonListItemAdapter.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerView.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerViewAdapter.java"
        "src/com/android/car/ui/recyclerview/CarUiSmoothScroller.java"
        "src/com/android/car/ui/recyclerview/CarUiSnapHelper.java"
        "src/com/android/car/ui/recyclerview/DefaultScrollBar.java"
        "src/com/android/car/ui/recyclerview/ScrollBar.java"
        "src/com/android/car/ui/recyclerview/decorations/grid/GridDividerItemDecoration.java"
        "src/com/android/car/ui/recyclerview/decorations/grid/GridOffsetItemDecoration.java"
        "src/com/android/car/ui/recyclerview/decorations/linear/LinearDividerItemDecoration.java"
        "src/com/android/car/ui/recyclerview/decorations/linear/LinearOffsetItemDecoration.java"
        "src/com/android/car/ui/toolbar/MenuItem.java"
        "src/com/android/car/ui/toolbar/MenuItemRenderer.java"
        "src/com/android/car/ui/toolbar/SearchView.java"
        "src/com/android/car/ui/toolbar/TabLayout.java"
        "src/com/android/car/ui/toolbar/Toolbar.java"
        "src/com/android/car/ui/toolbar/ToolbarController.java"
        "src/com/android/car/ui/toolbar/ToolbarControllerImpl.java"
        "src/com/android/car/ui/utils/CarUiUtils.java"
        "src/com/android/car/ui/utils/CarUxRestrictionsUtil.java"
        "src/com/android/car/ui/uxr/DrawableStateButton.java"
        "src/com/android/car/ui/uxr/DrawableStateSwitch.java"
        "src/com/android/car/ui/uxr/DrawableStateView.java"
    ];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.appcompat_appcompat"
        "androidx.asynclayoutinflater_asynclayoutinflater"
        "androidx-constraintlayout_constraintlayout"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx-constraintlayout_constraintlayout-solver"
    ];
};

in { inherit car-ui-lib-bp; }
