<?php

    // Establishes connection to the database

    $db_server = "localhost";
    $db_name = "event_calendar";
    $db_user = "root";
    $db_password = "";
    $conn = null;

    try {
        $conn = mysqli_connect($db_server,
                               $db_name,
                               $db_user,
                               $db_password);
    } catch(mysqli_sql_exception){
        echo "Connection could not be established.";
    }
    
?>