{ filegroup }:
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

cts-wm-components = filegroup {
    name = "cts-wm-components";
    srcs = [
        "alertwindowapp/src/android/server/wm/alertwindowapp/Components.java"
        "alertwindowappsdk25/src/android/server/wm/alertwindowappsdk25/Components.java"
        "alertwindowservice/src/android/server/wm/alertwindowservice/Components.java"
        "app/src/android/server/wm/app/Components.java"
        "app27/src/android/server/wm/app27/Components.java"
        "appDeprecatedSdk/src/android/server/wm/deprecatedsdk/Components.java"
        "appDisplaySize/src/android/server/wm/displaysize/Components.java"
        "appPrereleaseSdk/src/android/server/wm/prerelease/Components.java"
        "appProfileable/src/android/server/wm/debuggable/Components.java"
        "appSecondUid/src/android/server/wm/second/Components.java"
        "appThirdUid/src/android/server/wm/third/Components.java"
        "backgroundactivity/AppA/src/android/server/wm/backgroundactivity/appa/Components.java"
        "backgroundactivity/AppB/src/android/server/wm/backgroundactivity/appb/Components.java"
        "dndsourceapp/src/android/server/wm/dndsourceapp/Components.java"
        "dndtargetapp/src/android/server/wm/dndtargetapp/Components.java"
        "dndtargetappsdk23/src/android/server/wm/dndtargetappsdk23/Components.java"
        "translucentapp/src/android/server/wm/translucentapp/Components.java"
        "translucentappsdk26/src/android/server/wm/translucentapp26/Components.java"
    ];
};

in { inherit cts-wm-components; }
