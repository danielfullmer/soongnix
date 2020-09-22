{ cc_library_headers, genrule, genrule_defaults }:
let

#  Copyright © 2016 Intel Corporation
#  Copyright © 2016 Mauro Rossi <issor.oruam@gmail.com>
#
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and associated documentation files (the "Software"),
#  to deal in the Software without restriction, including without limitation
#  the rights to use, copy, modify, merge, publish, distribute, sublicense,
#  and/or sell copies of the Software, and to permit persons to whom the
#  Software is furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
#  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
#  DEALINGS IN THE SOFTWARE.
#

mesa_genxml_genrule_defaults = genrule_defaults {
    name = "mesa_genxml_genrule_defaults";
    tool_files = ["genxml/gen_pack_header.py"];
    cmd = "python $(location) $(in) >$(out)";
};

mesa_genxml_gen4 = genrule {
    name = "mesa_genxml_gen4";
    srcs = ["genxml/gen4.xml"];
    out = ["genxml/gen4_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen45 = genrule {
    name = "mesa_genxml_gen45";
    srcs = ["genxml/gen45.xml"];
    out = ["genxml/gen45_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen5 = genrule {
    name = "mesa_genxml_gen5";
    srcs = ["genxml/gen5.xml"];
    out = ["genxml/gen5_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen6 = genrule {
    name = "mesa_genxml_gen6";
    srcs = ["genxml/gen6.xml"];
    out = ["genxml/gen6_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen7 = genrule {
    name = "mesa_genxml_gen7";
    srcs = ["genxml/gen7.xml"];
    out = ["genxml/gen7_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen75 = genrule {
    name = "mesa_genxml_gen75";
    srcs = ["genxml/gen75.xml"];
    out = ["genxml/gen75_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen8 = genrule {
    name = "mesa_genxml_gen8";
    srcs = ["genxml/gen8.xml"];
    out = ["genxml/gen8_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen9 = genrule {
    name = "mesa_genxml_gen9";
    srcs = ["genxml/gen9.xml"];
    out = ["genxml/gen9_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen10 = genrule {
    name = "mesa_genxml_gen10";
    srcs = ["genxml/gen10.xml"];
    out = ["genxml/gen10_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

mesa_genxml_gen11 = genrule {
    name = "mesa_genxml_gen11";
    srcs = ["genxml/gen11.xml"];
    out = ["genxml/gen11_pack.h"];
    defaults = ["mesa_genxml_genrule_defaults"];
};

libmesa_genxml = cc_library_headers {
    name = "libmesa_genxml";
    defaults = ["mesa_common_defaults"];
    generated_headers = [
        "mesa_genxml_genX"
        "mesa_genxml_gen4"
        "mesa_genxml_gen45"
        "mesa_genxml_gen5"
        "mesa_genxml_gen6"
        "mesa_genxml_gen7"
        "mesa_genxml_gen75"
        "mesa_genxml_gen8"
        "mesa_genxml_gen9"
        "mesa_genxml_gen10"
        "mesa_genxml_gen11"
    ];
    export_generated_headers = [
        "mesa_genxml_genX"
        "mesa_genxml_gen4"
        "mesa_genxml_gen45"
        "mesa_genxml_gen5"
        "mesa_genxml_gen6"
        "mesa_genxml_gen7"
        "mesa_genxml_gen75"
        "mesa_genxml_gen8"
        "mesa_genxml_gen9"
        "mesa_genxml_gen10"
        "mesa_genxml_gen11"
    ];
    export_include_dirs = ["."];
};

in { inherit libmesa_genxml mesa_genxml_gen10 mesa_genxml_gen11 mesa_genxml_gen4 mesa_genxml_gen45 mesa_genxml_gen5 mesa_genxml_gen6 mesa_genxml_gen7 mesa_genxml_gen75 mesa_genxml_gen8 mesa_genxml_gen9 mesa_genxml_genrule_defaults; }
