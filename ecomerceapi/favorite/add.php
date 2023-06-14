<?php 

include "../connect.php" ; 


$usersid = filterRequest("usersid") ; 
$itemsid = filterRequest("itemsid") ; 


$data = array(
    "favorite_usersid"  =>   $usersid , 
    "favorite_itemsid"  =>   $itemsid
);

deleteData("favorite" , "favorite_usersid = $usersid AND favorite_itemsid = $itemsid", false) ; 
insertData("favorite" ,$data) ; 
