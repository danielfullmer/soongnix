{ cc_defaults, cc_library_headers, cc_library_shared, cc_library_static, cc_test, genrule, genrule_defaults, java_library_static, prebuilt_etc }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

libtextclassifier_hash_headers = cc_library_headers {
    name = "libtextclassifier_hash_headers";
    vendor_available = true;
    export_include_dirs = ["."];
};

libtextclassifier_hash_defaults = cc_defaults {
    name = "libtextclassifier_hash_defaults";
    srcs = [
        "utils/hash/farmhash.cc"
        "util/hash/hash.cc"
    ];
    cflags = [
        "-DNAMESPACE_FOR_HASH_FUNCTIONS=farmhash"
        "-Wall"
        "-Werror"
        "-Wno-unused-function"
    ];
};

libtextclassifier_hash = cc_library_shared {
    name = "libtextclassifier_hash";
    defaults = ["libtextclassifier_hash_defaults"];
    vendor_available = true;
    double_loadable = true;
};

libtextclassifier_hash_static = cc_library_static {
    name = "libtextclassifier_hash_static";
    defaults = ["libtextclassifier_hash_defaults"];
    sdk_version = "current";
    stl = "libc++_static";
};

libtextclassifier-java = java_library_static {
    name = "libtextclassifier-java";
    sdk_version = "core_current";
    no_framework_libs = true;
    srcs = ["java/**/*.java"];
};

libtextclassifier_defaults = cc_defaults {
    name = "libtextclassifier_defaults";

    #  For debug / treemap purposes.
    # strip: {
    #     keep_symbols: true,
    # },

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-deprecated-declarations"
        "-Wno-ignored-qualifiers"
        "-Wno-missing-field-initializers"
        "-Wno-sign-compare"
        "-Wno-tautological-constant-out-of-range-compare"
        "-Wno-undefined-var-template"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-extern-c-compat"

        "-funsigned-char"
        "-fvisibility=hidden"
        "-DLIBTEXTCLASSIFIER_UNILIB_ICU"
        "-DZLIB_CONST"
        "-DSAFTM_COMPACT_LOGGING"
        "-DTC3_WITH_ACTIONS_OPS"
        "-DTC3_UNILIB_JAVAICU"
        "-DTC3_CALENDAR_JAVAICU"
        "-DTC3_AOSP"
    ];

    product_variables = {
        debuggable = {
            #  Only enable debug logging in userdebug/eng builds.
            cflags = ["-DTC_DEBUG_LOGGING=1"];
        };
    };

    generated_headers = [
        "libtextclassifier_fbgen_flatbuffers"
        "libtextclassifier_fbgen_tokenizer"
        "libtextclassifier_fbgen_codepoint_range"
        "libtextclassifier_fbgen_entity-data"
        "libtextclassifier_fbgen_zlib_buffer"
        "libtextclassifier_fbgen_resources_extra"
        "libtextclassifier_fbgen_intent_config"
        "libtextclassifier_fbgen_annotator_model"
        "libtextclassifier_fbgen_actions_model"
        "libtextclassifier_fbgen_tflite_text_encoder_config"
        "libtextclassifier_fbgen_lang_id_embedded_network"
        "libtextclassifier_fbgen_lang_id_model"
        "libtextclassifier_fbgen_actions-entity-data"
    ];

    header_libs = [
        "tensorflow_headers"
        "flatbuffer_headers"
    ];

    shared_libs = [
        "liblog"
        "libtflite"
        "libz"
    ];

    static_libs = [
        "liblua"
        "libutf"
    ];
};

#  -----------------
#  Generate headers with FlatBuffer schema compiler.
#  -----------------
fbgen = genrule_defaults {
    name = "fbgen";
    tools = ["flatc"];
    #  "depfile" is used here in conjunction with flatc's -M to gather the deps
    cmd = "$(location flatc) --cpp --no-union-value-namespacing --gen-object-api --keep-prefix -I external/libtextclassifier -M $(in) >$(depfile) && " +
        "$(location flatc) --cpp --no-union-value-namespacing --gen-object-api --keep-prefix -I external/libtextclassifier -o $$(dirname $(out)) $(in)";
    depfile = true;
};

libtextclassifier_fbgen_flatbuffers = genrule {
    name = "libtextclassifier_fbgen_flatbuffers";
    srcs = ["utils/flatbuffers.fbs"];
    out = ["utils/flatbuffers_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_tokenizer = genrule {
    name = "libtextclassifier_fbgen_tokenizer";
    srcs = ["utils/tokenizer.fbs"];
    out = ["utils/tokenizer_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_codepoint_range = genrule {
    name = "libtextclassifier_fbgen_codepoint_range";
    srcs = ["utils/codepoint-range.fbs"];
    out = ["utils/codepoint-range_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_resources_extra = genrule {
    name = "libtextclassifier_fbgen_resources_extra";
    srcs = ["utils/resources.fbs"];
    out = ["utils/resources_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_entity-data = genrule {
    name = "libtextclassifier_fbgen_entity-data";
    srcs = ["annotator/entity-data.fbs"];
    out = ["annotator/entity-data_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_zlib_buffer = genrule {
    name = "libtextclassifier_fbgen_zlib_buffer";
    srcs = ["utils/zlib/buffer.fbs"];
    out = ["utils/zlib/buffer_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_intent_config = genrule {
    name = "libtextclassifier_fbgen_intent_config";
    srcs = ["utils/intents/intent-config.fbs"];
    out = ["utils/intents/intent-config_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_annotator_model = genrule {
    name = "libtextclassifier_fbgen_annotator_model";
    srcs = ["annotator/model.fbs"];
    out = ["annotator/model_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_actions_model = genrule {
    name = "libtextclassifier_fbgen_actions_model";
    srcs = ["actions/actions_model.fbs"];
    out = ["actions/actions_model_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_tflite_text_encoder_config = genrule {
    name = "libtextclassifier_fbgen_tflite_text_encoder_config";
    srcs = ["utils/tflite/text_encoder_config.fbs"];
    out = ["utils/tflite/text_encoder_config_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_lang_id_embedded_network = genrule {
    name = "libtextclassifier_fbgen_lang_id_embedded_network";
    srcs = ["lang_id/common/flatbuffers/embedding-network.fbs"];
    out = ["lang_id/common/flatbuffers/embedding-network_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_lang_id_model = genrule {
    name = "libtextclassifier_fbgen_lang_id_model";
    srcs = ["lang_id/common/flatbuffers/model.fbs"];
    out = ["lang_id/common/flatbuffers/model_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_actions-entity-data = genrule {
    name = "libtextclassifier_fbgen_actions-entity-data";
    srcs = ["actions/actions-entity-data.fbs"];
    out = ["actions/actions-entity-data_generated.h"];
    defaults = ["fbgen"];
};

#  -----------------
#  libtextclassifier
#  -----------------
libtextclassifier = cc_library_shared {
    name = "libtextclassifier";
    defaults = ["libtextclassifier_defaults"];

    srcs = ["**/*.cc"];
    exclude_srcs = [
        "**/*_test.cc"
        "**/*-test-lib.cc"
        "utils/testing/*.cc"
        "test-util.*"
        "utils/calendar/*_test-include.*"
        "utils/utf8/*_test-include.*"
    ];

    required = [
        "libtextclassifier_annotator_en_model"
        "libtextclassifier_annotator_universal_model"
        "libtextclassifier_actions_suggestions_universal_model"
        "libtextclassifier_lang_id_model"
    ];

    version_script = "jni.lds";
};

#  -----------------------
#  libtextclassifier_tests
#  -----------------------
libtextclassifier_tests = cc_test {
    name = "libtextclassifier_tests";
    defaults = ["libtextclassifier_defaults"];

    test_suites = ["device-tests"];

    data = [
        "annotator/test_data/**/*"
        "actions/test_data/**/*"
    ];

    srcs = ["**/*.cc"];
    #  TODO: Do not filter out tflite test once the dependency issue is resolved.
    exclude_srcs = [
        "utils/tflite/*_test.cc"
        "utils/flatbuffers_test.cc"
        "utils/calendar/*_test-include.*"
        "utils/utf8/*_test-include.*"
    ];

    static_libs = ["libgmock"];

    multilib = {
        lib32 = {
            cppflags = ["-DTC3_TEST_DATA_DIR=\"/data/nativetest/libtextclassifier_tests/test_data/\""];
        };
        lib64 = {
            cppflags = ["-DTC3_TEST_DATA_DIR=\"/data/nativetest64/libtextclassifier_tests/test_data/\""];
        };
    };
};

#  ----------------
#  Annotator models
#  ----------------

libtextclassifier_annotator_en_model = prebuilt_etc {
    name = "libtextclassifier_annotator_en_model";
    filename = "textclassifier.en.model";
    owner = "google";
    src = "models/textclassifier.en.model";
    sub_dir = "textclassifier";
};

libtextclassifier_annotator_universal_model = prebuilt_etc {
    name = "libtextclassifier_annotator_universal_model";
    filename = "textclassifier.universal.model";
    owner = "google";
    src = "models/textclassifier.universal.model";
    sub_dir = "textclassifier";
};

#  ---------------------------
#  Actions Suggestions models
#  ---------------------------

libtextclassifier_actions_suggestions_universal_model = prebuilt_etc {
    name = "libtextclassifier_actions_suggestions_universal_model";
    filename = "actions_suggestions.universal.model";
    owner = "google";
    src = "models/actions_suggestions.universal.model";
    sub_dir = "textclassifier";
};

#  ------------
#  LangId model
#  ------------

libtextclassifier_lang_id_model = prebuilt_etc {
    name = "libtextclassifier_lang_id_model";
    filename = "lang_id.model";
    owner = "google";
    src = "models/lang_id.model";
    sub_dir = "textclassifier";
};

in { inherit fbgen libtextclassifier libtextclassifier-java libtextclassifier_actions_suggestions_universal_model libtextclassifier_annotator_en_model libtextclassifier_annotator_universal_model libtextclassifier_defaults libtextclassifier_fbgen_actions-entity-data libtextclassifier_fbgen_actions_model libtextclassifier_fbgen_annotator_model libtextclassifier_fbgen_codepoint_range libtextclassifier_fbgen_entity-data libtextclassifier_fbgen_flatbuffers libtextclassifier_fbgen_intent_config libtextclassifier_fbgen_lang_id_embedded_network libtextclassifier_fbgen_lang_id_model libtextclassifier_fbgen_resources_extra libtextclassifier_fbgen_tflite_text_encoder_config libtextclassifier_fbgen_tokenizer libtextclassifier_fbgen_zlib_buffer libtextclassifier_hash libtextclassifier_hash_defaults libtextclassifier_hash_headers libtextclassifier_hash_static libtextclassifier_lang_id_model libtextclassifier_tests; }
