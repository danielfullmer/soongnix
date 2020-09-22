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

"ZillaSlab-Medium.ttf" = prebuilt_font {
    name = "ZillaSlab-Medium.ttf";
    src = "ZillaSlab-Medium.ttf";
    product_specific = true;
};

"ZillaSlab-MediumItalic.ttf" = prebuilt_font {
    name = "ZillaSlab-MediumItalic.ttf";
    src = "ZillaSlab-MediumItalic.ttf";
    product_specific = true;
};

"ZillaSlab-SemiBold.ttf" = prebuilt_font {
    name = "ZillaSlab-SemiBold.ttf";
    src = "ZillaSlab-SemiBold.ttf";
    product_specific = true;
};

"ZillaSlab-SemiBoldItalic.ttf" = prebuilt_font {
    name = "ZillaSlab-SemiBoldItalic.ttf";
    src = "ZillaSlab-SemiBoldItalic.ttf";
    product_specific = true;
};

in { inherit "ZillaSlab-Medium.ttf" "ZillaSlab-MediumItalic.ttf" "ZillaSlab-SemiBold.ttf" "ZillaSlab-SemiBoldItalic.ttf"; }
