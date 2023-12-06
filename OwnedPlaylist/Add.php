<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$PlaylistId = $data->PlaylistId;
$StudentId = $data->StudentId;

$query = "INSERT INTO OwnedPlaylist (PlaylistId,StudentId) VALUES(?,?)";
$params = [$PlaylistId, $StudentId];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
