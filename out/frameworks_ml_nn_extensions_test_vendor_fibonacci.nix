{ cc_library_headers }:
let

neuralnetworks_test_vendor_fibonacci_extension = cc_library_headers {
    name = "neuralnetworks_test_vendor_fibonacci_extension";
    host_supported = false;
    vendor_available = true;
    export_include_dirs = ["."];
};

in { inherit neuralnetworks_test_vendor_fibonacci_extension; }
