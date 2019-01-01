<?php

    $connection = new mysqli("localhost", "root", "", "mysqltest");

    if (!$connection) {
        echo "connection failed!";
        exit();
    }
?>