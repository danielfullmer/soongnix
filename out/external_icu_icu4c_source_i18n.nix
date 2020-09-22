{ cc_defaults, cc_library, cc_library_headers }:
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

#
#  Common definitions.
#

libicui18n_defaults = cc_defaults {
    name = "libicui18n_defaults";
    srcs = [
        "alphaindex.cpp"
        "anytrans.cpp"
        "astro.cpp"
        "basictz.cpp"
        "bocsu.cpp"
        "brktrans.cpp"
        "buddhcal.cpp"
        "calendar.cpp"
        "casetrn.cpp"
        "cecal.cpp"
        "chnsecal.cpp"
        "choicfmt.cpp"
        "coleitr.cpp"
        "coll.cpp"
        "collation.cpp"
        "collationbuilder.cpp"
        "collationcompare.cpp"
        "collationdata.cpp"
        "collationdatabuilder.cpp"
        "collationdatareader.cpp"
        "collationdatawriter.cpp"
        "collationfastlatin.cpp"
        "collationfastlatinbuilder.cpp"
        "collationfcd.cpp"
        "collationiterator.cpp"
        "collationkeys.cpp"
        "collationroot.cpp"
        "collationrootelements.cpp"
        "collationruleparser.cpp"
        "collationsets.cpp"
        "collationsettings.cpp"
        "collationtailoring.cpp"
        "collationweights.cpp"
        "compactdecimalformat.cpp"
        "coptccal.cpp"
        "cpdtrans.cpp"
        "csdetect.cpp"
        "csmatch.cpp"
        "csr2022.cpp"
        "csrecog.cpp"
        "csrmbcs.cpp"
        "csrsbcs.cpp"
        "csrucode.cpp"
        "csrutf8.cpp"
        "curramt.cpp"
        "currfmt.cpp"
        "currpinf.cpp"
        "currunit.cpp"
        "dangical.cpp"
        "datefmt.cpp"
        "dayperiodrules.cpp"
        "dcfmtsym.cpp"
        "decContext.cpp"
        "decNumber.cpp"
        "decimfmt.cpp"
        "double-conversion-bignum-dtoa.cpp"
        "double-conversion-bignum.cpp"
        "double-conversion-cached-powers.cpp"
        "double-conversion-double-to-string.cpp"
        "double-conversion-fast-dtoa.cpp"
        "double-conversion-string-to-double.cpp"
        "double-conversion-strtod.cpp"
        "dtfmtsym.cpp"
        "dtitvfmt.cpp"
        "dtitvinf.cpp"
        "dtptngen.cpp"
        "dtrule.cpp"
        "erarules.cpp"
        "esctrn.cpp"
        "ethpccal.cpp"
        "fmtable.cpp"
        "fmtable_cnv.cpp"
        "format.cpp"
        "formatted_string_builder.cpp"
        "formattedval_iterimpl.cpp"
        "formattedval_sbimpl.cpp"
        "formattedvalue.cpp"
        "fphdlimp.cpp"
        "fpositer.cpp"
        "funcrepl.cpp"
        "gender.cpp"
        "gregocal.cpp"
        "gregoimp.cpp"
        "hebrwcal.cpp"
        "indiancal.cpp"
        "inputext.cpp"
        "islamcal.cpp"
        "japancal.cpp"
        "listformatter.cpp"
        "measfmt.cpp"
        "measunit.cpp"
        "measure.cpp"
        "msgfmt.cpp"
        "name2uni.cpp"
        "nfrs.cpp"
        "nfrule.cpp"
        "nfsubs.cpp"
        "nortrans.cpp"
        "nounit.cpp"
        "nultrans.cpp"
        "number_affixutils.cpp"
        "number_asformat.cpp"
        "number_capi.cpp"
        "number_compact.cpp"
        "number_currencysymbols.cpp"
        "number_decimalquantity.cpp"
        "number_decimfmtprops.cpp"
        "number_fluent.cpp"
        "number_formatimpl.cpp"
        "number_grouping.cpp"
        "number_integerwidth.cpp"
        "number_longnames.cpp"
        "number_mapper.cpp"
        "number_modifiers.cpp"
        "number_multiplier.cpp"
        "number_notation.cpp"
        "number_output.cpp"
        "number_padding.cpp"
        "number_patternmodifier.cpp"
        "number_patternstring.cpp"
        "number_rounding.cpp"
        "number_scientific.cpp"
        "number_skeletons.cpp"
        "number_utils.cpp"
        "numfmt.cpp"
        "numparse_affixes.cpp"
        "numparse_compositions.cpp"
        "numparse_currency.cpp"
        "numparse_decimal.cpp"
        "numparse_impl.cpp"
        "numparse_parsednumber.cpp"
        "numparse_scientific.cpp"
        "numparse_symbols.cpp"
        "numparse_validators.cpp"
        "numrange_fluent.cpp"
        "numrange_impl.cpp"
        "numsys.cpp"
        "olsontz.cpp"
        "persncal.cpp"
        "plurfmt.cpp"
        "plurrule.cpp"
        "quant.cpp"
        "quantityformatter.cpp"
        "rbnf.cpp"
        "rbt.cpp"
        "rbt_data.cpp"
        "rbt_pars.cpp"
        "rbt_rule.cpp"
        "rbt_set.cpp"
        "rbtz.cpp"
        "regexcmp.cpp"
        "regeximp.cpp"
        "regexst.cpp"
        "regextxt.cpp"
        "region.cpp"
        "reldatefmt.cpp"
        "reldtfmt.cpp"
        "rematch.cpp"
        "remtrans.cpp"
        "repattrn.cpp"
        "rulebasedcollator.cpp"
        "scientificnumberformatter.cpp"
        "scriptset.cpp"
        "search.cpp"
        "selfmt.cpp"
        "sharedbreakiterator.cpp"
        "simpletz.cpp"
        "smpdtfmt.cpp"
        "smpdtfst.cpp"
        "sortkey.cpp"
        "standardplural.cpp"
        "string_segment.cpp"
        "strmatch.cpp"
        "strrepl.cpp"
        "stsearch.cpp"
        "taiwncal.cpp"
        "timezone.cpp"
        "titletrn.cpp"
        "tmunit.cpp"
        "tmutamt.cpp"
        "tmutfmt.cpp"
        "tolowtrn.cpp"
        "toupptrn.cpp"
        "translit.cpp"
        "transreg.cpp"
        "tridpars.cpp"
        "tzfmt.cpp"
        "tzgnames.cpp"
        "tznames.cpp"
        "tznames_impl.cpp"
        "tzrule.cpp"
        "tztrans.cpp"
        "ucal.cpp"
        "ucln_in.cpp"
        "ucol.cpp"
        "ucol_res.cpp"
        "ucol_sit.cpp"
        "ucoleitr.cpp"
        "ucsdet.cpp"
        "udat.cpp"
        "udateintervalformat.cpp"
        "udatpg.cpp"
        "ufieldpositer.cpp"
        "uitercollationiterator.cpp"
        "ulistformatter.cpp"
        "ulocdata.cpp"
        "umsg.cpp"
        "unesctrn.cpp"
        "uni2name.cpp"
        "unum.cpp"
        "unumsys.cpp"
        "upluralrules.cpp"
        "uregex.cpp"
        "uregexc.cpp"
        "uregion.cpp"
        "usearch.cpp"
        "uspoof.cpp"
        "uspoof_build.cpp"
        "uspoof_conf.cpp"
        "uspoof_impl.cpp"
        "utf16collationiterator.cpp"
        "utf8collationiterator.cpp"
        "utmscale.cpp"
        "utrans.cpp"
        "vtzone.cpp"
        "vzone.cpp"
        "windtfmt.cpp"
        "winnmfmt.cpp"
        "wintzimpl.cpp"
        "zonemeta.cpp"
        "zrule.cpp"
        "ztrans.cpp"
    ];
    cflags = [
        "-D_REENTRANT"
        "-DU_I18N_IMPLEMENTATION"
        "-O3"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-const-variable"
        "-Wno-unneeded-internal-declaration"
    ];
    cppflags = [
        "-std=c++11"
    ];
    rtti = true;

    target = {
        android = {
            cflags = [
                "-DANDROID_LINK_SHARED_ICU4C"
                "-DPIC"
                "-fPIC"
            ];
        };
        windows = {
            enabled = true;
        };
    };
};

libicui18n_headers = cc_library_headers {
    name = "libicui18n_headers";
    host_supported = true;
    native_bridge_supported = true;
    export_include_dirs = ["."];
    target = {
        windows = {
            enabled = true;
        };
    };

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#
#  Build for the host and target (device).
#  Allow static builds for host so that they can be statically
#  linked into libandroid_runtime. That enables libandroid_runtime to
#  be shipped on desktops as one file which saves space and complexity.
#
libicui18n = cc_library {
    name = "libicui18n";
    defaults = ["libicui18n_defaults"];
    host_supported = true;
    native_bridge_supported = true;
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
        #  b/133140750 Clean this up. This is due to the dependency to from libmedia
        "//apex_available:platform"
    ];
    unique_host_soname = true;
    shared_libs = ["libicuuc"];
    header_libs = ["libicui18n_headers"];
    export_header_lib_headers = ["libicui18n_headers"];
    target = {
        android = {
            static = {
                enabled = false;
            };
        };
    };
};

in { inherit libicui18n libicui18n_defaults libicui18n_headers; }
