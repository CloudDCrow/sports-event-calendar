<?php
    include("../connection/connection.php");
?>

<!DOCTYPE html>
<html lang="en">
    <!--
        Page which contains a form to add a new event.
    -->
    <?php include('../layouts/header.php'); ?>
    <main>
        <form class="add-event-form">
            <label for="first-team">Team1</label><br>
            <input id="first-team" type="text" name="first-team"><br>

            <label for="first-team">Team2</label><br>
            <input id="first-team" type="text" name="first-team"><br>

            <label for="first-team">Date</label><br>
            <input id="first-team" type="text" name="first-team"><br>
            <button id="submit-btn">Submit</button>
        </form>
    </main>
    <?php include('../layouts/footer.php'); ?>

</body>
</html>