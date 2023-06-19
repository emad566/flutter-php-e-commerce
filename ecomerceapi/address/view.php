<?php 
try {
    include "../connect.php" ; 

    $usersid = filterRequest("usersid"); 

    getAllData("address" , "address_user_id = $usersid ") ; 
} catch (\Throwable $th) {
    echo $th;
}
