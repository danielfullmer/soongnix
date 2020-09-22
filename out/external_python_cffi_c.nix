{ filegroup, python_library }:
let

py-cffi-backend = python_library {
    name = "py-cffi-backend";
    host_supported = true;
    srcs = [
        "_dummy_file_cffi_backend.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    data = [
        ":py-cffi-backend-files"
    ];
};

py-cffi-backend-files = filegroup {
    name = "py-cffi-backend-files";
    srcs = [
        "_cffi_backend.so"
    ];
};

py-cffi-backend-libffi = python_library {
    name = "py-cffi-backend-libffi";
    host_supported = true;
    srcs = [
        "_dummy_file_libffi.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
    data = [
        ":py-cffi-backend-libffi-files"
    ];
};

py-cffi-backend-libffi-files = filegroup {
    name = "py-cffi-backend-libffi-files";
    srcs = [
        ".libs_cffi_backend/libffi-45372312.so.6.0.4"
    ];
};

in { inherit py-cffi-backend py-cffi-backend-files py-cffi-backend-libffi py-cffi-backend-libffi-files; }
