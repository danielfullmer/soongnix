{ prebuilt_font }:
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

"Rubik-Regular.ttf" = prebuilt_font {
    name = "Rubik-Regular.ttf";
    src = "Rubik-Regular.ttf";
    product_specific = true;
};

"Rubik-Italic.ttf" = prebuilt_font {
    name = "Rubik-Italic.ttf";
    src = "Rubik-Italic.ttf";
    product_specific = true;
};

"Rubik-Medium.ttf" = prebuilt_font {
    name = "Rubik-Medium.ttf";
    src = "Rubik-Medium.ttf";
    product_specific = true;
};

"Rubik-MediumItalic.ttf" = prebuilt_font {
    name = "Rubik-MediumItalic.ttf";
    src = "Rubik-MediumItalic.ttf";
    product_specific = true;
};

"Rubik-Bold.ttf" = prebuilt_font {
    name = "Rubik-Bold.ttf";
    src = "Rubik-Bold.ttf";
    product_specific = true;
};

"Rubik-BoldItalic.ttf" = prebuilt_font {
    name = "Rubik-BoldItalic.ttf";
    src = "Rubik-BoldItalic.ttf";
    product_specific = true;
};

in { inherit "Rubik-Bold.ttf" "Rubik-BoldItalic.ttf" "Rubik-Italic.ttf" "Rubik-Medium.ttf" "Rubik-MediumItalic.ttf" "Rubik-Regular.ttf"; }
