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

"Lato-Regular.ttf" = prebuilt_font {
    name = "Lato-Regular.ttf";
    src = "Lato-Regular.ttf";
    product_specific = true;
};

"Lato-Italic.ttf" = prebuilt_font {
    name = "Lato-Italic.ttf";
    src = "Lato-Italic.ttf";
    product_specific = true;
};

"Lato-Medium.ttf" = prebuilt_font {
    name = "Lato-Medium.ttf";
    src = "Lato-Medium.ttf";
    product_specific = true;
};

"Lato-MediumItalic.ttf" = prebuilt_font {
    name = "Lato-MediumItalic.ttf";
    src = "Lato-MediumItalic.ttf";
    product_specific = true;
};

"Lato-Bold.ttf" = prebuilt_font {
    name = "Lato-Bold.ttf";
    src = "Lato-Bold.ttf";
    product_specific = true;
};

"Lato-BoldItalic.ttf" = prebuilt_font {
    name = "Lato-BoldItalic.ttf";
    src = "Lato-BoldItalic.ttf";
    product_specific = true;
};

in { inherit "Lato-Bold.ttf" "Lato-BoldItalic.ttf" "Lato-Italic.ttf" "Lato-Medium.ttf" "Lato-MediumItalic.ttf" "Lato-Regular.ttf"; }
