{ cc_defaults, cc_library_headers, cc_library_shared, cc_library_static, cc_test, genrule, genrule_defaults, prebuilt_etc }:
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
    apex_available = [
        "//apex_available:platform"
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
    ];
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
    vendor_available = true;
    sdk_version = "current";
    stl = "libc++_static";
    apex_available = [
        "//apex_available:platform"
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        "com.android.extservices"
    ];
};

libtextclassifier_defaults = cc_defaults {
    name = "libtextclassifier_defaults";
    stl = "libc++_static";
    sdk_version = "current";
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
            cflags = ["-DTC3_DEBUG_LOGGING=1"];
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
        "libtextclassifier_fbgen_annotator_experimental_model"
        "libtextclassifier_fbgen_actions_model"
        "libtextclassifier_fbgen_tflite_text_encoder_config"
        "libtextclassifier_fbgen_lang_id_embedded_network"
        "libtextclassifier_fbgen_lang_id_model"
        "libtextclassifier_fbgen_actions-entity-data"
        "libtextclassifier_fbgen_normalization"
        "libtextclassifier_fbgen_language-tag"
        "libtextclassifier_fbgen_person_name_model"
        "libtextclassifier_fbgen_grammar_dates"
        "libtextclassifier_fbgen_timezone_code"
        "libtextclassifier_fbgen_grammar_rules"
    ];

    header_libs = [
        "tensorflow_headers"
        "flatbuffer_headers"
    ];

    shared_libs = [
        "liblog"
    ];

    static_libs = [
        "liblua"
        "libutf"
        "libtflite_static"
        "libz_current"
    ];
};

#  -----------------
#  Generate headers with FlatBuffer schema compiler.
#  -----------------
fbgen = genrule_defaults {
    name = "fbgen";
    tools = ["flatc"];
    #  "depfile" is used here in conjunction with flatc's -M to gather the deps
    cmd = "$(location flatc) --cpp --no-union-value-namespacing --gen-object-api --keep-prefix -I external/libtextclassifier/native -M $(in) >$(depfile) && " +
        "$(location flatc) --cpp --no-union-value-namespacing --gen-object-api --keep-prefix -I external/libtextclassifier/native -o $$(dirname $(out)) $(in)";
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

libtextclassifier_fbgen_annotator_experimental_model = genrule {
    name = "libtextclassifier_fbgen_annotator_experimental_model";
    srcs = ["annotator/experimental/experimental.fbs"];
    out = ["annotator/experimental/experimental_generated.h"];
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

libtextclassifier_fbgen_normalization = genrule {
    name = "libtextclassifier_fbgen_normalization";
    srcs = ["utils/normalization.fbs"];
    out = ["utils/normalization_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_language-tag = genrule {
    name = "libtextclassifier_fbgen_language-tag";
    srcs = ["utils/i18n/language-tag.fbs"];
    out = ["utils/i18n/language-tag_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_person_name_model = genrule {
    name = "libtextclassifier_fbgen_person_name_model";
    srcs = ["annotator/person_name/person_name_model.fbs"];
    out = ["annotator/person_name/person_name_model_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_grammar_dates = genrule {
    name = "libtextclassifier_fbgen_grammar_dates";
    srcs = ["annotator/grammar/dates/dates.fbs"];
    out = ["annotator/grammar/dates/dates_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_timezone_code = genrule {
    name = "libtextclassifier_fbgen_timezone_code";
    srcs = ["annotator/grammar/dates/timezone-code.fbs"];
    out = ["annotator/grammar/dates/timezone-code_generated.h"];
    defaults = ["fbgen"];
};

libtextclassifier_fbgen_grammar_rules = genrule {
    name = "libtextclassifier_fbgen_grammar_rules";
    srcs = ["utils/grammar/rules.fbs"];
    out = ["utils/grammar/rules_generated.h"];
    defaults = ["fbgen"];
};

#  -----------------
#  libtextclassifier
#  -----------------
libtextclassifier = cc_library_shared {
    name = "libtextclassifier";
    defaults = ["libtextclassifier_defaults"];

    srcs = [
        "actions/actions-suggestions.cc"
        "actions/actions_jni.cc"
        "actions/feature-processor.cc"
        "actions/feature-processor_test.cc"
        "actions/grammar-actions.cc"
        "actions/lua-actions.cc"
        "actions/lua-actions_test.cc"
        "actions/lua-ranker.cc"
        "actions/lua-ranker_test.cc"
        "actions/ngram-model.cc"
        "actions/ranker.cc"
        "actions/ranker_test.cc"
        "actions/regex-actions.cc"
        "actions/test-utils.cc"
        "actions/utils.cc"
        "actions/zlib-utils.cc"
        "actions/zlib-utils_test.cc"
        "annotator/annotator.cc"
        "annotator/annotator_jni.cc"
        "annotator/annotator_jni_common.cc"
        "annotator/annotator_jni_test.cc"
        "annotator/cached-features.cc"
        "annotator/cached-features_test.cc"
        "annotator/feature-processor.cc"
        "annotator/model-executor.cc"
        "annotator/quantization.cc"
        "annotator/quantization_test.cc"
        "annotator/strip-unpaired-brackets.cc"
        "annotator/strip-unpaired-brackets_test.cc"
        "annotator/types.cc"
        "annotator/zlib-utils.cc"
        "annotator/zlib-utils_test.cc"
        "annotator/datetime/extractor.cc"
        "annotator/datetime/parser.cc"
        "annotator/datetime/utils.cc"
        "annotator/duration/duration.cc"
        "annotator/duration/duration_test.cc"
        "annotator/grammar/grammar-annotator.cc"
        "annotator/grammar/utils.cc"
        "annotator/grammar/dates/cfg-datetime-annotator.cc"
        "annotator/grammar/dates/extractor.cc"
        "annotator/grammar/dates/parser.cc"
        "annotator/grammar/dates/annotations/annotation-util.cc"
        "annotator/grammar/dates/annotations/annotation-util_test.cc"
        "annotator/grammar/dates/utils/annotation-keys.cc"
        "annotator/grammar/dates/utils/date-match.cc"
        "annotator/grammar/dates/utils/date-match_test.cc"
        "annotator/grammar/dates/utils/date-utils.cc"
        "annotator/number/number.cc"
        "annotator/translate/translate.cc"
        "lang_id/custom-tokenizer.cc"
        "lang_id/lang-id-wrapper.cc"
        "lang_id/lang-id.cc"
        "lang_id/lang-id_jni.cc"
        "lang_id/common/embedding-feature-extractor.cc"
        "lang_id/common/embedding-network-params.cc"
        "lang_id/common/embedding-network.cc"
        "lang_id/common/utf8.cc"
        "lang_id/common/fel/feature-descriptors.cc"
        "lang_id/common/fel/feature-extractor.cc"
        "lang_id/common/fel/fel-parser.cc"
        "lang_id/common/fel/task-context.cc"
        "lang_id/common/fel/workspace.cc"
        "lang_id/common/file/file-utils.cc"
        "lang_id/common/file/mmap.cc"
        "lang_id/common/flatbuffers/embedding-network-params-from-flatbuffer.cc"
        "lang_id/common/flatbuffers/model-utils.cc"
        "lang_id/common/lite_base/compact-logging-raw.cc"
        "lang_id/common/lite_base/compact-logging.cc"
        "lang_id/common/lite_strings/numbers.cc"
        "lang_id/common/lite_strings/str-split.cc"
        "lang_id/common/math/checksum.cc"
        "lang_id/common/math/fastexp.cc"
        "lang_id/common/math/hash.cc"
        "lang_id/common/math/softmax.cc"
        "lang_id/fb_model/lang-id-from-fb.cc"
        "lang_id/fb_model/model-provider-from-fb.cc"
        "lang_id/features/char-ngram-feature.cc"
        "lang_id/features/light-sentence-features.cc"
        "lang_id/features/relevant-script-feature.cc"
        "lang_id/script/approx-script-data.cc"
        "lang_id/script/approx-script.cc"
        "lang_id/script/script-detector.cc"
        "lang_id/script/tiny-script-detector.cc"
        "util/hash/hash.cc"
        "utils/checksum.cc"
        "utils/checksum_test.cc"
        "utils/codepoint-range.cc"
        "utils/flatbuffers.cc"
        "utils/lua-utils.cc"
        "utils/lua-utils_test.cc"
        "utils/normalization.cc"
        "utils/normalization_test.cc"
        "utils/regex-match.cc"
        "utils/regex-match_test.cc"
        "utils/resources.cc"
        "utils/resources_test.cc"
        "utils/tensor-view.cc"
        "utils/tensor-view_test.cc"
        "utils/test-utils.cc"
        "utils/test-utils_test.cc"
        "utils/tflite-model-executor.cc"
        "utils/token-feature-extractor.cc"
        "utils/token-feature-extractor_test.cc"
        "utils/tokenizer.cc"
        "utils/tokenizer_test.cc"
        "utils/variant.cc"
        "utils/variant_test.cc"
        "utils/base/arena.cc"
        "utils/base/arena_leakage_unittest.cc"
        "utils/base/logging.cc"
        "utils/base/logging_raw.cc"
        "utils/base/status.cc"
        "utils/base/status_test.cc"
        "utils/base/statusor_test.cc"
        "utils/calendar/calendar-javaicu.cc"
        "utils/container/double-array-trie.cc"
        "utils/container/sorted-strings-table.cc"
        "utils/container/sorted-strings-table_test.cc"
        "utils/grammar/lexer.cc"
        "utils/grammar/match.cc"
        "utils/grammar/matcher.cc"
        "utils/grammar/rules-utils.cc"
        "utils/grammar/rules-utils_test.cc"
        "utils/grammar/utils/ir.cc"
        "utils/grammar/utils/ir_test.cc"
        "utils/grammar/utils/rules.cc"
        "utils/grammar/utils/rules_test.cc"
        "utils/hash/farmhash.cc"
        "utils/i18n/locale.cc"
        "utils/i18n/locale_test.cc"
        "utils/intents/intent-generator.cc"
        "utils/intents/jni.cc"
        "utils/intents/zlib-utils.cc"
        "utils/java/jni-base.cc"
        "utils/java/jni-cache.cc"
        "utils/java/jni-helper.cc"
        "utils/java/string_utils.cc"
        "utils/math/fastexp.cc"
        "utils/math/softmax.cc"
        "utils/memory/mmap.cc"
        "utils/sentencepiece/encoder.cc"
        "utils/sentencepiece/encoder_test.cc"
        "utils/sentencepiece/normalizer.cc"
        "utils/strings/append.cc"
        "utils/strings/append_test.cc"
        "utils/strings/numbers.cc"
        "utils/strings/numbers_test.cc"
        "utils/strings/split.cc"
        "utils/strings/stringpiece_test.cc"
        "utils/strings/substitute.cc"
        "utils/strings/substitute_test.cc"
        "utils/strings/utf8.cc"
        "utils/strings/utf8_test.cc"
        "utils/tflite/dist_diversification.cc"
        "utils/tflite/encoder_common.cc"
        "utils/tflite/text_encoder.cc"
        "utils/tflite/token_encoder.cc"
        "utils/utf8/unicodetext.cc"
        "utils/utf8/unicodetext_test.cc"
        "utils/utf8/unilib-common.cc"
        "utils/utf8/unilib-javaicu.cc"
        "utils/zlib/zlib.cc"
        "utils/zlib/zlib_regex.cc"
    ];
    exclude_srcs = [
        "actions/feature-processor_test.cc"
        "actions/lua-actions_test.cc"
        "actions/lua-ranker_test.cc"
        "actions/ranker_test.cc"
        "actions/zlib-utils_test.cc"
        "annotator/annotator_jni_test.cc"
        "annotator/cached-features_test.cc"
        "annotator/quantization_test.cc"
        "annotator/strip-unpaired-brackets_test.cc"
        "annotator/zlib-utils_test.cc"
        "annotator/duration/duration_test.cc"
        "annotator/grammar/dates/annotations/annotation-util_test.cc"
        "annotator/grammar/dates/utils/date-match_test.cc"
        "utils/checksum_test.cc"
        "utils/lua-utils_test.cc"
        "utils/normalization_test.cc"
        "utils/regex-match_test.cc"
        "utils/resources_test.cc"
        "utils/tensor-view_test.cc"
        "utils/test-utils_test.cc"
        "utils/token-feature-extractor_test.cc"
        "utils/tokenizer_test.cc"
        "utils/variant_test.cc"
        "utils/base/status_test.cc"
        "utils/base/statusor_test.cc"
        "utils/container/sorted-strings-table_test.cc"
        "utils/grammar/rules-utils_test.cc"
        "utils/grammar/utils/ir_test.cc"
        "utils/grammar/utils/rules_test.cc"
        "utils/i18n/locale_test.cc"
        "utils/sentencepiece/encoder_test.cc"
        "utils/strings/append_test.cc"
        "utils/strings/numbers_test.cc"
        "utils/strings/stringpiece_test.cc"
        "utils/strings/substitute_test.cc"
        "utils/strings/utf8_test.cc"
        "utils/utf8/unicodetext_test.cc"

        "annotator/types-test-util.h"
        "actions/test-utils.cc"
        "actions/test-utils.h"
        "utils/test-utils.cc"
        "utils/test-utils.h"

        "utils/base/arena_leakage_unittest.cc"
    ];

    version_script = "jni.lds";

    apex_available = [
        "//apex_available:platform"
        "com.android.extservices"
    ];
};

#  -----------------------
#  libtextclassifier_tests
#  -----------------------
libtextclassifier_tests = cc_test {
    name = "libtextclassifier_tests";
    defaults = ["libtextclassifier_defaults"];

    test_suites = [
        "device-tests"
        "mts"
    ];

    data = [

    ];

    srcs = [
        "actions/actions-suggestions.cc"
        "actions/actions_jni.cc"
        "actions/feature-processor.cc"
        "actions/feature-processor_test.cc"
        "actions/grammar-actions.cc"
        "actions/lua-actions.cc"
        "actions/lua-actions_test.cc"
        "actions/lua-ranker.cc"
        "actions/lua-ranker_test.cc"
        "actions/ngram-model.cc"
        "actions/ranker.cc"
        "actions/ranker_test.cc"
        "actions/regex-actions.cc"
        "actions/test-utils.cc"
        "actions/utils.cc"
        "actions/zlib-utils.cc"
        "actions/zlib-utils_test.cc"
        "annotator/annotator.cc"
        "annotator/annotator_jni.cc"
        "annotator/annotator_jni_common.cc"
        "annotator/annotator_jni_test.cc"
        "annotator/cached-features.cc"
        "annotator/cached-features_test.cc"
        "annotator/feature-processor.cc"
        "annotator/model-executor.cc"
        "annotator/quantization.cc"
        "annotator/quantization_test.cc"
        "annotator/strip-unpaired-brackets.cc"
        "annotator/strip-unpaired-brackets_test.cc"
        "annotator/types.cc"
        "annotator/zlib-utils.cc"
        "annotator/zlib-utils_test.cc"
        "annotator/datetime/extractor.cc"
        "annotator/datetime/parser.cc"
        "annotator/datetime/utils.cc"
        "annotator/duration/duration.cc"
        "annotator/duration/duration_test.cc"
        "annotator/grammar/grammar-annotator.cc"
        "annotator/grammar/utils.cc"
        "annotator/grammar/dates/cfg-datetime-annotator.cc"
        "annotator/grammar/dates/extractor.cc"
        "annotator/grammar/dates/parser.cc"
        "annotator/grammar/dates/annotations/annotation-util.cc"
        "annotator/grammar/dates/annotations/annotation-util_test.cc"
        "annotator/grammar/dates/utils/annotation-keys.cc"
        "annotator/grammar/dates/utils/date-match.cc"
        "annotator/grammar/dates/utils/date-match_test.cc"
        "annotator/grammar/dates/utils/date-utils.cc"
        "annotator/number/number.cc"
        "annotator/translate/translate.cc"
        "lang_id/custom-tokenizer.cc"
        "lang_id/lang-id-wrapper.cc"
        "lang_id/lang-id.cc"
        "lang_id/lang-id_jni.cc"
        "lang_id/common/embedding-feature-extractor.cc"
        "lang_id/common/embedding-network-params.cc"
        "lang_id/common/embedding-network.cc"
        "lang_id/common/utf8.cc"
        "lang_id/common/fel/feature-descriptors.cc"
        "lang_id/common/fel/feature-extractor.cc"
        "lang_id/common/fel/fel-parser.cc"
        "lang_id/common/fel/task-context.cc"
        "lang_id/common/fel/workspace.cc"
        "lang_id/common/file/file-utils.cc"
        "lang_id/common/file/mmap.cc"
        "lang_id/common/flatbuffers/embedding-network-params-from-flatbuffer.cc"
        "lang_id/common/flatbuffers/model-utils.cc"
        "lang_id/common/lite_base/compact-logging-raw.cc"
        "lang_id/common/lite_base/compact-logging.cc"
        "lang_id/common/lite_strings/numbers.cc"
        "lang_id/common/lite_strings/str-split.cc"
        "lang_id/common/math/checksum.cc"
        "lang_id/common/math/fastexp.cc"
        "lang_id/common/math/hash.cc"
        "lang_id/common/math/softmax.cc"
        "lang_id/fb_model/lang-id-from-fb.cc"
        "lang_id/fb_model/model-provider-from-fb.cc"
        "lang_id/features/char-ngram-feature.cc"
        "lang_id/features/light-sentence-features.cc"
        "lang_id/features/relevant-script-feature.cc"
        "lang_id/script/approx-script-data.cc"
        "lang_id/script/approx-script.cc"
        "lang_id/script/script-detector.cc"
        "lang_id/script/tiny-script-detector.cc"
        "util/hash/hash.cc"
        "utils/checksum.cc"
        "utils/checksum_test.cc"
        "utils/codepoint-range.cc"
        "utils/flatbuffers.cc"
        "utils/lua-utils.cc"
        "utils/lua-utils_test.cc"
        "utils/normalization.cc"
        "utils/normalization_test.cc"
        "utils/regex-match.cc"
        "utils/regex-match_test.cc"
        "utils/resources.cc"
        "utils/resources_test.cc"
        "utils/tensor-view.cc"
        "utils/tensor-view_test.cc"
        "utils/test-utils.cc"
        "utils/test-utils_test.cc"
        "utils/tflite-model-executor.cc"
        "utils/token-feature-extractor.cc"
        "utils/token-feature-extractor_test.cc"
        "utils/tokenizer.cc"
        "utils/tokenizer_test.cc"
        "utils/variant.cc"
        "utils/variant_test.cc"
        "utils/base/arena.cc"
        "utils/base/arena_leakage_unittest.cc"
        "utils/base/logging.cc"
        "utils/base/logging_raw.cc"
        "utils/base/status.cc"
        "utils/base/status_test.cc"
        "utils/base/statusor_test.cc"
        "utils/calendar/calendar-javaicu.cc"
        "utils/container/double-array-trie.cc"
        "utils/container/sorted-strings-table.cc"
        "utils/container/sorted-strings-table_test.cc"
        "utils/grammar/lexer.cc"
        "utils/grammar/match.cc"
        "utils/grammar/matcher.cc"
        "utils/grammar/rules-utils.cc"
        "utils/grammar/rules-utils_test.cc"
        "utils/grammar/utils/ir.cc"
        "utils/grammar/utils/ir_test.cc"
        "utils/grammar/utils/rules.cc"
        "utils/grammar/utils/rules_test.cc"
        "utils/hash/farmhash.cc"
        "utils/i18n/locale.cc"
        "utils/i18n/locale_test.cc"
        "utils/intents/intent-generator.cc"
        "utils/intents/jni.cc"
        "utils/intents/zlib-utils.cc"
        "utils/java/jni-base.cc"
        "utils/java/jni-cache.cc"
        "utils/java/jni-helper.cc"
        "utils/java/string_utils.cc"
        "utils/math/fastexp.cc"
        "utils/math/softmax.cc"
        "utils/memory/mmap.cc"
        "utils/sentencepiece/encoder.cc"
        "utils/sentencepiece/encoder_test.cc"
        "utils/sentencepiece/normalizer.cc"
        "utils/strings/append.cc"
        "utils/strings/append_test.cc"
        "utils/strings/numbers.cc"
        "utils/strings/numbers_test.cc"
        "utils/strings/split.cc"
        "utils/strings/stringpiece_test.cc"
        "utils/strings/substitute.cc"
        "utils/strings/substitute_test.cc"
        "utils/strings/utf8.cc"
        "utils/strings/utf8_test.cc"
        "utils/tflite/dist_diversification.cc"
        "utils/tflite/encoder_common.cc"
        "utils/tflite/text_encoder.cc"
        "utils/tflite/token_encoder.cc"
        "utils/utf8/unicodetext.cc"
        "utils/utf8/unicodetext_test.cc"
        "utils/utf8/unilib-common.cc"
        "utils/utf8/unilib-javaicu.cc"
        "utils/zlib/zlib.cc"
        "utils/zlib/zlib_regex.cc"
    ];

    static_libs = [
        "libgmock_ndk"
        "libgtest_ndk_c++"
    ];

    multilib = {
        lib32 = {
            suffix = "32";
            cppflags = ["-DTC3_TEST_DATA_DIR=\"/data/nativetest/libtextclassifier_tests/test_data/\""];
        };
        lib64 = {
            suffix = "64";
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

in { inherit fbgen libtextclassifier libtextclassifier_actions_suggestions_universal_model libtextclassifier_annotator_en_model libtextclassifier_annotator_universal_model libtextclassifier_defaults libtextclassifier_fbgen_actions-entity-data libtextclassifier_fbgen_actions_model libtextclassifier_fbgen_annotator_experimental_model libtextclassifier_fbgen_annotator_model libtextclassifier_fbgen_codepoint_range libtextclassifier_fbgen_entity-data libtextclassifier_fbgen_flatbuffers libtextclassifier_fbgen_grammar_dates libtextclassifier_fbgen_grammar_rules libtextclassifier_fbgen_intent_config libtextclassifier_fbgen_lang_id_embedded_network libtextclassifier_fbgen_lang_id_model libtextclassifier_fbgen_language-tag libtextclassifier_fbgen_normalization libtextclassifier_fbgen_person_name_model libtextclassifier_fbgen_resources_extra libtextclassifier_fbgen_tflite_text_encoder_config libtextclassifier_fbgen_timezone_code libtextclassifier_fbgen_tokenizer libtextclassifier_fbgen_zlib_buffer libtextclassifier_hash libtextclassifier_hash_defaults libtextclassifier_hash_headers libtextclassifier_hash_static libtextclassifier_lang_id_model libtextclassifier_tests; }
