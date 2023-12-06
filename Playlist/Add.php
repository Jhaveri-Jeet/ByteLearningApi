<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$ProfessorId = $data->ProfessorId;
$SubjectId = $data->SubjectId;
$Name = $data->Name;
$Description = $data->Description;
$DateOfPublication = $data->DateOfPublication;

$query = "INSERT INTO Playlist (ProfessorId,SubjectId,Name,Description,DateOfPublication) VALUES(?,?,?,?,?)";
$params = [$ProfessorId, $SubjectId, $Name, $Description, $DateOfPublication];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
