<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$FollowerStudentId = $data->FollowerStudentId;
$FollowingProfessorId = $data->FollowingProfessorId;

$query = "INSERT INTO Followers (FollowerStudentId,FollowingProfessorId) VALUES(?,?)";
$params = [$FollowerStudentId, $FollowingProfessorId];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
