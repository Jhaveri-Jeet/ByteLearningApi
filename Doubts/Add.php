<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$DoubtTitle = $data->DoubtTitle;
$DoubtDescription = $data->DoubtDescription;
$ProfessorId = $data->ProfessorId;
$StudentId = $data->StudentId;
$PlaylistId = $data->PlaylistId;

$query = "INSERT INTO Doubts (DoubtTitle,DoubtDescription,ProfessorId,StudentId,PlaylistId) VALUES(?,?,?,?,?)";
$params = [$DoubtTitle, $DoubtDescription, $ProfessorId, $StudentId, $PlaylistId];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
