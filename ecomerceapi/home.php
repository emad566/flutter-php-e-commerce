<?php 

include "connect.php" ; 

$alldata = array() ; 

$alldata['status'] = true ; 
$alldata['message'] = 'List Home Data Array' ; 


// $settings = getAllData("settings" , "1 = 1" , null , false )  ;

// $alldata['settings'] = $settings; 

$categories = getAllData("categories" , null , null , false )  ;
$alldata['categories'] = $categories ; 

// $items = getAllData("itemstopselling" , "1 = 1 ORDER BY countitems DESC  " , null , false )  ;

// $alldata['items'] = $items ; 

$userid = filterRequest("usersid");
$sql = "SELECT * FROM (
    SELECT SUM(cart.cart_count) as topSelling , cart.cart_itemsid FROM cart GROUP BY cart.cart_itemsid
    )  topSell
    INNER JOIN (
        SELECT 
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
    ) view_items
    
    ON topSell.cart_itemsid= view_items.items_id
    ORDER BY topSell.topSelling DESC
";

$reponse= applySQL($sql, false);
if ($reponse['count'] > 0) {
    $items  =["status" => true, "message"=>"success", "data" => $reponse['data']];
} else {
    $items =["status" => true, "message" => "failure"];
}

$alldata['items'] = $items ; 


echo json_encode($alldata);
