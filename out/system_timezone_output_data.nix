{ java_genrule, prebuilt_etc }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

apex_tz_version = prebuilt_etc {
    name = "apex_tz_version";
    src = "version/tz_version";
    filename = "tz_version";
    sub_dir = "tz";
    installable = false;
};

"apex_tzlookup.xml" = prebuilt_etc {
    name = "apex_tzlookup.xml";
    src = "android/tzlookup.xml";
    filename = "tzlookup.xml";
    sub_dir = "tz";
    installable = false;
};

"apex_telephonylookup.xml" = prebuilt_etc {
    name = "apex_telephonylookup.xml";
    src = "android/telephonylookup.xml";
    filename = "telephonylookup.xml";
    sub_dir = "tz";
    installable = false;
};

apex_tzdata = prebuilt_etc {
    name = "apex_tzdata";
    src = "iana/tzdata";
    notice = "iana/NOTICE";
    filename = "tzdata";
    sub_dir = "tz";
    installable = false;
};

"apex_icu_tzdata.dat" = prebuilt_etc {
    name = "apex_icu_tzdata.dat";
    src = "icu_overlay/icu_tzdata.dat";
    notice = "icu_overlay/LICENSE";
    filename = "icu_tzdata.dat";
    sub_dir = "icu";
    installable = false;
};

#  tzdata packaged into a jar for use in robolectric
robolectric_tzdata = java_genrule {
    name = "robolectric_tzdata";
    out = ["robolectric_tzdata.jar"];
    tools = ["soong_zip"];
    srcs = [
        "iana/tzdata"
        "android/tzlookup.xml"
        "android/telephonylookup.xml"
    ];
    cmd = "mkdir -p $(genDir)/usr/share/zoneinfo/ && " +
        "cp $(location iana/tzdata) $(genDir)/usr/share/zoneinfo/ && " +
        "cp $(location android/tzlookup.xml) $(genDir)/usr/share/zoneinfo/ && " +
        "cp $(location android/telephonylookup.xml) $(genDir)/usr/share/zoneinfo/ && " +
        "$(location soong_zip) -o $(out) -C $(genDir) -D $(genDir)/usr/share/zoneinfo";
};

in { inherit "apex_icu_tzdata.dat" "apex_telephonylookup.xml" "apex_tzlookup.xml" apex_tz_version apex_tzdata robolectric_tzdata; }
