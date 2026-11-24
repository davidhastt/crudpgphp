<?php
include 'conexion.php';

// Obtener datos del formulario
$nombre    = $_POST['nombre'];
$apaterno  = $_POST['apaterno'];
$amaterno  = $_POST['amaterno'];
$rol       = $_POST['rol'];

// Consulta parametrizada para evitar inyeccion SQL
$sql = "INSERT INTO personas (nombre, apaterno, amaterno, rol)
        VALUES ($1, $2, $3, $4)";

$resultado = pg_query_params(
    $conn,
    $sql,
    [$nombre, $apaterno, $amaterno, $rol]
);

if ($resultado) {
    echo json_encode([
        "success" => true,
        "message" => "Persona registrada correctamente"
    ]);
} else {
    echo json_encode([
        "success" => false,
        "message" => "Error al registrar"
    ]);
}

pg_close($conn);