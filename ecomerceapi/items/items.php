<?php

try {
    include "../connect.php";
    $userid = filterRequest("usersid");
    $categoryid = filterRequest("categories_id");

    
    $reponse= getViewItemsByCategoryId($userid, $categoryid);

    if ($reponse['count'] > 0) {
        $items  =["status" => true, "message"=>"success", "data" => $reponse['data']];
    } else {
        $items =["status" => false, "message" => "failure"];
    }
    echo json_encode($items);

} catch (\Throwable $th) {
    echo $th;
}

