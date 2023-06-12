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

$items = getAllData("view_itemsview_favorite" , null , null , false )  ;

$alldata['items'] = $items ; 


echo json_encode($alldata);
