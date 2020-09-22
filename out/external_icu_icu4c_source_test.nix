{ cc_defaults, genrule }:
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

subdirs = [
    "cintltst"
    "intltest"
];

icu_test_defaults = cc_defaults {
    name = "icu_test_defaults";
    gtest = false;
    rtti = true;
    cflags = [
        "-Wno-deprecated-declarations"
        "-Wno-missing-field-initializers"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
    c_std = "c11";
    cpp_std = "c++11";
    shared_libs = [
        "libicuuc"
        "libicui18n"
        "libbase"
        "liblog"
    ];

    static_libs = [
        "libicuctest"
        "libicutoolutil"
        "libandroidicuinit"
    ];
};

icu4c_test_data = genrule {
    name = "icu4c_test_data";
    srcs = [
        "testdata/BUILDRULES.py"
        "testdata/BidiCharacterTest.txt"
        "testdata/BidiTest.txt"
        "testdata/CollationTest_NON_IGNORABLE_SHORT.txt"
        "testdata/CollationTest_SHIFTED_SHORT.txt"
        "testdata/ConverterSelectorTestUTF8.txt"
        "testdata/GraphemeBreakTest.txt"
        "testdata/IdnaTestV2.txt"
        "testdata/LineBreakTest.txt"
        "testdata/Makefile.in"
        "testdata/NormalizationTest-3.2.0.txt"
        "testdata/NumberFormatTestCases.txt"
        "testdata/SentenceBreakTest.txt"
        "testdata/TestFont1.otf"
        "testdata/WordBreakTest.txt"
        "testdata/break_rules/"
        "testdata/calendar.txt"
        "testdata/casing.txt"
        "testdata/collationtest.txt"
        "testdata/conversion.txt"
        "testdata/csdetest.xml"
        "testdata/dcfmtest.txt"
        "testdata/default.txt"
        "testdata/emoji-test.txt"
        "testdata/encoded.utf16be"
        "testdata/filters/"
        "testdata/filtertest.txt"
        "testdata/format.txt"
        "testdata/ibm9027.ucm"
        "testdata/icuio.txt"
        "testdata/idna_conf.txt"
        "testdata/idna_rules.txt"
        "testdata/importtest.bin"
        "testdata/letest.xml"
        "testdata/localeMatcherTest.txt"
        "testdata/mc.txt"
        "testdata/metaZones.txt"
        "testdata/nfs4_cis_prep.txt"
        "testdata/nfs4_cs_prep_ci.txt"
        "testdata/nfs4_cs_prep_cs.txt"
        "testdata/nfs4_mixed_prep_p.txt"
        "testdata/nfs4_mixed_prep_s.txt"
        "testdata/numberformattestspecification.txt"
        "testdata/numberpermutationtest.txt"
        "testdata/old_e_testtypes.res"
        "testdata/old_l_testtypes.res"
        "testdata/out/"
        "testdata/pkgdata.inc.in"
        "testdata/pkgdataMakefile.in"
        "testdata/ra.txt"
        "testdata/ra.xlf"
        "testdata/rbbitst.txt"
        "testdata/re_tests.txt"
        "testdata/readme.txt"
        "testdata/regextst.txt"
        "testdata/riwords.txt"
        "testdata/root.txt"
        "testdata/sh.txt"
        "testdata/sh_YU.txt"
        "testdata/ssearch.xml"
        "testdata/structLocale.txt"
        "testdata/te.txt"
        "testdata/te_IN.txt"
        "testdata/te_IN_REVISED.txt"
        "testdata/test1.ucm"
        "testdata/test1bmp.ucm"
        "testdata/test2.ucm"
        "testdata/test3.ucm"
        "testdata/test4.ucm"
        "testdata/test4x.ucm"
        "testdata/test5.ucm"
        "testdata/testaliases.txt"
        "testdata/testdata.mak"
        "testdata/testempty.txt"
        "testdata/testnorm.txt"
        "testdata/testtypes.txt"
        "testdata/timezoneTypes.txt"
        "testdata/translit_rules.txt"
        "testdata/uni-text.bin"
        "testdata/windowsZones.txt"
        "testdata/zoneinfo64.txt"
        "testdata/break_rules/README.md"
        "testdata/break_rules/grapheme.txt"
        "testdata/break_rules/line.txt"
        "testdata/break_rules/line_cj.txt"
        "testdata/break_rules/line_loose.txt"
        "testdata/break_rules/line_loose_cj.txt"
        "testdata/break_rules/line_normal.txt"
        "testdata/break_rules/line_normal_cj.txt"
        "testdata/break_rules/sentence.txt"
        "testdata/break_rules/word.txt"
        "testdata/break_rules/word_POSIX.txt"
        "testdata/filters/filtertest.txt"
        "testdata/out/build/"
        "testdata/out/testdata/"
        "testdata/out/testdata.dat"
        "testdata/out/build/calendar.res"
        "testdata/out/build/casing.res"
        "testdata/out/build/conversion.res"
        "testdata/out/build/encoded.res"
        "testdata/out/build/filtertest.res"
        "testdata/out/build/format.res"
        "testdata/out/build/ibm9027.cnv"
        "testdata/out/build/icuio.res"
        "testdata/out/build/idna_rules.res"
        "testdata/out/build/mc.res"
        "testdata/out/build/nfscis.spp"
        "testdata/out/build/nfscsi.spp"
        "testdata/out/build/nfscss.spp"
        "testdata/out/build/nfsmxp.spp"
        "testdata/out/build/nfsmxs.spp"
        "testdata/out/build/old_e_testtypes.res"
        "testdata/out/build/old_l_testtypes.res"
        "testdata/out/build/root.res"
        "testdata/out/build/sh.res"
        "testdata/out/build/sh_YU.res"
        "testdata/out/build/structLocale.res"
        "testdata/out/build/te.res"
        "testdata/out/build/te_IN.res"
        "testdata/out/build/te_IN_REVISED.res"
        "testdata/out/build/test.icu"
        "testdata/out/build/test1.cnv"
        "testdata/out/build/test1bmp.cnv"
        "testdata/out/build/test2.cnv"
        "testdata/out/build/test3.cnv"
        "testdata/out/build/test4.cnv"
        "testdata/out/build/test4x.cnv"
        "testdata/out/build/test5.cnv"
        "testdata/out/build/testaliases.res"
        "testdata/out/build/testempty.res"
        "testdata/out/build/testnorm.nrm"
        "testdata/out/build/testtable32.res"
        "testdata/out/build/testtypes.res"
        "testdata/out/testdata/dirs.timestamp"
        "testdata/out/testdata/nam.typ"
        "testdata/out/testdata/testdata.lst"
        "testdata/out/testdata/testtable32.txt"
        "testdata/out/testdata/zoneinfo64.res"
    ];
    out = ["icu4c_test_data.zip"];
    tools = ["soong_zip"];
    cmd = "$(location soong_zip) -o $(out) -C external/icu/icu4c/source/test/testdata -D external/icu/icu4c/source/test/testdata";
};

in { inherit icu4c_test_data icu_test_defaults; }
