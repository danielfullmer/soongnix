{ sh_binary }:
let

#  Checkpointing GC script
checkpoint_gc = sh_binary {
    name = "checkpoint_gc";
    src = "checkpoint_gc.sh";
    vendor = true;
};

in { inherit checkpoint_gc; }
