{ android_app, genrule }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

InputDevices = android_app {
    name = "InputDevices";

    srcs = [
        "src/com/android/inputdevices/InputDeviceReceiver.java"
        ":validate_input_devices_keymaps"
    ];

    resource_dirs = ["res"];

    sdk_version = "current";
    certificate = "platform";
    privileged = true;
};

#  Validate all key maps.
#  Produces an empty srcjar that is used as an input to InputDevices to make sure
#  the check runs for platform builds.
validate_input_devices_keymaps = genrule {
    name = "validate_input_devices_keymaps";
    tools = [
        "validatekeymaps"
        "soong_zip"
    ];
    srcs = [
        "res/raw/keyboard_layout_arabic.kcm"
        "res/raw/keyboard_layout_azerbaijani.kcm"
        "res/raw/keyboard_layout_belgian.kcm"
        "res/raw/keyboard_layout_brazilian.kcm"
        "res/raw/keyboard_layout_bulgarian.kcm"
        "res/raw/keyboard_layout_croatian_and_slovenian.kcm"
        "res/raw/keyboard_layout_czech.kcm"
        "res/raw/keyboard_layout_danish.kcm"
        "res/raw/keyboard_layout_english_uk.kcm"
        "res/raw/keyboard_layout_english_us.kcm"
        "res/raw/keyboard_layout_english_us_colemak.kcm"
        "res/raw/keyboard_layout_english_us_dvorak.kcm"
        "res/raw/keyboard_layout_english_us_intl.kcm"
        "res/raw/keyboard_layout_english_us_workman.kcm"
        "res/raw/keyboard_layout_estonian.kcm"
        "res/raw/keyboard_layout_finnish.kcm"
        "res/raw/keyboard_layout_french.kcm"
        "res/raw/keyboard_layout_french_ca.kcm"
        "res/raw/keyboard_layout_german.kcm"
        "res/raw/keyboard_layout_greek.kcm"
        "res/raw/keyboard_layout_hebrew.kcm"
        "res/raw/keyboard_layout_hungarian.kcm"
        "res/raw/keyboard_layout_icelandic.kcm"
        "res/raw/keyboard_layout_italian.kcm"
        "res/raw/keyboard_layout_latvian_qwerty.kcm"
        "res/raw/keyboard_layout_lithuanian.kcm"
        "res/raw/keyboard_layout_norwegian.kcm"
        "res/raw/keyboard_layout_persian.kcm"
        "res/raw/keyboard_layout_polish.kcm"
        "res/raw/keyboard_layout_portuguese.kcm"
        "res/raw/keyboard_layout_russian.kcm"
        "res/raw/keyboard_layout_russian_mac.kcm"
        "res/raw/keyboard_layout_slovak.kcm"
        "res/raw/keyboard_layout_spanish.kcm"
        "res/raw/keyboard_layout_spanish_latin.kcm"
        "res/raw/keyboard_layout_swedish.kcm"
        "res/raw/keyboard_layout_swiss_french.kcm"
        "res/raw/keyboard_layout_swiss_german.kcm"
        "res/raw/keyboard_layout_turkish.kcm"
        "res/raw/keyboard_layout_ukrainian.kcm"
    ];
    out = ["validate_input_devices_keymaps.srcjar"];
    cmd = "$(location validatekeymaps) -q $(in) && $(location soong_zip) -o $(out)";
};

in { inherit InputDevices validate_input_devices_keymaps; }
