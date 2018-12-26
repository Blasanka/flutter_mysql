<?php

    include("conn.php");

    $username = $_POST['username'];
    $password = $_POST['password'];

    $queryResult = $connection->
        query("SELECT * FROM admin WHERE username ='". $username . "' AND password = '". $password . "'");

    $result = array();

    while ($fetchdata=$queryResult->fetch_assoc()) {
        $result[] = $fetchdata;
    }

    echo json_encode($result);
?>