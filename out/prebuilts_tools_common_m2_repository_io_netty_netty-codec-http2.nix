{ java_import_host }:
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

"netty-codec-http2-java-4.1.3.Final" = java_import_host {
    name = "netty-codec-http2-java-4.1.3.Final";
    jars = ["4.1.3.Final/netty-codec-http2-4.1.3.Final.jar"];
};

in { inherit "netty-codec-http2-java-4.1.3.Final"; }
