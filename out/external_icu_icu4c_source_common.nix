{ cc_defaults, cc_library_headers, cc_library_shared }:
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

libicuuc_defaults = cc_defaults {
    name = "libicuuc_defaults";
    srcs = [
        "appendable.cpp"
        "bmpset.cpp"
        "brkeng.cpp"
        "brkiter.cpp"
        "bytesinkutil.cpp"
        "bytestream.cpp"
        "bytestrie.cpp"
        "bytestriebuilder.cpp"
        "bytestrieiterator.cpp"
        "caniter.cpp"
        "characterproperties.cpp"
        "chariter.cpp"
        "charstr.cpp"
        "cmemory.cpp"
        "cstr.cpp"
        "cstring.cpp"
        "cwchar.cpp"
        "dictbe.cpp"
        "dictionarydata.cpp"
        "dtintrv.cpp"
        "edits.cpp"
        "errorcode.cpp"
        "filteredbrk.cpp"
        "filterednormalizer2.cpp"
        "icudataver.cpp"
        "icuplug.cpp"
        "loadednormalizer2impl.cpp"
        "locavailable.cpp"
        "locbased.cpp"
        "locdispnames.cpp"
        "locdspnm.cpp"
        "locid.cpp"
        "loclikely.cpp"
        "locmap.cpp"
        "locresdata.cpp"
        "locutil.cpp"
        "messagepattern.cpp"
        "normalizer2.cpp"
        "normalizer2impl.cpp"
        "normlzr.cpp"
        "parsepos.cpp"
        "patternprops.cpp"
        "pluralmap.cpp"
        "propname.cpp"
        "propsvec.cpp"
        "punycode.cpp"
        "putil.cpp"
        "rbbi.cpp"
        "rbbi_cache.cpp"
        "rbbidata.cpp"
        "rbbinode.cpp"
        "rbbirb.cpp"
        "rbbiscan.cpp"
        "rbbisetb.cpp"
        "rbbistbl.cpp"
        "rbbitblb.cpp"
        "resbund.cpp"
        "resbund_cnv.cpp"
        "resource.cpp"
        "ruleiter.cpp"
        "schriter.cpp"
        "serv.cpp"
        "servlk.cpp"
        "servlkf.cpp"
        "servls.cpp"
        "servnotf.cpp"
        "servrbf.cpp"
        "servslkf.cpp"
        "sharedobject.cpp"
        "simpleformatter.cpp"
        "static_unicode_sets.cpp"
        "stringpiece.cpp"
        "stringtriebuilder.cpp"
        "uarrsort.cpp"
        "ubidi.cpp"
        "ubidi_props.cpp"
        "ubidiln.cpp"
        "ubiditransform.cpp"
        "ubidiwrt.cpp"
        "ubrk.cpp"
        "ucase.cpp"
        "ucasemap.cpp"
        "ucasemap_titlecase_brkiter.cpp"
        "ucat.cpp"
        "uchar.cpp"
        "ucharstrie.cpp"
        "ucharstriebuilder.cpp"
        "ucharstrieiterator.cpp"
        "uchriter.cpp"
        "ucln_cmn.cpp"
        "ucmndata.cpp"
        "ucnv.cpp"
        "ucnv2022.cpp"
        "ucnv_bld.cpp"
        "ucnv_cb.cpp"
        "ucnv_cnv.cpp"
        "ucnv_ct.cpp"
        "ucnv_err.cpp"
        "ucnv_ext.cpp"
        "ucnv_io.cpp"
        "ucnv_lmb.cpp"
        "ucnv_set.cpp"
        "ucnv_u16.cpp"
        "ucnv_u32.cpp"
        "ucnv_u7.cpp"
        "ucnv_u8.cpp"
        "ucnvbocu.cpp"
        "ucnvdisp.cpp"
        "ucnvhz.cpp"
        "ucnvisci.cpp"
        "ucnvlat1.cpp"
        "ucnvmbcs.cpp"
        "ucnvscsu.cpp"
        "ucnvsel.cpp"
        "ucol_swp.cpp"
        "ucptrie.cpp"
        "ucurr.cpp"
        "udata.cpp"
        "udatamem.cpp"
        "udataswp.cpp"
        "uenum.cpp"
        "uhash.cpp"
        "uhash_us.cpp"
        "uidna.cpp"
        "uinit.cpp"
        "uinvchar.cpp"
        "uiter.cpp"
        "ulist.cpp"
        "uloc.cpp"
        "uloc_keytype.cpp"
        "uloc_tag.cpp"
        "umapfile.cpp"
        "umath.cpp"
        "umutablecptrie.cpp"
        "umutex.cpp"
        "unames.cpp"
        "unifiedcache.cpp"
        "unifilt.cpp"
        "unifunct.cpp"
        "uniset.cpp"
        "uniset_closure.cpp"
        "uniset_props.cpp"
        "unisetspan.cpp"
        "unistr.cpp"
        "unistr_case.cpp"
        "unistr_case_locale.cpp"
        "unistr_cnv.cpp"
        "unistr_props.cpp"
        "unistr_titlecase_brkiter.cpp"
        "unorm.cpp"
        "unormcmp.cpp"
        "uobject.cpp"
        "uprops.cpp"
        "ures_cnv.cpp"
        "uresbund.cpp"
        "uresdata.cpp"
        "usc_impl.cpp"
        "uscript.cpp"
        "uscript_props.cpp"
        "uset.cpp"
        "uset_props.cpp"
        "usetiter.cpp"
        "ushape.cpp"
        "usprep.cpp"
        "ustack.cpp"
        "ustr_cnv.cpp"
        "ustr_titlecase_brkiter.cpp"
        "ustr_wcs.cpp"
        "ustrcase.cpp"
        "ustrcase_locale.cpp"
        "ustrenum.cpp"
        "ustrfmt.cpp"
        "ustring.cpp"
        "ustrtrns.cpp"
        "utext.cpp"
        "utf_impl.cpp"
        "util.cpp"
        "util_props.cpp"
        "utrace.cpp"
        "utrie.cpp"
        "utrie2.cpp"
        "utrie2_builder.cpp"
        "utrie_swap.cpp"
        "uts46.cpp"
        "utypes.cpp"
        "uvector.cpp"
        "uvectr32.cpp"
        "uvectr64.cpp"
        "wintz.cpp"
    ];

    #  We deliberately do not set -DICU_DATA_DIR: ICU4C is configured on Android
    #  using udata_setCommonData.
    cflags = [
        "-D_REENTRANT"
        "-DU_COMMON_IMPLEMENTATION"

        "-O3"
        "-fvisibility=hidden"

        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-deprecated-declarations"
    ];

    cppflags = [
        "-std=c++11"
    ];

    rtti = true;

    required = ["icu-data_host_runtime_apex"];

    target = {
        android = {
            cflags = [
                "-DANDROID_LINK_SHARED_ICU4C"
                "-DPIC"
                "-fPIC"
            ];
        };
    };
};

libicuuc_headers = cc_library_headers {
    name = "libicuuc_headers";
    host_supported = true;
    header_libs = ["icu4c_extra_headers"];
    export_header_lib_headers = ["icu4c_extra_headers"];
    export_include_dirs = ["."];
    target = {
        windows = {
            enabled = true;
        };
    };
};

#
#  Build for the host and target.
#
libicuuc = cc_library_shared {
    name = "libicuuc";
    host_supported = true;
    unique_host_soname = true;
    defaults = ["libicuuc_defaults"];
    target = {
        android = {
            static_libs = ["libicuuc_stubdata"];
        };
        not_windows = {
            static_libs = ["libicuuc_stubdata"];
        };
        windows = {
            enabled = true;
            #  Windows requires importing data as a DLL when building with U_COMMON_IMPLEMENTATION
            shared_libs = ["libicuuc_stubdata"];
        };
    };
    header_libs = ["libicuuc_headers"];
    export_header_lib_headers = ["libicuuc_headers"];
};

in { inherit libicuuc libicuuc_defaults libicuuc_headers; }
