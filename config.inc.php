<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$loggedInUser = "";

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in']) {
    $loggedInUser = "Logged in: " . $_SESSION['family_name'] . " " . $_SESSION['surname'] . " (" . $_SESSION['login_name'] . ")";
}

// Adatbázis kapcsolat beállítása
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cuk_db"; // Módosítás itt

$conn = new mysqli($servername, $username, $password, $dbname);

// Ellenőrizze a kapcsolatot
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Lekérdezés a link_op táblából
$sql = "SELECT * FROM menu";
$result = $conn->query($sql);

// Menü létrehozása a lekérdezés eredménye alapján
$menu = array();

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $menu[] = array('text' => $row['name'], 'link' => $row['link']);
    }
}

$conn->close();


$loggedInUser = "";

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in']) {
    $loggedInUser = "Logged in: " . $_SESSION['family_name'] . " " . $_SESSION['surname'] . " (" . $_SESSION['login_name'] . ")";
}


if ($loggedInUser !== "") {
    
}

?>
