{ android_app }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

QuickAccessWallet = android_app {
    name = "QuickAccessWallet";
    srcs = [
        "src/com/android/systemui/plugin/globalactions/wallet/WalletCardCarousel.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletCardView.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletCardViewInfo.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletPanelViewController.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletPluginService.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletPopupMenu.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletView.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    system_ext_specific = true;
    certificate = "platform";
    privileged = true;
    manifest = "AndroidManifest_App.xml";
    static_libs = [
        "SystemUIPluginLib"
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
    ];
    optimize = {
        proguard_flags_files = [
            "proguard.flags"
        ];
    };
};

in { inherit QuickAccessWallet; }
