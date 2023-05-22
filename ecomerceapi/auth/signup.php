<?php

include "../connect.php";

$username = filterRequest("username");
$password = sha1($_POST['password']);
$email = filterRequest("email");
$phone = filterRequest("phone");
$verfiycode     = rand(10000 , 99999);


$stmt = $con->prepare("SELECT * FROM users WHERE users_email = ? OR users_phone = ? ");
$stmt->execute(array($email, $phone));
$count = $stmt->rowCount();
if ($count > 0) {
    printFailure(['email'=> ["PHONE OR EMAIL"]], 'PHONE OR EMAIL: ' .$username);
} else {

    $data = array(
        "users_name" => $username,
        "users_password" =>  $password,
        "users_email" => $email,
        "users_phone" => $phone,
        "users_verify_code" => $verfiycode ,
    );
    
    
    try{
        sendEmail($email , " " , "Verfiy Code $verfiycode") ; 
    }catch(Exception $e){
        print("k,kjh,hj,e");
    }
    insertData("users" , $data) ; 

}
