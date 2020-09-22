{ filegroup, prebuilt_font }:
let

#
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

recovery_roboto-fonts_dep = filegroup {
    name = "recovery_roboto-fonts_dep";
    export_to_make_var = "recovery_roboto-fonts_dep";
    srcs = [

        "Roboto-Black.ttf"
        "Roboto-BlackItalic.ttf"
        "Roboto-Bold.ttf"
        "Roboto-BoldItalic.ttf"
        "Roboto-Italic.ttf"
        "Roboto-Light.ttf"
        "Roboto-LightItalic.ttf"
        "Roboto-Medium.ttf"
        "Roboto-MediumItalic.ttf"
        "Roboto-Regular.ttf"
        "Roboto-Thin.ttf"
        "Roboto-ThinItalic.ttf"
        "RobotoCondensed-Bold.ttf"
        "RobotoCondensed-BoldItalic.ttf"
        "RobotoCondensed-Italic.ttf"
        "RobotoCondensed-Light.ttf"
        "RobotoCondensed-LightItalic.ttf"
        "RobotoCondensed-Medium.ttf"
        "RobotoCondensed-MediumItalic.ttf"
        "RobotoCondensed-Regular.ttf"
    ];
};

"Roboto-Regular.ttf" = prebuilt_font {
    name = "Roboto-Regular.ttf";
    src = "Roboto-Regular.ttf";
};

"Roboto-Bold.ttf" = prebuilt_font {
    name = "Roboto-Bold.ttf";
    src = "Roboto-Bold.ttf";
};

"Roboto-Italic.ttf" = prebuilt_font {
    name = "Roboto-Italic.ttf";
    src = "Roboto-Italic.ttf";
};

"Roboto-BoldItalic.ttf" = prebuilt_font {
    name = "Roboto-BoldItalic.ttf";
    src = "Roboto-BoldItalic.ttf";
};

"Roboto-Black.ttf" = prebuilt_font {
    name = "Roboto-Black.ttf";
    src = "Roboto-Black.ttf";
};

"Roboto-BlackItalic.ttf" = prebuilt_font {
    name = "Roboto-BlackItalic.ttf";
    src = "Roboto-BlackItalic.ttf";
};

"Roboto-Light.ttf" = prebuilt_font {
    name = "Roboto-Light.ttf";
    src = "Roboto-Light.ttf";
};

"Roboto-LightItalic.ttf" = prebuilt_font {
    name = "Roboto-LightItalic.ttf";
    src = "Roboto-LightItalic.ttf";
};

"Roboto-Medium.ttf" = prebuilt_font {
    name = "Roboto-Medium.ttf";
    src = "Roboto-Medium.ttf";
};

"Roboto-MediumItalic.ttf" = prebuilt_font {
    name = "Roboto-MediumItalic.ttf";
    src = "Roboto-MediumItalic.ttf";
};

"Roboto-Thin.ttf" = prebuilt_font {
    name = "Roboto-Thin.ttf";
    src = "Roboto-Thin.ttf";
};

"Roboto-ThinItalic.ttf" = prebuilt_font {
    name = "Roboto-ThinItalic.ttf";
    src = "Roboto-ThinItalic.ttf";
};

"RobotoCondensed-Regular.ttf" = prebuilt_font {
    name = "RobotoCondensed-Regular.ttf";
    src = "RobotoCondensed-Regular.ttf";
};

"RobotoCondensed-Bold.ttf" = prebuilt_font {
    name = "RobotoCondensed-Bold.ttf";
    src = "RobotoCondensed-Bold.ttf";
};

"RobotoCondensed-Italic.ttf" = prebuilt_font {
    name = "RobotoCondensed-Italic.ttf";
    src = "RobotoCondensed-Italic.ttf";
};

"RobotoCondensed-BoldItalic.ttf" = prebuilt_font {
    name = "RobotoCondensed-BoldItalic.ttf";
    src = "RobotoCondensed-BoldItalic.ttf";
};

"RobotoCondensed-Light.ttf" = prebuilt_font {
    name = "RobotoCondensed-Light.ttf";
    src = "RobotoCondensed-Light.ttf";
};

"RobotoCondensed-LightItalic.ttf" = prebuilt_font {
    name = "RobotoCondensed-LightItalic.ttf";
    src = "RobotoCondensed-LightItalic.ttf";
};

"RobotoCondensed-Medium.ttf" = prebuilt_font {
    name = "RobotoCondensed-Medium.ttf";
    src = "RobotoCondensed-Medium.ttf";
};

"RobotoCondensed-MediumItalic.ttf" = prebuilt_font {
    name = "RobotoCondensed-MediumItalic.ttf";
    src = "RobotoCondensed-MediumItalic.ttf";
};

in { inherit "Roboto-Black.ttf" "Roboto-BlackItalic.ttf" "Roboto-Bold.ttf" "Roboto-BoldItalic.ttf" "Roboto-Italic.ttf" "Roboto-Light.ttf" "Roboto-LightItalic.ttf" "Roboto-Medium.ttf" "Roboto-MediumItalic.ttf" "Roboto-Regular.ttf" "Roboto-Thin.ttf" "Roboto-ThinItalic.ttf" "RobotoCondensed-Bold.ttf" "RobotoCondensed-BoldItalic.ttf" "RobotoCondensed-Italic.ttf" "RobotoCondensed-Light.ttf" "RobotoCondensed-LightItalic.ttf" "RobotoCondensed-Medium.ttf" "RobotoCondensed-MediumItalic.ttf" "RobotoCondensed-Regular.ttf" recovery_roboto-fonts_dep; }
