<?php

// ==========================================================
//  Copyright Reserved Wael Wael Abo Hamza (Course Ecommerce)
// ==========================================================

// date_default_timezone_set("Asia/Damascus");

define("MB", 1048576);

function filterRequest($requestname)
{
    return  htmlspecialchars(strip_tags($_POST[$requestname]));
}

function getAllData($table, $where = null, $values = null, $json = true)
{
    try {
        global $con;
        $data = array();
        if ($where == null) {
            $stmt = $con->prepare("SELECT  * FROM $table   ");
        } else {
            $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
        }
        $stmt->execute($values);
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $count  = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => true, 'message'=> "success", 'data'=> $data));
            } else {
                echo json_encode(array("status" => false, 'message'=> "failure"));
            }
            return $count;
        } else {
            if ($count > 0) {
                return array("status" => true, 'message'=> "success", 'data'=> $data);
            } else {
                return array("status" => false, 'message'=> "failure");
            }
        }
    } catch (PDOException $e) {
        echo $e->getMessage();
    }
}

function getData($table, $where = null, $values = null, $json = true, $response =false)
{
    try {
        global $con;
        $data = array();
        $stmt = $con->prepare("SELECT  * FROM $table WHERE   $where ");
        $stmt->execute($values);
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $count  = $stmt->rowCount();
        if ($json == true) {
            if ($count > 0) {
                echo json_encode(array("status" => true, 'message'=> 'Success', "data" => $data));
            } else {
                echo json_encode(array("status" => false, 'message'=> 'failer', 'errors'=> ['failer'=>['failer !!']]));
            }
        } else {
            return !$response? $count : ['count'=> $count, 'data'=>$data];
        }
    } catch (\Throwable $th) {
        echo $th;
    }
    
}

function insertData($table, $data, $json = true)
{

    global $con;
    foreach ($data as $field => $v)
        $ins[] = ':' . $field;
    $ins = implode(',', $ins);
    $fields = implode(',', array_keys($data));
    $sql = "INSERT INTO $table ($fields) VALUES ($ins)";
    
    $stmt = $con->prepare($sql);
    foreach ($data as $f => $v) {
        $stmt->bindValue(':' . $f, $v);
    }
    try {
        $stmt->execute();
    } catch (\Throwable $th) {
        echo $th;
    }
    
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => true, 'message'=> 'Success'));
        } else {
            echo json_encode(array("status" => false, 'message'=> 'Faile'));
        }
    }
    return $count;
}


function updateData($table, $data, $where, $json = true)
{
    global $con;
    $cols = array();
    $vals = array();

    foreach ($data as $key => $val) {
        $vals[] = "$val";
        $cols[] = "`$key` =  ? ";
    }
    $sql = "UPDATE $table SET " . implode(', ', $cols) . " WHERE $where";

    $stmt = $con->prepare($sql);
    $stmt->execute($vals);
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => true, 'message'=> "success"));
        } else {
            echo json_encode(array("status" => false, 'message'=> "failure"));
        }
    }
    return $count;
}

function deleteData($table, $where, $json = true)
{
    global $con;
    $stmt = $con->prepare("DELETE FROM $table WHERE $where");
    $stmt->execute();
    $count = $stmt->rowCount();
    if ($json == true) {
        if ($count > 0) {
            echo json_encode(array("status" => true, 'message'=> "success"));
        } else {
            echo json_encode(array("status" => false, 'message'=> "failure"));
        }
    }
    return $count;
}

function imageUpload($dir, $imageRequest)
{
    global $msgError;
    if (isset($_FILES[$imageRequest])) {
        $imagename  = rand(1000, 10000) . $_FILES[$imageRequest]['name'];
        $imagetmp   = $_FILES[$imageRequest]['tmp_name'];
        $imagesize  = $_FILES[$imageRequest]['size'];
        $allowExt   = array("jpg", "png", "gif", "mp3", "pdf" , "svg");
        $strToArray = explode(".", $imagename);
        $ext        = end($strToArray);
        $ext        = strtolower($ext);

        if (!empty($imagename) && !in_array($ext, $allowExt)) {
            $msgError = "EXT";
        }
        if ($imagesize > 2 * MB) {
            $msgError = "size";
        }
        if (empty($msgError)) {
            move_uploaded_file($imagetmp,  $dir . "/" . $imagename);
            return $imagename;
        } else {
            return "fail";
        }
    }else {
        return 'empty' ; 
    }
}



function deleteFile($dir, $imagename)
{
    if (file_exists($dir . "/" . $imagename)) {
        unlink($dir . "/" . $imagename);
    }
}

function checkAuthenticate()
{
    if (isset($_SERVER['PHP_AUTH_USER'])  && isset($_SERVER['PHP_AUTH_PW'])) {
        if ($_SERVER['PHP_AUTH_USER'] != "wael" ||  $_SERVER['PHP_AUTH_PW'] != "wael12345") {
            header('WWW-Authenticate: Basic realm="My Realm"');
            header('HTTP/1.0 401 Unauthorized');
            echo 'Page Not Found';
            exit;
        }
    } else {
        exit;
    }

    // End 
}


function   printFailure($errors, $message = "none")
{
    echo     json_encode(array("status" => false, "message" => $message, 'errors'=>$errors));
}
function   printSuccess($message = "none")
{
    echo     json_encode(array("status" => true, "message" => $message));
}

function result($count)
{
    if ($count > 0) {
        printSuccess('Yes, is a valide email ');
    } else {
        printFailure(['email'=>"Email not found !!"], "Email not found !!");
    }
}

function sendEmail($to, $title, $body)
{
    $header = "From: marvel@marvel-inter.online" . "\n";
    mail($to, $title, $body, $header);
}





function sendGCM($title, $message, $topic, $pageid, $pagename)
{


    $url = 'https://fcm.googleapis.com/fcm/send';

    $fields = array(
        "to" => '/topics/' . $topic,
        'priority' => 'high',
        'content_available' => true,

        'notification' => array(
            "body" =>  $message,
            "title" =>  $title,
            "click_action" => "FLUTTER_NOTIFICATION_CLICK",
            "sound" => "default"

        ),
        'data' => array(
            "pageid" => $pageid,
            "pagename" => $pagename
        )

    );


    $fields = json_encode($fields);
    $headers = array(
        'Authorization: key=' . "",
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $fields);

    $result = curl_exec($ch);
    return $result;
    curl_close($ch);
}



function insertNotify($title, $body, $userid, $topic, $pageid, $pagename)
{
    global $con;
    $stmt  = $con->prepare("INSERT INTO `notification`(  `notification_title`, `notification_body`, `notification_userid`) VALUES (? , ? , ?)");
    $stmt->execute(array($title, $body, $userid));
    sendGCM($title,  $body, $topic, $pageid, $pagename);
    $count = $stmt->rowCount();
    return $count;
}

function getViewItemsByCategoryId($userid, $categoryid){
    try {
        global $con;
        $stmt = $con->prepare("SELECT 
        view_itemsview_favorit.*, 
        IFNULL(cart.cart_count, 0) as cart_count 
        from (
        SELECT view_itemsview.*, 1 as favorite FROM view_itemsview 
                INNER JOIN favorite on favorite.favorite_usersId = $userid AND favorite.favorite_itemsId=view_itemsview.items_id
                    AND view_itemsview.categories_id=$categoryid
                UNION ALL  
                SELECT view_itemsview.*, 0 as favorite FROM view_itemsview WHERE view_itemsview.items_id NOT IN (
                SELECT favorite.favorite_itemsId FROM favorite
                ) AND view_itemsview.categories_id=$categoryid
        ) view_itemsview_favorit  
        LEFT JOIN cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id");
        
        $stmt->execute();
        return ['data'=>$stmt->fetchAll(PDO::FETCH_ASSOC), 'count'=>$stmt->rowCount()];
        
    } catch (\Throwable $th) {
        echo $th;
    } 
}

function getViewItemsByUser($userid){
    try {
        global $con;
        $stmt = $con->prepare("SELECT 
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
        LEFT JOIN cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id ");
        
        $stmt->execute();
        return ['data'=>$stmt->fetchAll(PDO::FETCH_ASSOC), 'count'=>$stmt->rowCount()];
        
    } catch (\Throwable $th) {
        echo $th;
    } 
}

function getViewItemsFavoriteByUser($userid){
    try {
        global $con;
        $stmt = $con->prepare("SELECT 
        view_itemsview_favorit.*, 
        IFNULL(cart.cart_count, 0) as cart_count 
        from (
        SELECT view_itemsview.*, 1 as favorite FROM view_itemsview 
                INNER JOIN favorite on favorite.favorite_usersId = $userid AND favorite.favorite_itemsId=view_itemsview.items_id
        ) view_itemsview_favorit 
        LEFT JOIN cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id");
        
        $stmt->execute();
        return ['data'=>$stmt->fetchAll(PDO::FETCH_ASSOC), 'count'=>$stmt->rowCount()];
        
    } catch (\Throwable $th) {
        echo $th;
    } 
}

function getViewItemsCartByUser($userid){
    try {
        global $con;
        $stmt = $con->prepare("SELECT 
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
        RIGHT JOIN cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id ");
        
        $stmt->execute();
        return ['data'=>$stmt->fetchAll(PDO::FETCH_ASSOC), 'count'=>$stmt->rowCount()];
        
    } catch (\Throwable $th) {
        echo $th;
    } 
}


function getViewItemsBySearchByName($userid, $name){
    try {
        global $con;
        $stmt = $con->prepare("SELECT 
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
        LEFT JOIN cart ON cart.cart_usersid=$userid AND cart.cart_itemsid=view_itemsview_favorit.items_id 
        where items_name_ar LIKE '%$name%' OR items_name LIKE '%$name%' 
        ");
        
        $stmt->execute();
        return ['data'=>$stmt->fetchAll(PDO::FETCH_ASSOC), 'count'=>$stmt->rowCount()];
        
    } catch (\Throwable $th) {
        echo $th;
    } 
}