<?php

header("Content-Type: application/json");
include "../Includes/Connection.php";

$query = "SELECT * FROM Subjects";
$statement = $connection->prepare($query);
$result = $statement->execute();
$fetch = $statement->fetchAll(PDO::FETCH_OBJ);

if(!$fetch)
    http_response_code(400);

echo json_encode($fetch);
?>