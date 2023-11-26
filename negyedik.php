<?php require_once('config.inc.php');?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>RESTful Service Client</title>
</head>

<body>
    <?php require_once ('header.php'); ?>
    <div class="container d-flex align-items-center flex-column content-container">
    <h1>RESTful Service Client</h1>
    
    <h2>GET Data</h2>
    <button onclick="getData()">Get Data</button>
    <div id="getDataResult"></div>

    <h2>POST Data</h2>
    <button onclick="postData()">Post Data</button>
    <div>
        <label for="postName">Name:</label>
        <input type="text" id="postName" placeholder="Enter Name">
        <label for="postContent">Content:</label>
        <input type="text" id="postContent" placeholder="Enter Content">
        <label for="postLink">Link:</label>
        <input type="text" id="postLink" placeholder="Enter Link">
    </div>
    <div id="postDataResult"></div>

    <h2>PUT Data</h2>
    <button onclick="putData()">Put Data</button>
    <div>
        <label for="putId">ID:</label>
        <input type="text" id="putId" placeholder="Enter ID">
        <label for="putName">Name:</label>
        <input type="text" id="putName" placeholder="Enter Name">
        <label for="putContent">Content:</label>
        <input type="text" id="putContent" placeholder="Enter Content">
        <label for="putLink">Link:</label>
        <input type="text" id="putLink" placeholder="Enter Link">
    </div>
    <div id="putDataResult"></div>

    <h2>DELETE Data</h2>
    <button onclick="deleteData()">Delete Data</button>
    <div>
        <label for="deleteId">ID:</label>
        <input type="text" id="deleteId" placeholder="Enter ID">
    </div>
    <div id="deleteDataResult"></div>
    </div>
    <script>
        function getData() {
            fetch('restful_service.php', { method: 'GET' })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('getDataResult').innerHTML = JSON.stringify(data);
                });
        }

        function postData() {
            const name = document.getElementById('postName').value;
            const content = document.getElementById('postContent').value;
            const link = document.getElementById('postLink').value;

            const data = { name, content, link };

            fetch('restful_service.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams(data)
            })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('postDataResult').innerHTML = JSON.stringify(data);
                });
        }

        function putData() {
            const id = document.getElementById('putId').value;
            const name = document.getElementById('putName').value;
            const content = document.getElementById('putContent').value;
            const link = document.getElementById('putLink').value;

            const data = { id, name, content, link };

            fetch('restful_service.php', {
                method: 'PUT',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams(data)
            })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('putDataResult').innerHTML = JSON.stringify(data);
                });
        }

        function deleteData() {
            const id = document.getElementById('deleteId').value;
            const data = { id };

            fetch('restful_service.php', {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams(data)
            })
                .then(response => response.json())
                .then(data => {
                    document.getElementById('deleteDataResult').innerHTML = JSON.stringify(data);
                });
        }
    </script>
</body>
</html>
