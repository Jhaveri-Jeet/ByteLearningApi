<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$ProfessorId = $data->ProfessorId;
$SubjectId = $data->SubjectId;
$Name = $data->Name;
$Description = $data->Description;
$DateOfPublication = $data->DateOfPublication;

$query = "UPDATE Playlist SET ProfessorId = ?, SubjectId = ?, Name = ?, Description = ?, DateOfPublication = ? WHERE Id = ?";
$params = [$ProfessorId, $SubjectId, $Name, $Description, $DateOfPublication, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if (!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
