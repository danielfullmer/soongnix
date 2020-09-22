{ runtime_resource_overlay }:
let

CellBroadcastReceiverRROSample = runtime_resource_overlay {
    name = "CellBroadcastReceiverRROSample";
    product_specific = true;
};

in { inherit CellBroadcastReceiverRROSample; }
