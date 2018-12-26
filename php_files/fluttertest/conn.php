<?php

    $connection = new mysqli("localhost", "root", "", "mysqltest");

    if ($connection) {
        
    } else {
        echo "connection failed!";
        exit();
    }
?>