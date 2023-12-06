<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$StudentId = $data->StudentId;
$ProfessorId = $data->ProfessorId;
$PlaylistId = $data->PlaylistId;
$Rating = $data->Rating;
$Reivew = $data->Reivew;

$query = "INSERT INTO RatingAndReview (StudentId,ProfessorId,PlaylistId,Rating,Review) VALUES(?,?,?,?,?)";
$params = [$StudentId, $ProfessorId, $PlaylistId, $Rating, $Reivew];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
