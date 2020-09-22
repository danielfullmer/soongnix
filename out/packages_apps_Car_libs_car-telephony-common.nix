{ android_library }:
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
#

car-telephony-common = android_library {
    name = "car-telephony-common";

    srcs = [
        "src/com/android/car/telephony/common/AsyncQueryLiveData.java"
        "src/com/android/car/telephony/common/CallDetail.java"
        "src/com/android/car/telephony/common/Contact.java"
        "src/com/android/car/telephony/common/I18nPhoneNumberWrapper.java"
        "src/com/android/car/telephony/common/InMemoryPhoneBook.java"
        "src/com/android/car/telephony/common/ObservableAsyncQuery.java"
        "src/com/android/car/telephony/common/PhoneCallLog.java"
        "src/com/android/car/telephony/common/PhoneNumber.java"
        "src/com/android/car/telephony/common/PostalAddress.java"
        "src/com/android/car/telephony/common/QueryParam.java"
        "src/com/android/car/telephony/common/TelecomUtils.java"
        "src/com/android/car/telephony/common/WorkerExecutor.java"
    ];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "car-apps-common"
        "glide-prebuilt"
        "libphonenumber"
    ];

    libs = ["android.car"];

};

in { inherit car-telephony-common; }
