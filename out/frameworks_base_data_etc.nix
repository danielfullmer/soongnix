{ filegroup, prebuilt_etc }:
let

#  Copyright (C} 2018 The Android Open Source Project
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

#  Sysconfig files

"framework-sysconfig.xml" = prebuilt_etc {
    name = "framework-sysconfig.xml";
    sub_dir = "sysconfig";
    src = "framework-sysconfig.xml";
};

"preinstalled-packages-platform.xml" = prebuilt_etc {
    name = "preinstalled-packages-platform.xml";
    sub_dir = "sysconfig";
    src = "preinstalled-packages-platform.xml";
};

"preinstalled-packages-platform-overlays.xml" = prebuilt_etc {
    name = "preinstalled-packages-platform-overlays.xml";
    product_specific = true;
    sub_dir = "sysconfig";
    src = "preinstalled-packages-platform-overlays.xml";
};

"hiddenapi-package-whitelist.xml" = prebuilt_etc {
    name = "hiddenapi-package-whitelist.xml";
    sub_dir = "sysconfig";
    src = "hiddenapi-package-whitelist.xml";
};

#  Privapp permission whitelist files

"platform.xml" = prebuilt_etc {
    name = "platform.xml";
    sub_dir = "permissions";
    src = "platform.xml";
};

"privapp-permissions-platform.xml" = prebuilt_etc {
    name = "privapp-permissions-platform.xml";
    sub_dir = "permissions";
    src = "privapp-permissions-platform.xml";
};

"privapp_whitelist_com.android.carrierconfig" = prebuilt_etc {
    name = "privapp_whitelist_com.android.carrierconfig";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.carrierconfig.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.cellbroadcastreceiver" = prebuilt_etc {
    name = "privapp_whitelist_com.android.cellbroadcastreceiver";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.cellbroadcastreceiver.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.contacts" = prebuilt_etc {
    name = "privapp_whitelist_com.android.contacts";
    product_specific = true;
    sub_dir = "permissions";
    src = "com.android.contacts.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.dialer" = prebuilt_etc {
    name = "privapp_whitelist_com.android.dialer";
    product_specific = true;
    sub_dir = "permissions";
    src = "com.android.dialer.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.emergency" = prebuilt_etc {
    name = "privapp_whitelist_com.android.emergency";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.emergency.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.documentsui" = prebuilt_etc {
    name = "privapp_whitelist_com.android.documentsui";
    sub_dir = "permissions";
    src = "com.android.documentsui.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.launcher3" = prebuilt_etc {
    name = "privapp_whitelist_com.android.launcher3";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.launcher3.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.provision" = prebuilt_etc {
    name = "privapp_whitelist_com.android.provision";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.provision.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.settings" = prebuilt_etc {
    name = "privapp_whitelist_com.android.settings";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.settings.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.settings.intelligence" = prebuilt_etc {
    name = "privapp_whitelist_com.android.settings.intelligence";
    product_specific = true;
    sub_dir = "permissions";
    src = "com.android.settings.intelligence.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.storagemanager" = prebuilt_etc {
    name = "privapp_whitelist_com.android.storagemanager";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.storagemanager.xml";
    filename_from_src = true;
};

"privapp_whitelist_com.android.systemui" = prebuilt_etc {
    name = "privapp_whitelist_com.android.systemui";
    system_ext_specific = true;
    sub_dir = "permissions";
    src = "com.android.systemui.xml";
    filename_from_src = true;
};

"com.android.timezone.updater.xml" = prebuilt_etc {
    name = "com.android.timezone.updater.xml";
    sub_dir = "permissions";
    src = "com.android.timezone.updater.xml";
};

"services.core.protolog.json" = filegroup {
    name = "services.core.protolog.json";
    srcs = ["services.core.protolog.json"];
};

in { inherit "com.android.timezone.updater.xml" "framework-sysconfig.xml" "hiddenapi-package-whitelist.xml" "platform.xml" "preinstalled-packages-platform-overlays.xml" "preinstalled-packages-platform.xml" "privapp-permissions-platform.xml" "privapp_whitelist_com.android.carrierconfig" "privapp_whitelist_com.android.cellbroadcastreceiver" "privapp_whitelist_com.android.contacts" "privapp_whitelist_com.android.dialer" "privapp_whitelist_com.android.documentsui" "privapp_whitelist_com.android.emergency" "privapp_whitelist_com.android.launcher3" "privapp_whitelist_com.android.provision" "privapp_whitelist_com.android.settings" "privapp_whitelist_com.android.settings.intelligence" "privapp_whitelist_com.android.storagemanager" "privapp_whitelist_com.android.systemui" "services.core.protolog.json"; }
