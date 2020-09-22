{ prebuilt_etc }:
let

#  Copyright (C} 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License"};
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

"preinstalled-packages-platform-aosp-product.xml" = prebuilt_etc {
    name = "preinstalled-packages-platform-aosp-product.xml";
    product_specific = true;
    sub_dir = "sysconfig";
    src = "preinstalled-packages-platform-aosp-product.xml";
};

"preinstalled-packages-platform-full-base.xml" = prebuilt_etc {
    name = "preinstalled-packages-platform-full-base.xml";
    sub_dir = "sysconfig";
    src = "preinstalled-packages-platform-full-base.xml";
};

"preinstalled-packages-platform-handheld-product.xml" = prebuilt_etc {
    name = "preinstalled-packages-platform-handheld-product.xml";
    product_specific = true;
    sub_dir = "sysconfig";
    src = "preinstalled-packages-platform-handheld-product.xml";
};

in { inherit "preinstalled-packages-platform-aosp-product.xml" "preinstalled-packages-platform-full-base.xml" "preinstalled-packages-platform-handheld-product.xml"; }
