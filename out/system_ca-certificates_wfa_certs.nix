{ ca_certificates, ca_certificates_host }:
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

#  This target is reference by frameworks/opt/net/wifi/service/Android.mk and used by WfaKeyStore
cacerts_wfa = ca_certificates {
    name = "cacerts_wfa";
    src_dir = "files";
    dest_dir = "security/cacerts_wfa";
    module_name_prefix = "target-cacert-wifi-";
};

cacerts_wfa-host = ca_certificates_host {
    name = "cacerts_wfa-host";
    src_dir = "files";
    dest_dir = "security/cacerts_wfa";
    module_name_prefix = "host-cacert-wifi-";
};

in { inherit cacerts_wfa cacerts_wfa-host; }
