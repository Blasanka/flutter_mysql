<?php

include("conn.php");

$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

        //A variable $queryResult has a collection of rows which are returned by a query. The size of the collection can be from 0 to n.
$queryResult = $connection->query("INSERT INTO admin (username, email, password) values ('" . $username . "', '" . $email . "', '" . $password . "')");
?>