<?php
$data = json_decode(file_get_contents('php://input'), true);
$command = "echo '". $data['command']  ."' | cec-client -s -d 1";

shell_exec($command);

echo $command;
