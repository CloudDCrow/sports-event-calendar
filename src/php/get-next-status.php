<?php
    require("../connection/connection.php");
    
    //Gets the status for the next game
    $nextstatusquery = mysqli_query($conn, "SELECT current_status FROM sport_event");

    $row = mysqli_fetch_assoc($nextstatusquery);
    echo htmlspecialchars($row['current_status']);
?>