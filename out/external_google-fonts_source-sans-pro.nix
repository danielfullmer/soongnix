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

"SourceSansPro-Regular.ttf" = prebuilt_font {
    name = "SourceSansPro-Regular.ttf";
    src = "SourceSansPro-Regular.ttf";
};

"SourceSansPro-Italic.ttf" = prebuilt_font {
    name = "SourceSansPro-Italic.ttf";
    src = "SourceSansPro-Italic.ttf";
};

"SourceSansPro-SemiBold.ttf" = prebuilt_font {
    name = "SourceSansPro-SemiBold.ttf";
    src = "SourceSansPro-SemiBold.ttf";
};

"SourceSansPro-SemiBoldItalic.ttf" = prebuilt_font {
    name = "SourceSansPro-SemiBoldItalic.ttf";
    src = "SourceSansPro-SemiBoldItalic.ttf";
};

"SourceSansPro-Bold.ttf" = prebuilt_font {
    name = "SourceSansPro-Bold.ttf";
    src = "SourceSansPro-Bold.ttf";
};

"SourceSansPro-BoldItalic.ttf" = prebuilt_font {
    name = "SourceSansPro-BoldItalic.ttf";
    src = "SourceSansPro-BoldItalic.ttf";
};

in { inherit "SourceSansPro-Bold.ttf" "SourceSansPro-BoldItalic.ttf" "SourceSansPro-Italic.ttf" "SourceSansPro-Regular.ttf" "SourceSansPro-SemiBold.ttf" "SourceSansPro-SemiBoldItalic.ttf"; }
