<?php 
try {
    include "../connect.php" ; 
    $orders_id = filterRequest("orders_id")  ;

    $sql = "SELECT * FROM view_itemsview 
        INNER JOIN cart 
        ON view_itemsview.items_id=cart.cart_itemsid AND cart.cart_orders=$orders_id
    ";

   applySQL($sql);

} catch (\Throwable $th) {
    echo $th;
}
