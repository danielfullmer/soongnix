{ filegroup }:
let

CtsVerifierMockVrListenerServiceFiles = filegroup {
    name = "CtsVerifierMockVrListenerServiceFiles";
    srcs = ["src/com/android/cts/verifier/vr/MockVrListenerService.java"];
};

in { inherit CtsVerifierMockVrListenerServiceFiles; }
