<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Id = $data->Id;
$FollowerStudentId = $data->FollowerStudentId;
$FollowingProfessorId = $data->FollowingProfessorId;

$query = "UPDATE Followers SET FollowerStudentId = ?, FollowingProfessorId = ? WHERE Id = ?";
$params = [$FollowerStudentId, $FollowingProfessorId, $Id];
$statement = $connection->prepare($query);
$result = $statement->execute($params);

if(!$result)
    http_response_code(400);

echo json_encode(["success" => true]);
?>