<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;

$query = "DELETE FROM Professors WHERE Id = ?";
$params = [$Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => false]);

echo json_encode(["success" => true]);
