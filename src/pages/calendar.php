<!DOCTYPE html>
<html lang="en">
    <!--
        Page which contains the event calendar.
    -->
    <?php include('../layouts/header.php'); ?>

    <main>
        <table class="calendar-table">
            <thead class="calendar-head">
                <tr>
                    <th>Status</th>
                    <th>Sport</th>
                    <th>Home Team</th>
                    <th>Away Team</th>
                    <th>Date</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody class="calendar-body">
                <?php include('../php/event-get.php'); ?>
            </tbody>
        </table>
    </main>

    <?php include('../layouts/footer.php'); ?>
</body>
</html>