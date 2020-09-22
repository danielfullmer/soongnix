{ java_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

#  This project contains libraries that are used internally, mostly by
#  CarService and CarServiceHelperService.
#
#  They're not meant to be used by other system apps and hence are not
#  supported.

"android.car.internal.event-log-tags" = java_library {
    name = "android.car.internal.event-log-tags";
    srcs = [
        "src/com/android/internal/car/EventLogTags.logtags"
    ];
};

in { inherit "android.car.internal.event-log-tags"; }