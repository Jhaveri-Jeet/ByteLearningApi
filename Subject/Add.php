<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Name = $data->Name;
$ImageName = $data->ImageName;

$query = "INSERT INTO Subjects (Name,ImageName) VALUES(?,?)";
$params = [$Name, $ImageName];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
?>