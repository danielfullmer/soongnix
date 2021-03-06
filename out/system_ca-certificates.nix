{ ca_certificates, ca_certificates_host }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

cacerts = ca_certificates {
    name = "cacerts";
    src_dir = "files";
    dest_dir = "security/cacerts";
    module_name_prefix = "target-cacert-";
};

cacerts-host = ca_certificates_host {
    name = "cacerts-host";
    src_dir = "files";
    dest_dir = "security/cacerts";
    module_name_prefix = "host-cacert-";
};

in { inherit cacerts cacerts-host; }
