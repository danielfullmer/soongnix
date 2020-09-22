{ cc_binary_host, cc_library_static, genrule }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

libneuralnetworks_fuzzer_proto = cc_library_static {
    name = "libneuralnetworks_fuzzer_proto";
    owner = "google";
    srcs = ["Model.proto"];
    proto = {
        type = "full";
        export_proto_headers = true;
    };
    shared_libs = ["libprotobuf-cpp-full"];
};

#  The following host binary is disabled because the genrule that uses this
#  binary (below) is disabled and because this binary is 300MB large currently.
libneuralnetworks_fuzzer_generate_corpus = cc_binary_host {
    name = "libneuralnetworks_fuzzer_generate_corpus";
    enabled = false;
    owner = "google";
    srcs = [
        "GenerateCorpus.cpp"
        "StaticAssert.cpp"
    ];
    shared_libs = ["libprotobuf-cpp-full"];
    static_libs = [
        "libneuralnetworks_fuzzer_proto"
        "libneuralnetworks_generated_test_harness"
    ];
    whole_static_libs = [
        "neuralnetworks_generated_V1_0_example"
        "neuralnetworks_generated_V1_1_example"
        "neuralnetworks_generated_V1_2_example"
        "neuralnetworks_generated_V1_3_example"
    ];
};

#  This genrule generates a zip file of 5000+ test cases from the NNAPI test
#  generator. It has been disabled for the time being because cc_fuzz is
#  currently not able to accept a zip file as a fuzzer seed corpus.
#  Alternatively, gensrcs could be used to generate each test case individually;
#  however, the corpus only seems to be able to accept ~500 files.
libneuralnetworks_fuzzer_seed_corpus = genrule {
    name = "libneuralnetworks_fuzzer_seed_corpus";
    enabled = false;
    tools = [
        "libneuralnetworks_fuzzer_generate_corpus"
        "soong_zip"
    ];
    out = ["libneuralnetworks_fuzzer_seed_corpus.zip"];
    cmd = "mkdir $(genDir)/corpus && " +
        "$(location libneuralnetworks_fuzzer_generate_corpus) $(genDir)/corpus && " +
        "$(location soong_zip) -o $(out) -C $(genDir)/corpus -D $(genDir)/corpus";
};

in { inherit libneuralnetworks_fuzzer_generate_corpus libneuralnetworks_fuzzer_proto libneuralnetworks_fuzzer_seed_corpus; }
