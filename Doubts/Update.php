<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$DoubtTitle = $data->DoubtTitle;
$DoubtDescription = $data->DoubtDescription;
$ProfessorId = $data->ProfessorId;
$StudentId = $data->StudentId;
$PlaylistId = $data->PlaylistId;

$query = "UPDATE Doubts SET DoubtTitle = ?, DoubtDescription = ?, ProfessorId = ?, StudentId = ?, PlaylistId = ? WHERE Id = ?";
$params = [$DoubtTitle, $DoubtDescription, $ProfessorId, $StudentId, $PlaylistId, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if (!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
