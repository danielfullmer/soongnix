{ android_test_helper_app, java_library }:
let

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

Overlay0 = android_test_helper_app {
    name = "Overlay0";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay0"
    ];
};

Overlay1 = android_test_helper_app {
    name = "Overlay1";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay1"
    ];
};

Overlay2 = android_test_helper_app {
    name = "Overlay2";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay2"
    ];
};

Overlay3 = android_test_helper_app {
    name = "Overlay3";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay3"
    ];
};

Overlay4 = android_test_helper_app {
    name = "Overlay4";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay4"
    ];
};

Overlay5 = android_test_helper_app {
    name = "Overlay5";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay5"
    ];
};

Overlay6 = android_test_helper_app {
    name = "Overlay6";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay6"
    ];
};

Overlay7 = android_test_helper_app {
    name = "Overlay7";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay7"
    ];
};

Overlay8 = android_test_helper_app {
    name = "Overlay8";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay8"
    ];
};

Overlay9 = android_test_helper_app {
    name = "Overlay9";
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay9"
    ];
};

LargeOverlay0 = android_test_helper_app {
    name = "LargeOverlay0";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large0"
    ];
};

LargeOverlay1 = android_test_helper_app {
    name = "LargeOverlay1";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large1"
    ];
};

LargeOverlay2 = android_test_helper_app {
    name = "LargeOverlay2";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large2"
    ];
};

LargeOverlay3 = android_test_helper_app {
    name = "LargeOverlay3";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large3"
    ];
};

LargeOverlay4 = android_test_helper_app {
    name = "LargeOverlay4";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large4"
    ];
};

LargeOverlay5 = android_test_helper_app {
    name = "LargeOverlay5";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large5"
    ];
};

LargeOverlay6 = android_test_helper_app {
    name = "LargeOverlay6";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large6"
    ];
};

LargeOverlay7 = android_test_helper_app {
    name = "LargeOverlay7";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large7"
    ];
};

LargeOverlay8 = android_test_helper_app {
    name = "LargeOverlay8";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large8"
    ];
};

LargeOverlay9 = android_test_helper_app {
    name = "LargeOverlay9";
    resource_dirs = ["res_large"];
    aaptflags = [
        "--rename-manifest-package com.android.perftests.overlay.large9"
    ];
};

apct-perftests-overlay-apps = java_library {
    name = "apct-perftests-overlay-apps";
    java_resources = [
        ":Overlay0"
        ":Overlay1"
        ":Overlay2"
        ":Overlay3"
        ":Overlay4"
        ":Overlay5"
        ":Overlay6"
        ":Overlay7"
        ":Overlay8"
        ":Overlay9"
        ":LargeOverlay0"
        ":LargeOverlay1"
        ":LargeOverlay2"
        ":LargeOverlay3"
        ":LargeOverlay4"
        ":LargeOverlay5"
        ":LargeOverlay6"
        ":LargeOverlay7"
        ":LargeOverlay8"
        ":LargeOverlay9"
    ];
};

in { inherit LargeOverlay0 LargeOverlay1 LargeOverlay2 LargeOverlay3 LargeOverlay4 LargeOverlay5 LargeOverlay6 LargeOverlay7 LargeOverlay8 LargeOverlay9 Overlay0 Overlay1 Overlay2 Overlay3 Overlay4 Overlay5 Overlay6 Overlay7 Overlay8 Overlay9 apct-perftests-overlay-apps; }
