{ prebuilt_etc }:
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

#  Module definition producing a tzdata prebuilt file in
#  /system/etc/tzdata_module/etc/tz for standalone ART testing purposes.
#  This is a temporary change needed until the ART Buildbot and Golem both fully
#  support the Time Zone Data APEX (see b/121117762). This module should never
#  be shipped by default (i.e. should never be part of `PRODUCT_PACKAGE`.)

#  TODO(b/121117762, b/129332183): Remove this module definition when
#  the ART Buildbot and Golem have full support for the Time Zone Data APEX.
icu_overlay-art-test-tzdata = prebuilt_etc {
    name = "icu_overlay-art-test-tzdata";
    src = "icu_tzdata.dat";
    filename_from_src = true;
    sub_dir = "tzdata_module/etc/icu";
};

in { inherit icu_overlay-art-test-tzdata; }
