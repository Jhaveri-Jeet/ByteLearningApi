<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$query = "SELECT * FROM Doubts";
$statement = $connection->prepare($query);
$result = $statement->execute();
$fetch = $statement->fetchAll(PDO::FETCH_OBJ);

if (!$fetch)
    echo json_encode(["success" => true]);

echo json_encode($fetch);
