{ cc_test, java_test_host }:
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

cintltst = cc_test {
    name = "cintltst";
    defaults = ["icu_test_defaults"];
    multilib = {
        lib64 = {
            suffix = "64";
        };
        lib32 = {
            suffix = "32";
        };
    };
    srcs = [
        "bocu1tst.c"
        "callcoll.c"
        "calltest.c"
        "capitst.c"
        "cbiapts.c"
        "cbididat.c"
        "cbiditransformtst.c"
        "cbiditst.c"
        "cbkittst.c"
        "ccaltst.c"
        "ccapitst.c"
        "ccolltst.c"
        "cconvtst.c"
        "cctest.c"
        "ccurrtst.c"
        "cdateintervalformattest.c"
        "cdattst.c"
        "cdetst.c"
        "cdtdptst.c"
        "cdtrgtst.c"
        "cestst.c"
        "cfintst.c"
        "cformtst.c"
        "cfrtst.c"
        "cg7coll.c"
        "cgendtst.c"
        "chashtst.c"
        "cintltst.c"
        "citertst.c"
        "cjaptst.c"
        "cldrtest.c"
        "cloctst.c"
        "cmsccoll.c"
        "cmsgtst.c"
        "cnmdptst.c"
        "cnormtst.c"
        "cnumtst.c"
        "cpluralrulestest.c"
        "cposxtst.c"
        "crelativedateformattest.c"
        "crestst.c"
        "creststn.c"
        "cstrcase.c"
        "cstrtest.c"
        "cturtst.c"
        "cucdapi.c"
        "cucdtst.c"
        "currtest.c"
        "custrtrn.c"
        "custrtst.c"
        "cutiltst.c"
        "encoll.c"
        "eurocreg.c"
        "hpmufn.c"
        "idnatest.c"
        "nccbtst.c"
        "ncnvfbts.c"
        "ncnvtst.c"
        "nfsprep.c"
        "nucnvtst.c"
        "putiltst.c"
        "reapits.c"
        "sorttest.c"
        "spooftest.c"
        "spreptst.c"
        "sprpdata.c"
        "stdnmtst.c"
        "tracetst.c"
        "trie2test.c"
        "trietest.c"
        "ucnvseltst.c"
        "ucptrietest.c"
        "ucsdetst.c"
        "udatatst.c"
        "udatpg_test.c"
        "uenumtst.c"
        "uformattedvaluetst.c"
        "ulistfmttest.c"
        "unumberformattertst.c"
        "uregiontest.c"
        "usettest.c"
        "usrchdat.c"
        "usrchtst.c"
        "utexttst.c"
        "utf16tst.c"
        "utf8tst.c"
        "utmstest.c"
        "utransts.c"

    ];
    cflags = [
        "-DANDROID_LINK_SHARED_ICU4C"
        #  Force the test to use the data file on
        "-DANDROID_USE_ICU_REG"
        #  Disable some file IO tests to workaround test crashing due to missing data files.
        "-DUCONFIG_NO_FILE_IO"
        "-DZERO_EXIT_CODE_FOR_FAILURES"
    ];
    exclude_srcs = [
        #  Not built directly, but #included from other sources.
        "usrchdat.c"
    ];
    #  Workaround Soong's limitation that data property can only include
    #  dependencies with a single variant
    compile_multilib = "first";
};

cintltst_test = java_test_host {
    name = "cintltst_test";
    data = [
        ":cintltst"
        ":icu4c_test_data"
        ":ICU4CTestRunner"
    ];
    test_config = "AndroidTest.xml";
    test_suites = ["device-tests"];
};

in { inherit cintltst cintltst_test; }
