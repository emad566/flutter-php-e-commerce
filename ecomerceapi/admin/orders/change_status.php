<?php

include "../../connect.php";

$orderid = filterRequest("ordersid");

$userid = filterRequest("usersid");
$status = filterRequest("status");

$data = array(
    "orders_status" => $status
);

updateData("orders", $data, "orders_id = $orderid");

// sendGCM("success" , "The Order Has been Under preparing" , "users$userid" , "none" , "/orders"); 

insertNotify("success", "The Order Has been changed to: $status", $userid, "users$userid", "none",  "/orders");
