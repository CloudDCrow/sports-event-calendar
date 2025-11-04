<?php
    require("../connection/connection.php");

    //Gets the next date from the upcomming game
    $nextdatequery = mysqli_query($conn, "SELECT event_date FROM sport_event");

    if (!$nextdatequery) {
        die("Error: " . mysqli_error($conn));
    }

    $row = mysqli_fetch_assoc($nextdatequery);

    if (isset($row['event_date'])) {
        echo htmlspecialchars($row['event_date']);
    } else {
        echo "Data not found";
    }
?>