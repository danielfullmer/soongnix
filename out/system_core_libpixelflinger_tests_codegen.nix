{ cc_test }:
let

test-opengl-codegen = cc_test {
    name = "test-opengl-codegen";
    defaults = ["pixelflinger-tests"];

    srcs = ["codegen.cpp"];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit test-opengl-codegen; }
