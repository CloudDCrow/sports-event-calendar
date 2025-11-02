<?php
    include("../connection/connection.php");
?>

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
                    <th>Sport</th>
                    <th>Teams</th>
                    <th>Score</th>
                    <th>Competition</th>
                    <th>Time</th>
                </tr>
            </thead>
            <tbody class="calendar-body">
                <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>6</td>
                    <td>7</td>
                    <td>8</td>
                    <td>9</td>
                    <td>10</td>
                </tr>
            </tbody>
        </table>
    </main>

    <?php include('../layouts/footer.php'); ?>

</body>
</html>