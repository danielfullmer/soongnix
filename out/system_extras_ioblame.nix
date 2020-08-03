{ sh_binary_host }:
let

ioblame = sh_binary_host {
    name = "ioblame";
    src = "ioblame.sh";
    filename_from_src = true;
};

in { inherit ioblame; }
