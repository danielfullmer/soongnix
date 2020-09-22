{ cc_fuzz }:
let

example_fuzzer = cc_fuzz {
    name = "example_fuzzer";
    srcs = [
        "example_fuzzer.cpp"
    ];
    host_supported = true;

    #  The advanced features below allow you to package your corpus and
    #  dictionary files during building. You can find more information about
    #  these features at:
    #   - Corpus: https://llvm.org/docs/LibFuzzer.html#corpus
    #   - Dictionaries: https://llvm.org/docs/LibFuzzer.html#dictionaries
    #  These features are not required for fuzzing, but are highly recommended
    #  to gain extra coverage.
    corpus = ["corpus/*"];
    dictionary = "example_fuzzer.dict";
    fuzz_config = {
        fuzz_on_haiku_device = false;
        fuzz_on_haiku_host = false;
    };
};

in { inherit example_fuzzer; }
