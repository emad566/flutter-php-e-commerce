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
$reponse= getViewItemsByUser($userid);
if ($reponse['count'] > 0) {
    $items  =["status" => true, "message"=>"success", "data" => $reponse['data']];
} else {
    $items =["status" => true, "message" => "failure"];
    echo json_encode(array());
}
$alldata['items'] = $items ; 


echo json_encode($alldata);
