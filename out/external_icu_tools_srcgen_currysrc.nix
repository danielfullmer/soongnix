{ java_import_host, java_library_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

#  Host prebuilt dependencies.
#  ============================================================

"currysrc_org.eclipse" = java_import_host {
    name = "currysrc_org.eclipse";
    jars = [
        "libs/org.eclipse.core.contenttype_3.7.0.v20180426-1644.jar"
        "libs/org.eclipse.core.jobs_3.10.0.v20180427-1454.jar"
        "libs/org.eclipse.core.resources_3.13.0.v20180512-1138.jar"
        "libs/org.eclipse.core.runtime_3.14.0.v20180417-0825.jar"
        "libs/org.eclipse.equinox.common_3.10.0.v20180412-1130.jar"
        "libs/org.eclipse.equinox.preferences_3.7.100.v20180510-1129.jar"
        "libs/org.eclipse.jdt.core_3.14.0.v20180528-0519.jar"
        "libs/org.eclipse.osgi_3.13.0.v20180409-1500.jar"
        "libs/org.eclipse.text_3.6.300.v20180430-1330.jar"
    ];
    #  Remove signature files found in META-INF/ that cause the combined jar to be rejected.
    #  http://b/111389216
    exclude_files = [
        "META-INF/ECLIPSE_.SF"
        "META-INF/ECLIPSE_.RSA"
    ];
};

#  build currysrc jar
#  ============================================================

currysrc = java_library_host {
    name = "currysrc";
    static_libs = [
        "currysrc_org.eclipse"
        "guavalib"
        "gson-prebuilt-jar"
        "jopt-simple-4.9"
    ];
    srcs = ["src/**/*.java"];
};

in { inherit "currysrc_org.eclipse" currysrc; }
