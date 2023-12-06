<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$PlaylistId = $data->PlaylistId;
$Video = $data->Video;
$Title = $data->Title;
$Description = $data->Description;
$VideoThumbnail = $data->VideoThumbnail;

$query = "INSERT INTO Videos (PlaylistId,Video,TItle,Description,VideoThumbnail) VALUES(?,?,?,?,?)";
$params = [$PlaylistId, $Video, $Title, $Description, $VideoThumbnail];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
