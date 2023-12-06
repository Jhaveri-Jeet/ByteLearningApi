<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$jsonString = file_get_contents("php://input");
$data = json_decode($jsonString);

$Name = $data->Name;
$Password = $data->Password;
$About = $data->About;
$Gender = $data->Gender;
$Age = $data->Age;
$Email = $data->Email;
$Education = $data->Education;
$JoiningDate = $data->JoiningDate;
$StudentImageName = $data->StudentImageName;

$query = "INSERT INTO Students (Name,Password,About,Gender,Age,Email,Education,JoiningDate,StudentImageName) VALUES(?,?,?,?,?,?,?,?,?)";
$params = [$Name, $Password, $About, $Gender, $Age, $Email, $Education, $JoiningDate, $StudentImageName];

$statement = $connection->prepare($query);
$result = $statement->execute($params);

if ($result)
    echo json_encode(["success" => true]);
else
    echo json_encode(["success" => false]);
