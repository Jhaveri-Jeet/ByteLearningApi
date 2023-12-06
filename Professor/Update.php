<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$Name = $data->Name;
$Password = $data->Password;
$About = $data->About;
$Gender = $data->Gender;
$Age = $data->Age;
$Email = $data->Email;
$Education = $data->Education;
$JoiningDate = $data->JoiningDate;
$ProfessorImageName = $data->ProfessorImageName;

$query = "UPDATE Professors SET Name = ?, Password = ?, About = ?, Gender = ?, Age = ?, Email= ?, Education = ?, JoiningDate = ?, ProfessorImageName = ? WHERE Id = ?";
$params = [$Name, $Password, $About, $Gender, $Age, $Email, $Education, $JoiningDate, $ProfessorImageName, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if(!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
