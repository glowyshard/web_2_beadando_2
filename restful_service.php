<?php
require_once('config.inc.php');

header('Content-Type: application/json');

// Database connection
$conn = new mysqli("localhost", "root","","cuk_db");
if ($conn->connect_error) {
    die('Connect Error (' . $conn->connect_errno . ') ' . $conn->connect_error);
}

// Implement the GET function
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $result = $conn->query("SELECT * FROM menu");
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    echo json_encode($data);
}

// Implement the POST function
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'];
    $content = $_POST['content'];
    $link = $_POST['link'];

    $stmt = $conn->prepare("INSERT INTO menu (name, content, link) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $name, $content, $link);
    if ($stmt->execute()) {
        $id = $conn->insert_id;
        $data = ['id' => $id, 'name' => $name, 'content' => $content, 'link' => $link];
        echo json_encode($data);
    } else {
        echo json_encode(['error' => 'Insert failed']);
    }
}

// Implement the PUT function
if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    parse_str(file_get_contents("php://input"), $_PUT);

    $id = $_PUT['id'];
    $name = $_PUT['name'];
    $content = $_PUT['content'];
    $link = $_PUT['link'];

    $stmt = $conn->prepare("UPDATE menu SET name=?, content=?, link=? WHERE id=?");
    $stmt->bind_param("sssi", $name, $content, $link, $id);
    if ($stmt->execute()) {
        $data = ['id' => $id, 'name' => $name, 'content' => $content, 'link' => $link];
        echo json_encode($data);
    } else {
        echo json_encode(['error' => 'Update failed']);
    }
}

// Implement the DELETE function
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    parse_str(file_get_contents("php://input"), $_DELETE);

    $id = $_DELETE['id'];

    $stmt = $conn->prepare("DELETE FROM menu WHERE id=?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo json_encode(['message' => 'Record deleted successfully']);
    } else {
        echo json_encode(['error' => 'Delete failed']);
    }
}

$conn->close();
?>
