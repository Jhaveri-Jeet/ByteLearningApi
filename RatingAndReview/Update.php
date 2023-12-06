<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$StudentId = $data->StudentId;
$ProfessorId = $data->ProfessorId;
$PlaylistId = $data->PlaylistId;
$Rating = $data->Rating;
$Reivew = $data->Reivew;

$query = "UPDATE RatingAndReview SET StudentId = ?, ProfessorId = ?, PlaylistId = ?, Rating = ?, Review = ? WHERE Id = ?";
$params = [$StudentId, $ProfessorId, $PlaylistId, $Rating, $Reivew, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if (!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
