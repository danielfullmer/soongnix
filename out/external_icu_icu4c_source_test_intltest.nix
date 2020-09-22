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

intltest = cc_test {
    name = "intltest";
    defaults = ["icu_test_defaults"];
    multilib = {
        lib64 = {
            suffix = "64";
        };
        lib32 = {
            suffix = "32";
        };
    };

    cflags = [
        "-DANDROID_LINK_SHARED_ICU4C"
        #  Force the test to use the data file on
        "-DANDROID_USE_ICU_REG"
        #  Needed for char* shift calculation in the test.
        "-Wno-string-plus-int"
        "-DZERO_EXIT_CODE_FOR_FAILURES"
    ];
    srcs = [

        "aliastst.cpp"
        "allcoll.cpp"
        "alphaindextst.cpp"
        "apicoll.cpp"
        "astrotst.cpp"
        "bidiconf.cpp"
        "bytestrietest.cpp"
        "calcasts.cpp"
        "callimts.cpp"
        "calregts.cpp"
        "caltest.cpp"
        "caltztst.cpp"
        "canittst.cpp"
        "citrtest.cpp"
        "collationtest.cpp"
        "colldata.cpp"
        "compactdecimalformattest.cpp"
        "convtest.cpp"
        "cpdtrtst.cpp"
        "csdetest.cpp"
        "currcoll.cpp"
        "dadrcal.cpp"
        "dadrfmt.cpp"
        "datadrivennumberformattestsuite.cpp"
        "dcfmapts.cpp"
        "dcfmtest.cpp"
        "decoll.cpp"
        "dtfmapts.cpp"
        "dtfmrgts.cpp"
        "dtfmtrtts.cpp"
        "dtfmttst.cpp"
        "dtifmtts.cpp"
        "dtptngts.cpp"
        "encoll.cpp"
        "erarulestest.cpp"
        "escoll.cpp"
        "ficoll.cpp"
        "fldset.cpp"
        "formatted_string_builder_test.cpp"
        "formattedvaluetest.cpp"
        "frcoll.cpp"
        "g7coll.cpp"
        "genderinfotest.cpp"
        "icusvtst.cpp"
        "idnaconf.cpp"
        "idnaref.cpp"
        "incaltst.cpp"
        "intltest.cpp"
        "itercoll.cpp"
        "itformat.cpp"
        "itmajor.cpp"
        "itrbbi.cpp"
        "itrbnf.cpp"
        "itrbnfp.cpp"
        "itrbnfrt.cpp"
        "itspoof.cpp"
        "ittrans.cpp"
        "itutil.cpp"
        "jacoll.cpp"
        "jamotest.cpp"
        "lcukocol.cpp"
        "listformattertest.cpp"
        "localebuildertest.cpp"
        "localematchertest.cpp"
        "locnmtst.cpp"
        "loctest.cpp"
        "measfmttest.cpp"
        "miscdtfm.cpp"
        "mnkytst.cpp"
        "msfmrgts.cpp"
        "nmfmapts.cpp"
        "nmfmtrt.cpp"
        "normconf.cpp"
        "nptrans.cpp"
        "numberformat2test.cpp"
        "numberformattesttuple.cpp"
        "numbertest_affixutils.cpp"
        "numbertest_api.cpp"
        "numbertest_decimalquantity.cpp"
        "numbertest_doubleconversion.cpp"
        "numbertest_modifiers.cpp"
        "numbertest_parse.cpp"
        "numbertest_patternmodifier.cpp"
        "numbertest_patternstring.cpp"
        "numbertest_permutation.cpp"
        "numbertest_range.cpp"
        "numbertest_skeletons.cpp"
        "numfmtdatadriventest.cpp"
        "numfmtspectest.cpp"
        "numfmtst.cpp"
        "numrgts.cpp"
        "pluralmaptest.cpp"
        "plurfmts.cpp"
        "plurults.cpp"
        "pptest.cpp"
        "punyref.cpp"
        "quantityformattertest.cpp"
        "rbbiapts.cpp"
        "rbbimonkeytest.cpp"
        "rbbitst.cpp"
        "regcoll.cpp"
        "regextst.cpp"
        "regiontst.cpp"
        "reldatefmttest.cpp"
        "reptest.cpp"
        "restest.cpp"
        "restsnew.cpp"
        "scientificnumberformattertest.cpp"
        "sdtfmtts.cpp"
        "selfmts.cpp"
        "sfwdchit.cpp"
        "simpleformattertest.cpp"
        "simplethread.cpp"
        "srchtest.cpp"
        "ssearch.cpp"
        "static_unisets_test.cpp"
        "strcase.cpp"
        "string_segment_test.cpp"
        "strtest.cpp"
        "svccoll.cpp"
        "tchcfmt.cpp"
        "testidn.cpp"
        "testidna.cpp"
        "testutil.cpp"
        "textfile.cpp"
        "tfsmalls.cpp"
        "thcoll.cpp"
        "tmsgfmt.cpp"
        "tokiter.cpp"
        "transapi.cpp"
        "transrt.cpp"
        "transtst.cpp"
        "trcoll.cpp"
        "trnserr.cpp"
        "tscoll.cpp"
        "tsdate.cpp"
        "tsdcfmsy.cpp"
        "tsdtfmsy.cpp"
        "tsmthred.cpp"
        "tsnmfmt.cpp"
        "tsputil.cpp"
        "tstnorm.cpp"
        "tstnrapi.cpp"
        "tufmtts.cpp"
        "tzbdtest.cpp"
        "tzfmttst.cpp"
        "tzoffloc.cpp"
        "tzregts.cpp"
        "tzrulets.cpp"
        "tztest.cpp"
        "ucaconf.cpp"
        "ucdtest.cpp"
        "ucharstrietest.cpp"
        "unifiedcachetest.cpp"
        "uobjtest.cpp"
        "usettest.cpp"
        "ustrtest.cpp"
        "uts46test.cpp"
        "utxttest.cpp"
        "uvectest.cpp"
        "v32test.cpp"
        "windttst.cpp"
        "winnmtst.cpp"
        "winutil.cpp"
    ];
    exclude_srcs = [
        "numberformat2test.cpp"
    ];

    #  Workaround Soong's limitation that data property can only include
    #  dependencies with a single variant
    compile_multilib = "first";
};

intltest_test = java_test_host {
    name = "intltest_test";
    data = [
        ":intltest"
        ":icu4c_test_data"
        ":ICU4CTestRunner"
    ];
    test_config = "AndroidTest.xml";
    test_suites = ["device-tests"];
};

in { inherit intltest intltest_test; }
