{ android_robolectric_test }:
let

/*
 * Copyright (C) 2020 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

QuickAccessWalletRoboTests = android_robolectric_test {
    name = "QuickAccessWalletRoboTests";
    srcs = [
        "src/com/android/systemui/plugin/globalactions/wallet/QuickAccessWalletClientTest.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletPanelViewControllerTest.java"
        "src/com/android/systemui/plugin/globalactions/wallet/WalletPluginServiceTest.java"
    ];
    java_resource_dirs = ["config"];
    instrumentation_for = "QuickAccessWallet";
    static_libs = [
        "SystemUIPluginLib"
        "android-support-annotations"
        "androidx.test.core"
        "androidx.test.runner"
        "androidx.test.ext.junit"
    ];
};

in { inherit QuickAccessWalletRoboTests; }
