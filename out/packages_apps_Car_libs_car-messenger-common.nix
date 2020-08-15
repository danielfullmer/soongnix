{ android_library }:
let

#
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
#

car-messenger-common = android_library {
    name = "car-messenger-common";

    srcs = [
        "src/com/android/car/messenger/common/BaseNotificationDelegate.java"
        "src/com/android/car/messenger/common/CompositeKey.java"
        "src/com/android/car/messenger/common/ConversationKey.java"
        "src/com/android/car/messenger/common/ConversationNotificationInfo.java"
        "src/com/android/car/messenger/common/Message.java"
        "src/com/android/car/messenger/common/MessageKey.java"
        "src/com/android/car/messenger/common/ProjectionStateListener.java"
        "src/com/android/car/messenger/common/SenderKey.java"
        "src/com/android/car/messenger/common/Utils.java"
    ];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    resource_dirs = ["res"];

    static_libs = [
        "android.car.userlib"
        "androidx.legacy_legacy-support-v4"
        "car-apps-common-bp"
        "car-messenger-protos"
        "connected-device-protos"
    ];
};

in { inherit car-messenger-common; }
