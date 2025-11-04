<!DOCTYPE html>
<html lang="en">
    <!--
        Page which contains the home page.
        It shows the status of the upcomming game,
        alongside the logo of the two teams and date.
    -->
    <?php include('../layouts/header.php'); ?>
    <main>
        <div class="next-game-status-div">
            <?php include('../php/get-next-status.php'); ?>
        </div>
        <div class="next-teams-div">
            <?php include('../php/get-next-teams.php'); ?>
        </div>
        <div class="next-date-div">
            <?php include('../php/get-next-date.php'); ?>
        </div>

    </main>
    <?php include('../layouts/footer.php'); ?>
</body>
</html>