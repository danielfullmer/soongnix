{ soong_namespace }:
let

# we are creating the namespace hardware/qcom/sdm845, hardware/qcom/sdm845/Android.bp links to this file
_missingName = soong_namespace {
};

in { inherit _missingName; }
