<?php

    include("conn.php");

    $email = $_POST['email'];
    //$password = $_POST['password'];

    $queryResult = $connection->
        query("SELECT * FROM users WHERE email ='". $email . "'");// AND password = '". $password . "'

    $result = array();

    while ($fetchdata=$queryResult->fetch_assoc()) {
        $result[] = $fetchdata;
    }

    echo json_encode($result);
?>