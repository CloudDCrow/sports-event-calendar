<?php
    require("../connection/connection.php");

    // Select query which takes all relevant data from the database
    $nextgamequery = mysqli_query($conn, "SELECT 
                                                home_team.logo AS home_team,
                                                away_team.logo AS away_team,
                                                sport_event.event_date AS event_date 
                                        FROM 
                                                sport_event
                                        JOIN
                                                team AS away_team ON sport_event.away_team_foreignkey = away_team.id
                                        JOIN
                                                team AS home_team ON sport_event.home_team_foreignkey = home_team.id");

    //Gets the image paths from the home and away team alongside
    //the VS text
    $row = mysqli_fetch_assoc($nextgamequery);
    echo "<img src=" . htmlspecialchars($row['home_team']) . " width=100vw height=100vh margin-top=10vh>";
    echo "<label id='VS'>VS</label>";          
    echo "<img src=" . htmlspecialchars($row['away_team']) . " width=100vw height=100vh>";
?>