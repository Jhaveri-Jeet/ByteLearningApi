<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$PlaylistId = $data->PlaylistId;
$Video = $data->Video;
$Title = $data->Title;
$Description = $data->Description;
$VideoThumbnail = $data->VideoThumbnail;

$query = "UPDATE Videos SET PlaylistId = ?, Video = ?, Title = ?, Description = ?, VideoThumbnail = ? WHERE Id = ?";
$params = [$PlaylistId, $Video, $Title, $Description, $VideoThumbnail, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if (!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
