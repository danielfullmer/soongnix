{ prebuilt_apex }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  TODO: consider removing _prebuilt suffix from module names and make use of
#  'prefer: true'

"com.android.apex.cts.shim.v1_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v1_prebuilt";
    src = "com.android.apex.cts.shim.v1.apex";
    filename = "com.android.apex.cts.shim.apex";
    prefer = true;
    installable = true;
};

"com.android.apex.cts.shim.v2_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_prebuilt";
    src = "com.android.apex.cts.shim.v2.apex";
    filename = "com.android.apex.cts.shim.v2.apex";
    installable = false;
};

"com.android.apex.cts.shim.v2_wrong_sha_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_wrong_sha_prebuilt";
    src = "com.android.apex.cts.shim.v2_wrong_sha.apex";
    filename = "com.android.apex.cts.shim.v2_wrong_sha.apex";
    installable = false;
};

"com.android.apex.cts.shim.v2_additional_file_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_additional_file_prebuilt";
    src = "com.android.apex.cts.shim.v2_additional_file.apex";
    filename = "com.android.apex.cts.shim.v2_additional_file.apex";
    installable = false;
};

"com.android.apex.cts.shim.v2_additional_folder_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_additional_folder_prebuilt";
    src = "com.android.apex.cts.shim.v2_additional_folder.apex";
    filename = "com.android.apex.cts.shim.v2_additional_folder.apex";
    installable = false;
};

"com.android.apex.cts.shim.v2_with_pre_install_hook_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_with_pre_install_hook_prebuilt";
    src = "com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
    filename = "com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
    installable = false;
};

"com.android.apex.cts.shim.v2_with_post_install_hook_prebuilt" = prebuilt_apex {
    name = "com.android.apex.cts.shim.v2_with_post_install_hook_prebuilt";
    src = "com.android.apex.cts.shim.v2_with_post_install_hook.apex";
    filename = "com.android.apex.cts.shim.v2_with_post_install_hook.apex";
    installable = false;
};

in { inherit "com.android.apex.cts.shim.v1_prebuilt" "com.android.apex.cts.shim.v2_additional_file_prebuilt" "com.android.apex.cts.shim.v2_additional_folder_prebuilt" "com.android.apex.cts.shim.v2_prebuilt" "com.android.apex.cts.shim.v2_with_post_install_hook_prebuilt" "com.android.apex.cts.shim.v2_with_pre_install_hook_prebuilt" "com.android.apex.cts.shim.v2_wrong_sha_prebuilt"; }
