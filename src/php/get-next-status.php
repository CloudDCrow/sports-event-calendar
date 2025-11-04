<?php
    require("../connection/connection.php");
    
    //Gets the status for the next game
    $nextstatusquery = mysqli_query($conn, "SELECT current_status FROM sport_event");

    if (!$nextstatusquery) {
        die("Error: " . mysqli_error($conn));
    }

    $row = mysqli_fetch_assoc($nextstatusquery);

    if (isset($row['current_status'])) {
        echo htmlspecialchars($row['current_status']);
    } else {
        echo "Data not found";
    }
?>