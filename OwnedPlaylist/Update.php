<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$PlaylistId = $data->PlaylistId;
$StudentId = $data->StudentId;

$query = "UPDATE OwnedPlaylist SET PlaylistId = ?, StudentId = ? WHERE Id = ?";
$params = [$PlaylistId, $StudentId, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if (!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
