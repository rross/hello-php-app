<?php

error_reporting(E_ALL);
ini_set('display_errors',1);

echo "Hello world!<br>";

phpinfo();

$stderr = fopen('php://stderr','w');
fwrite($stderr,'This line is when writing to stderr. Application errors here.' . PHP_EOL);

$stdout = fopen('php://stdout','w');
fwrite($stdout,'This line is when writing to stdout. Application info here.' . PHP_EOL);
fclose($stdout);
fclose($stderr);

?>

