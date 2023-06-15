<?php 

try {
    include "connect.php";
    $userid = filterRequest("userid");
    $name = filterRequest("name");

    
    $reponse= getViewItemsBySearchByName($userid, $name);

    if ($reponse['count'] > 0) {
        $items  =["status" => true, "message"=>"success", "data" => $reponse['data']];
    } else {
        $items =["status" => false, "message" => "failure"];
    }
    echo json_encode($items);

} catch (\Throwable $th) {
    echo $th;
}