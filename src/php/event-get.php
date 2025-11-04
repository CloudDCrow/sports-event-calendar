<?php
    require("../connection/connection.php");

    // Select query which takes all relevant data from the database
    $eventquery =  mysqli_query($conn, "SELECT
                                            sport_event.current_status AS event_status,
                                            sport.icon AS event_sport,
                                            home_team.logo AS home_team,
                                            away_team.logo AS away_team,
                                            competition.name AS competition,
                                            sport_event.event_date AS event_date, 
                                            DATE_FORMAT(sport_event.event_time, '%H:%i') AS event_time
                                        FROM 
                                            sport_event
                                        JOIN
                                            sport_season ON sport_event.sport_season_foreignkey = sport_season.id
                                        JOIN
                                            sport ON sport_season.sport_foreignkey = sport.id
                                        JOIN
                                            team AS away_team ON sport_event.away_team_foreignkey = away_team.id
                                        JOIN
                                            team AS home_team ON sport_event.home_team_foreignkey = home_team.id
                                        JOIN
                                            competition_stage ON sport_event.competition_stage_foreignkey = competition_stage.id
                                        JOIN
                                            competition ON competition_stage.competition_foreignkey = competition.id");
    
    // Goes through each row to return the data from the $eventquery in a
    // table row/table data html form
    while ($row = mysqli_fetch_assoc($eventquery)) {
        echo "<tr>";
        echo "<td>" . htmlspecialchars($row['event_status']) . "</td>";
        echo "<td><img src=" . htmlspecialchars($row['event_sport']) . " width=25vh height=25vh></td>";
        echo "<td><img src=" . htmlspecialchars($row['home_team']) . " width=25vh height=25vh></td>";
        echo "<td><img src=" . htmlspecialchars($row['away_team']) . " width=25vh height=25vh></td>";
        echo "<td>" . htmlspecialchars($row['event_date']) . "</td>";
        echo "<td>" . htmlspecialchars($row['event_time']) . "</td>";
        echo "</tr>";
    }
?>