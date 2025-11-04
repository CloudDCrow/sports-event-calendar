<?php
    require("../connection/connection.php");

    //Gets the next date from the upcomming game
    $nextdatequery = mysqli_query($conn, "SELECT event_date FROM sport_event");

    $row = mysqli_fetch_assoc($nextdatequery);
    echo htmlspecialchars($row['event_date']);
?>