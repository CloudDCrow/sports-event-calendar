<?php
    require("../connection/connection.php");

    if(isset($_POST['sport'], $_POST['competition'], $_POST['venue'], $_POST['first_team'], $_POST['second_team'], $_POST['event_date'], $_POST['event_time']))
    {
        $sport=$_POST['sport'];
        $competition=$_POST['competition'];
        $venue=$_POST['venue'];
        $first_team=$_POST['first_team'];
        $second_team=$_POST['second_team'];
        $event_date=$_POST['event_date'];
        $event_time=$_POST['event_time'];

        try {
            $query = mysqli_query($conn, "INSERT INTO sport_event (sport_season_foreignkey, competition_stage_foreignkey, venue_foreignkey, home_team_foreignkey, away_team_foreignkey, event_date, event_time) VALUES
            ($sport, $competition, $venue, $first_team, $second_team, '$event_date', '$event_time')");
            echo "<p style='color:green'>Event added to database!</p>";
        } catch (mysqli_sql_exception) {
            echo "<p style='color:red'>Could not add to database</p>";
        }
    }
?>