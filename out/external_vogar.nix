{ java_import_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

#  Build dependencies.
#  ============================================================

vogar-jsr305 = java_import_host {
    name = "vogar-jsr305";
    jars = ["lib/jsr305.jar"];
};

vogar-kxml-libcore-20110123 = java_import_host {
    name = "vogar-kxml-libcore-20110123";
    jars = ["lib/kxml-libcore-20110123.jar"];
};

in { inherit vogar-jsr305 vogar-kxml-libcore-20110123; }