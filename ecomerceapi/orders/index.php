<?php 
// -----------------------
try {
    include "../connect.php" ; 

    $orders_usersid = filterRequest("orders_usersid")  ;

    $stmt = $con->prepare("SELECT * FROM orders LEFT JOIN address ON address.address_id = orders.orders_address where orders_usersid=orders_usersid");

    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $count  = $stmt->rowCount();

    if ($count > 0) {
        echo json_encode(array("status" =>true, "message"=> "success", "data" => $data));
    } else {
        echo json_encode(array("status" =>false, "message"=> "failure"));
    }

} catch (\Throwable $th) {
    echo $th;
}

?>
