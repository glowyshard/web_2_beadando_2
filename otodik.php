<?php

use Com\Tecnick\Pdf\Tcpdf as PdfTcpdf;

require_once('config.inc.php');
require_once('tc-lib-pdf-main/src/tcpdf.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Adatok lekérdezése az űrlapról
    $muCim = $_POST['muCim'];

    // Adatbázis lekérdezés a mű adatainak megszerzéséhez
    $sql = "SELECT * FROM mu WHERE cim = :muCim";
    $stmt = $pdo->prepare($sql);
    $stmt->bindParam(':muCim', $muCim, PDO::PARAM_STR);
    $stmt->execute();
    $muData = $stmt->fetch(PDO::FETCH_ASSOC);

    // PDF létrehozása és letöltése
    createAndDownloadPDF($muData);
}

function createAndDownloadPDF($muData) {
    $pdf = new PdfTcpdf();

    // PDF tartalom létrehozása a kapott adatokkal
    $pdfContent = "Mű címe: {$muData['cim']}\n";
    $pdfContent .= "Alkotó neve: {$muData['nev']}\n";
    $pdfContent .= "Felvonások száma: {$muData['felvonas']}\n";

    $pdf->Set();
    $pdf->SetFont('times', '', 12);
    $pdf->MultiCell(0, 10, $pdfContent);

    $pdfFileName = 'operetta_data.pdf';
    $pdf->Output($pdfFileName, 'D'); // PDF letöltése

    // További kód a letöltés utáni műveletekhez (pl. visszatérés a kezdőoldalra)
    header("Location: index.php");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operetta Harmony</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <?php
    // Dynamically set the base URL using PHP
    $base_url = "http://localhost/web_2_beadando_2-main/";
    echo "<base href=\"$base_url\">";
    ?>
</head>
<body>
    <?php require_once("header.php")?>
    <div class="container d-flex align-items-center flex-column content-container">
        <!-- Űrlap a mű címének megadásához -->
        <h1>Mű adatai</h1>
        <form method="post">
            <label for="muCim">Mű címe:</label>
            <input type="text" name="muCim" id="muCim" required>
            <button type="submit">PDF létrehozása és letöltése</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
