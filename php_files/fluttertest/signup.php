<?php

    include("conn.php");

    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    //A variable $queryResult has a collection of rows which are returned by a query. The size of the collection can be from 0 to n.
    $queryResult = $connection->
        query("INSERT INTO admin (username, email, password) values ('".$username ."', '". $email ."', '". $password ."')");

    // $result = array();

    // //This line fetch the first element from the collection. If the collection is empty it will return NULL.
    // while ($fetchdata=$queryResult->fetch_assoc()) {
    //     $result[] = $fetchdata;
    // }

    // echo json_encode($result);
    
    // if(! $queryResult ) {
    //    die('Could not enter data: ' . mysql_error());
    // }
  
    // echo "Entered data successfully\n";
    // mysql_close($conn);
?>