<?php
// Include the database connection logic here
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cuk_db";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve alkoto nev data
$alkotoQuery = "SELECT nev FROM alkoto";
$alkotoResult = $conn->query($alkotoQuery);

$alkotoNevArray = [];
while ($row = $alkotoResult->fetch_assoc()) {
    $alkotoNevArray[] = $row['nev'];
}

// Retrieve kapcsolat tipus data
$kapcsolatQuery = "SELECT DISTINCT tipus FROM kapcsolat";
$kapcsolatResult = $conn->query($kapcsolatQuery);

$kapcsolatTipusArray = [];
while ($row = $kapcsolatResult->fetch_assoc()) {
    $kapcsolatTipusArray[] = $row['tipus'];
}

// Retrieve mu szinhaz data
$muQuery = "SELECT DISTINCT szinhaz FROM mu";
$muResult = $conn->query($muQuery);

$muSzinhazArray = [];
while ($row = $muResult->fetch_assoc()) {
    $muSzinhazArray[] = $row['szinhaz'];
}

// Check if the AJAX request is made
if (isset($_POST['alkoto']) && isset($_POST['tipus']) && isset($_POST['szinhaz'])) {
    // Retrieve data based on the posted values
    $alkoto = $_POST['alkoto'];
    $tipus = $_POST['tipus'];
    $szinhaz = $_POST['szinhaz'];

    // Fetch data from the database based on the posted values
    $sql = "SELECT mu.* FROM mu
            JOIN kapcsolat ON mu.id = kapcsolat.muid
            JOIN alkoto ON kapcsolat.alkotoid = alkoto.id
            WHERE alkoto.nev = ? AND kapcsolat.tipus = ? AND mu.szinhaz = ?";
            
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $alkoto, $tipus, $szinhaz);
    $stmt->execute();

    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        // Loop through the result set and display data
        while ($row = $result->fetch_assoc()) {
            echo "Cim: " . $row['cim'] . ", Szinhaz: " . $row['szinhaz'] . ", Ev: " . $row['ev'] . "<br>";
        }
    } else {
        echo "No results found.";
    }

    $stmt->close();
    exit; // Stop further execution after sending the AJAX response
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Task 3 - OperettaHarmony</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI/tZ1iU1pL6L5IYbzA6DP5PzTtuqcWRuA4f4FD4=" crossorigin="anonymous"></script>
</head>
<body>
    <?php require_once("header.php")?>
    <div class="container d-flex align-items-center flex-column content-container">
        <h1>Data Retrieval for Task 3</h1>
        <label for="alkoto">Alkoto:</label>
        <select id="alkoto" name="alkoto">
            <?php foreach ($alkotoNevArray as $alkotoNev): ?>
                <option value="<?php echo $alkotoNev; ?>"><?php echo $alkotoNev; ?></option>
            <?php endforeach; ?>
        </select>
        <label for="tipus">Tipus:</label>
        <select id="tipus" name="tipus">
            <?php foreach ($kapcsolatTipusArray as $kapcsolatTipus): ?>
                <option value="<?php echo $kapcsolatTipus; ?>"><?php echo $kapcsolatTipus; ?></option>
            <?php endforeach; ?>
        </select>
        <label for="szinhaz">Szinhaz:</label>
        <select id="szinhaz" name="szinhaz">
            <?php foreach ($muSzinhazArray as $muSzinhaz): ?>
                <option value="<?php echo $muSzinhaz; ?>"><?php echo $muSzinhaz; ?></option>
            <?php endforeach; ?>
        </select>
        <button onclick="getData()">Get Data</button>
        <div id="result" readonly style="border: 1px solid #ccc; padding: 10px; margin-top: 10px;"></div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

    <script>
    function getData() {
    alert("Button clicked!"); // Add this line for testing
    var alkoto = $('#alkoto').val();
    var tipus = $('#tipus').val();
    var szinhaz = $('#szinhaz').val();

    // Make an AJAX request to get data based on selected values
    $.ajax({
        type: 'POST',
        url: 'harmadik.php',
        data: { alkoto: alkoto, tipus: tipus, szinhaz: szinhaz },
        success: function(response) {
            // Display the result in the readonly div
            $('#result').html(response);
        },
        error: function(error) {
            $('#result').html('Error');
            console.log("AJAX error:", error);
        }
    });
}
</script>

</body>
</html>
