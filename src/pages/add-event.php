<!DOCTYPE html>
<html lang="en">
    <!--
        Page which contains a form to add a new event.
    -->
    <?php include('../layouts/header.php'); ?>
    <main>
        <!--
            Basic form which uses the query from src/php/event-insert.php and
            the $POST method to send the event data to the database.
        -->
        <form class="add-event-form" method="post" action="../php/event-insert.php">
            <label for="sport">Sport</label>
            <div class="custom-select">
            <!--
                The values represent the foreignkey integer of the table
            -->
            <select class="input-field" name="sport">
                <option value="">Select Sport</option>                
                <option value="1">Football</option>
                <option value="2">Basketball</option>
                <option value="3">Volleyball</option>
            </select>
            </div>

            <label for="competition">Competition</label>
            <div class="custom-select">
            <select class="input-field" name="competition">
                <option value="">Select Competition</option>                
                <option value="2">Champions League Quarter Finals</option>
                <option value="3">NBA League Match</option>
                <option value="4">Volleyball World Championships</option>
            </select>
            </div>

            <label for="venue">Venue</label>
            <div class="custom-select">
            <select class="input-field" name="venue">
                <option value="">Select Venue</option>                
                <option value="1">Santiago Bernabéu</option>
                <option value="2">Wiener Stadthalle</option>
                <option value="3">Stamford Bridge</option>
                <option value="4">Ball Arena</option>
            </select>
            </div>

            <label for="first-team">First Team (Home)</label>
            <div class="custom-select">
            <select class="input-field" name="first_team">
                <option value="">Select Team</option>                
                <option value="1">Chelsea</option>
                <option value="2">Manchester United</option>
                <option value="3">Liverpool</option>
                <option value="4">Los Angeles Lakers</option>
                <option value="5">Miami Heat</option>
                <option value="6">Trail Blazers</option>
                <option value="7">TJ Sokol Wien</option>
                <option value="8">TSV Hartberg</option>
                <option value="9">lSG Union Bisamberg</option>           
                <option value="10">Barcelona</option>
                <option value="11">Real Madrid</option>
                <option value="12">Villarrea</option>
            </select>
            </div>


            <label for="second-team">Second Team (Away)</label>
            <div class="custom-select">
                <select name="second_team">
                    <option value="">Select Team</option>                
                    <option value="1">Chelsea</option>
                    <option value="2">Manchester United</option>
                    <option value="3">Liverpool</option>
                    <option value="4">Los Angeles Lakers</option>
                    <option value="5">Miami Heat</option>
                    <option value="6">Trail Blazers</option>
                    <option value="7">TJ Sokol Wien</option>
                    <option value="8">TSV Hartberg</option>
                    <option value="9">lSG Union Bisamberg</option>           
                    <option value="10">Barcelona</option>
                    <option value="11">Real Madrid</option>
                    <option value="12">Villarrea</option>          
                </select>
            </div>

            <label for="event_date">Event Date</label><br>
            <input id="event_date" type="text" name="event_date" placeholder="YYYY-MM-DD"><br>

            <label for="event_time">Event Time</label><br>
            <input id="event_time" type="text" name="event_time" placeholder="HH:MM:SS"><br>

            <button id="submit-btn">Submit</button>
        </form>
    </main>
    <?php include('../layouts/footer.php'); ?>
</body>
</html>