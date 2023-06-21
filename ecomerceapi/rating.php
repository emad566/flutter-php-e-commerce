<?php

include "./connect.php";

$order_id = filterRequest("order_id");

$rating = filterRequest("rating");

$comment = filterRequest("comment");


$data = array(
    "orders_noterating" =>  $comment,
    "orders_rating" =>  $rating
);

updateData("orders", $data, "orders_id = $order_id ");
