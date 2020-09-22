{ java_genrule_host }:
let

#
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
#

#
#  Define rules to build temp_layoutlib.jar, which contains a subset of
#  the classes in framework.jar.  The layoutlib_create tool is used to
#  transform the framework jar into the temp_layoutlib jar.
#

temp_layoutlib = java_genrule_host {
    name = "temp_layoutlib";
    tools = ["layoutlib_create"];
    out = ["temp_layoutlib.jar"];
    srcs = [
        ":atf-prebuilt{.jar}"
        ":core-icu4j{.jar}"
        ":core-libart{.jar}"
        ":framework-all{.jar}"
        ":ext{.jar}"
        ":icu4j-icudata-jarjar{.jar}" #  HOST
        ":icu4j-icutzdata-jarjar{.jar}" #  HOST
    ];
    cmd = "rm -f $(out) && $(location layoutlib_create) --create-stub $(out) $(in)";
};

in { inherit temp_layoutlib; }
