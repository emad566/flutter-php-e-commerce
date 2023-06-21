<?php 
try {
    include "../connect.php" ; 
    $userid = filterRequest("usersid")  ;

    $sql = "SELECT 
    view_itemsview_favorit.*, 
    IFNULL(cart.cart_count, 0) as cart_count 
    from (
    SELECT view_itemsview.*, 1 as favorite FROM view_itemsview 
            INNER JOIN favorite on favorite.favorite_usersId = $userid AND favorite.favorite_itemsId=view_itemsview.items_id
            UNION ALL 
            SELECT view_itemsview.*, 0 as favorite FROM view_itemsview WHERE view_itemsview.items_id NOT IN (
            SELECT favorite.favorite_itemsId FROM favorite
            ) 
    ) view_itemsview_favorit 
    LEFT JOIN (
        SELECT * from cart WHERE cart_orders IS NULL
    ) cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id
    where view_itemsview_favorit.items_discount <> 0
    ";
// echo $sql;
// exit;
   applySQL($sql);

} catch (\Throwable $th) {
    echo $th;
}
