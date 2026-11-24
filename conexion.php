<?php

$host = 'localhost';
$port = '5432';
$dbname = 'studiof';
$user = 'postgres';
$password = 'davitzoL';

$conn = pg_connect(
    "host=$host port=$port dbname=$dbname user=$user password=$password"
);

if (!$conn) {
    die("Error de conexión a PostgreSQL");
}

//echo "Conexión exitosa";