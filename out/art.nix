{ package }:
let

#  If you're looking for ART global stuff, please see build/Android.bp.

_missingName = package {
    default_visibility = ["//art:__subpackages__"];
};

in { inherit _missingName; }
