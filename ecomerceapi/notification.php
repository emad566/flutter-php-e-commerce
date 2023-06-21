<?php 

include "./connect.php"  ;

$userid = filterRequest("usersid") ; 

getAllData("notification"  , "notification_userid = $userid") ; 


?>