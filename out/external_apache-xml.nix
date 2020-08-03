{ filegroup, java_library }:
let

#
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
#

#  The set of files that contribute to APIs.
#  Generally, apache-xml source files are not marked with @hide so we add them
#  one-by-one after having done so.
apache-xml_api_files = filegroup {
    name = "apache-xml_api_files";
    srcs = [];
};

apache-xml = java_library {
    name = "apache-xml";
    srcs = ["src/main/java/**/*.java"];
    java_resource_dirs = ["src/main/java"];

    installable = true;
    hostdex = true;
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };

    no_standard_libs = true;
    libs = ["core-all"];
    system_modules = "core-all-system-modules";
};

#  A guaranteed unstripped version of apache-xml for use on device.
#  The build system may or may not strip the apache-xml jar, but this one will
#  not be stripped. See b/24535627.
apache-xml-testdex = java_library {
    name = "apache-xml-testdex";
    static_libs = ["apache-xml"];

    installable = true;
    dex_preopt = {
        enabled = false;
    };

    no_framework_libs = true;
};

in { inherit apache-xml apache-xml-testdex apache-xml_api_files; }
