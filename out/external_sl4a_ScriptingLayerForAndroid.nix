{ android_test_helper_app, java_import }:
let

#
#   Copyright (C) 2016 Google, Inc.
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at:
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#

sl4a = android_test_helper_app {
    name = "sl4a";

    test_suites = [
        "pts"
        "device-tests"
    ];

    platform_apis = true;
    owner = "google";
    dex_preopt = {
        enabled = false;
    };

    certificate = "platform";

    srcs = [
        "src/com/googlecode/android_scripting/ActivityFlinger.java"
        "src/com/googlecode/android_scripting/ScriptListAdapter.java"
        "src/com/googlecode/android_scripting/Sl4aApplication.java"
        "src/com/googlecode/android_scripting/activity/ApiBrowser.java"
        "src/com/googlecode/android_scripting/activity/ApiPrompt.java"
        "src/com/googlecode/android_scripting/activity/BluetoothDeviceList.java"
        "src/com/googlecode/android_scripting/activity/CustomizeWindow.java"
        "src/com/googlecode/android_scripting/activity/InterpreterManager.java"
        "src/com/googlecode/android_scripting/activity/InterpreterPicker.java"
        "src/com/googlecode/android_scripting/activity/LogcatViewer.java"
        "src/com/googlecode/android_scripting/activity/Preferences.java"
        "src/com/googlecode/android_scripting/activity/ScriptEditor.java"
        "src/com/googlecode/android_scripting/activity/ScriptManager.java"
        "src/com/googlecode/android_scripting/activity/ScriptPicker.java"
        "src/com/googlecode/android_scripting/activity/ScriptProcessMonitor.java"
        "src/com/googlecode/android_scripting/activity/ScriptingLayerServiceLauncher.java"
        "src/com/googlecode/android_scripting/activity/ScriptsLiveFolder.java"
        "src/com/googlecode/android_scripting/activity/ServiceUtils.java"
        "src/com/googlecode/android_scripting/activity/TriggerManager.java"
        "src/com/googlecode/android_scripting/dialog/DurationPickerDialog.java"
        "src/com/googlecode/android_scripting/locale/LocaleReceiver.java"
        "src/com/googlecode/android_scripting/provider/ApiProvider.java"
        "src/com/googlecode/android_scripting/provider/ScriptProvider.java"
        "src/com/googlecode/android_scripting/provider/TelephonyTestProvider.java"
        "src/com/googlecode/android_scripting/service/FacadeService.java"
        "src/com/googlecode/android_scripting/service/MessageHandler.java"
        "src/com/googlecode/android_scripting/service/ScriptingLayerService.java"
        "src/com/googlecode/android_scripting/service/TriggerService.java"
        "src/com/googlecode/android_scripting/widget/DurationPicker.java"
        "src/com/googlecode/android_scripting/widget/NumberPicker.java"
        "src/com/googlecode/android_scripting/widget/NumberPickerButton.java"
        "src/de/mud/terminal/Precomposer.java"
        "src/de/mud/terminal/VDUBuffer.java"
        "src/de/mud/terminal/VDUDisplay.java"
        "src/de/mud/terminal/VDUInput.java"
        "src/de/mud/terminal/vt320.java"
        "src/org/apache/harmony/niochar/charset/additional/IBM437.java"
        "src/org/connectbot/ConsoleActivity.java"
        "src/org/connectbot/HelpActivity.java"
        "src/org/connectbot/HelpTopicActivity.java"
        "src/org/connectbot/TerminalView.java"
        "src/org/connectbot/service/FontSizeChangedListener.java"
        "src/org/connectbot/service/PromptHelper.java"
        "src/org/connectbot/service/Relay.java"
        "src/org/connectbot/service/TerminalBridge.java"
        "src/org/connectbot/service/TerminalKeyListener.java"
        "src/org/connectbot/service/TerminalManager.java"
        "src/org/connectbot/transport/AbsTransport.java"
        "src/org/connectbot/transport/ProcessTransport.java"
        "src/org/connectbot/util/Colors.java"
        "src/org/connectbot/util/ColorsActivity.java"
        "src/org/connectbot/util/EastAsianWidth.java"
        "src/org/connectbot/util/EncodingPreference.java"
        "src/org/connectbot/util/HelpTopicView.java"
        "src/org/connectbot/util/PreferenceConstants.java"
        "src/org/connectbot/util/SelectionArea.java"
        "src/org/connectbot/util/UberColorPickerDialog.java"
        "src/org/connectbot/util/VolumePreference.java"
    ];
    resource_dirs = ["res"];

    aaptflags = ["--auto-add-overlay"];

    compile_multilib = "both";

    static_libs = [
        "guava"
        "android-common"
        "sl4a.locale_platform"
        "androidx.legacy_legacy-support-v4"

        "sl4a.Utils"
        "sl4a.Common"

        "sl4a.InterpreterForAndroid"
        "sl4a.ScriptingLayer"
    ];

    privileged = true;
    optimize = {
        enabled = false;
    };

    jni_libs = ["libcom_googlecode_android_scripting_Exec"];
};

"sl4a.locale_platform" = java_import {
    name = "sl4a.locale_platform";
    jars = ["libs/locale_platform.jar"];
};

in { inherit "sl4a.locale_platform" sl4a; }
