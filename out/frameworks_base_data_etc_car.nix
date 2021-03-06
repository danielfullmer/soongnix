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

#  Privapp permission whitelist files

"privapp_whitelist_android.car.cluster.loggingrenderer" = prebuilt_etc {
    name = "privapp_whitelist_android.car.cluster.loggingrenderer";
    sub_dir = "permissions";
    src = "android.car.cluster.loggingrenderer.xml";
    filename_from_src = true;
};

"privapp_whitelist_android.car.cluster.sample" = prebuilt_etc {
    name = "privapp_whitelist_android.car.cluster.sample";
    sub_dir = "permissions";
    src = "android.car.cluster.sample.xml";
    filename_from_src = true;
};

"privapp_whitelist_android.car.cluster" = prebuilt_etc {
    name = "privapp_whitelist_android.car.cluster";
    sub_dir = "permissions";
    src = "android.car.cluster.xml";
    filename_from_src = true;
};

"privapp_whitelist_android.car.usb.handler" = prebuilt_etc {
    name = "privapp_whitelist_android.car.usb.handler";
    sub_dir = "permissions";
    src = "android.car.usb.handler.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.carlauncher" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.carlauncher";
    sub_dir = "permissions";
    src = "com.android.car.carlauncher.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.dialer" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.dialer";
    sub_dir = "permissions";
    src = "com.android.car.dialer.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.hvac" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.hvac";
    sub_dir = "permissions";
    src = "com.android.car.hvac.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.media" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.media";
    sub_dir = "permissions";
    src = "com.android.car.media.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.notification" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.notification";
    sub_dir = "permissions";
    src = "com.android.car.notification.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.radio" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.radio";
    sub_dir = "permissions";
    src = "com.android.car.radio.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.settings" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.settings";
    sub_dir = "permissions";
    src = "com.android.car.settings.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.themeplayground" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.themeplayground";
    sub_dir = "permissions";
    src = "com.android.car.themeplayground.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.trust" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.trust";
    sub_dir = "permissions";
    src = "com.android.car.trust.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car";
    sub_dir = "permissions";
    src = "com.android.car.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.google.android.car.kitchensink" = prebuilt_etc {
    name = "privapp_whitelist_com.google.android.car.kitchensink";
    sub_dir = "permissions";
    src = "com.google.android.car.kitchensink.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.car.developeroptions" = prebuilt_etc {
    name = "privapp_whitelist_com.android.car.developeroptions";
    sub_dir = "permissions";
    src = "com.android.car.developeroptions.xml";
    filename_from_src = true;
    product_specific = true;
};

in { inherit "privapp_whitelist_android.car.cluster" "privapp_whitelist_android.car.cluster.loggingrenderer" "privapp_whitelist_android.car.cluster.sample" "privapp_whitelist_android.car.usb.handler" "privapp_whitelist_com.android.car" "privapp_whitelist_com.android.car.carlauncher" "privapp_whitelist_com.android.car.developeroptions" "privapp_whitelist_com.android.car.dialer" "privapp_whitelist_com.android.car.hvac" "privapp_whitelist_com.android.car.media" "privapp_whitelist_com.android.car.notification" "privapp_whitelist_com.android.car.radio" "privapp_whitelist_com.android.car.settings" "privapp_whitelist_com.android.car.themeplayground" "privapp_whitelist_com.android.car.trust" "privapp_whitelist_com.google.android.car.kitchensink"; }
