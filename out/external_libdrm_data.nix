{ prebuilt_etc }:
let

"amdgpu.ids" = prebuilt_etc {
    name = "amdgpu.ids";
    proprietary = true;
    sub_dir = "hwdata";
    src = "amdgpu.ids";
};

in { inherit "amdgpu.ids"; }
