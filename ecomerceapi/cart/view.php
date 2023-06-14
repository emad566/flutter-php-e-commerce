<?php

try {
    include "../connect.php";
    $userid = filterRequest("usersid");

    
    $reponse= getViewItemsCartByUser($userid);

    if ($reponse['count'] > 0) {
        $items  =["status" => true, "message"=>"success", "data" => $reponse['data']];
    } else {
        $items =["status" => false, "message" => "failure"];
    }
    echo json_encode($items);

} catch (\Throwable $th) {
    echo $th;
}



// echo json_encode(array(
//     "status" => "success",
//     "countprice" =>  $datacountprice,
//     "datacart" => $data,
// ));
