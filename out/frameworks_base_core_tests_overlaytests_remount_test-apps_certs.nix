{ android_app_certificate }:
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

#  development/tools/make_key rro-remounted-test-a '/CN=rro_test_a'
rro-remounted-test-a = android_app_certificate {
    name = "rro-remounted-test-a";
    certificate = "rro-remounted-test-a";
};

in { inherit rro-remounted-test-a; }
