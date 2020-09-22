{ soong_namespace }:
let

# we are creating the namespace hardware/qcom/sm8150p, hardware/qcom/sm8150p/Android.bp links to this file
_missingName = soong_namespace {
};

in { inherit _missingName; }
