<?php


try {
    
  include "../connect.php";


  $usersid = filterRequest("usersid");
  $itemsid = filterRequest("itemsid");
  $cart_count = filterRequest("cart_count");
  $data = array(
    "cart_usersid" =>  $usersid,
    "cart_itemsid" =>  $itemsid,
    "cart_count" =>  $cart_count,
  );

  $response = getData("cart", "cart_itemsid = $itemsid AND cart_usersid = $usersid AND cart_orders IS NULL" ,null  , false, true );
  if($cart_count == 0){
    deleteData("cart" , "cart_id  = (SELECT cart_id FROM cart WHERE cart_usersid = $usersid AND cart_itemsid = $itemsid AND cart_orders IS NULL) "); 
  }else if($response['count']>0){
    updateData("cart", $data, "cart_itemsid = $itemsid AND cart_usersid = $usersid AND cart_orders IS NULL");
  }else{
    insertData("cart", $data);
  }
    
} catch (\Throwable $th) {
  //throw $th;
}
