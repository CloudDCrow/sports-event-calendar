<?php
    // Establishes connection to the database

    $db_server = "localhost:3307";
    $db_name = "event_calendar";
    $db_user = " root";
    $db_password = "";
    $conn = "";

    try {
        $conn = mysqli_connect($db_server,
                               $db_user,
                               $db_password,
                               $db_name);
        echo "<script>console.log('Connected to database');</script>";
    } catch (mysqli_sql_exception) {
        echo "<p style='color:red'>Could not establish connection to database</p>";
    }

?>