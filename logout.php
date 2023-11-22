<?php
    session_start();
    session_unset();
    session_destroy();
    header("Location: /web_2_beadando_2-main/fiok.php");
    exit();
?>
