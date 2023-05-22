<?php 

include "../connect.php" ;

$email  = filterRequest("email") ; 

$verfiy = filterRequest("verifycode") ; 

$stmt = $con->prepare("SELECT * FROM users WHERE users_email = '$email' AND users_verify_code = '$verfiy' ") ; 

try {
    $stmt->execute() ; 

    $count = $stmt->rowCount() ; 

    if ($count > 0) {
    
        $data = array("users_approve" => "1") ; 

        updateData("users" , $data , "users_email = '$email'");

    }else {
        
    printFailure([], "verifycode not Correct") ; 

    }
} catch (\Throwable $th) {
    echo $th;
} 


?>