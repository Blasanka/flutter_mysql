<?php

include("conn.php");

    $name = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    //A variable $queryResult has a collection of rows which are returned by a query. The size of the collection can be from 0 to n.
    $queryResult = $connection->
        query("INSERT INTO users (name, email, password) values ('". $username ."', '". $email ."', '". $password ."')");
?>