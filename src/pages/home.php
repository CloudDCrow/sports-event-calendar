<?php
    include("../connection/connection.php");
?>

<!DOCTYPE html>
<html lang="en">
    <!--
        Page which contains the home page.
        It shows the status of the upcomming game (TBD, in progress, or date),
        alongside the logo of the two teams.
    -->
    <?php include('../layouts/header.php'); ?>
    <main>
        <div class="next-game-status-div">
            <p>TBD</p>
        </div>
        <div class="next-teams-div">
            <label>Team1</label>
            <label id="VS">VS</label>
            <label>Team2</label>
        </div>
    </main>
    <?php include('../layouts/footer.php'); ?>

</body>
</html>