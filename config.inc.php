<?php
$menu = array(
    array('text' => 'Home', 'link' => '/web_2_beadando_2-main/index.php'),

);

if (session_status() == PHP_SESSION_NONE) {
    
    session_start();
}

$loggedInUser = "";

if (isset($_SESSION['logged_in']) && $_SESSION['logged_in']) {
    $loggedInUser = "Logged in: " . $_SESSION['family_name'] . " " . $_SESSION['surname'] . " (" . $_SESSION['login_name'] . ")";
}


if ($loggedInUser !== "") {
    
}

?>
