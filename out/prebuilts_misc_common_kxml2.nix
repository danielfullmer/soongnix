{ java_import, java_import_host }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

"kxml2-2.3.0" = java_import_host {
    name = "kxml2-2.3.0";
    jars = ["kxml2-2.3.0.jar"];
    installable = true;
};

kxml2-android = java_import {
    name = "kxml2-android";
    jars = ["kxml2-2.3.0.jar"];
};

in { inherit "kxml2-2.3.0" kxml2-android; }
