<?php

include 'conexion.php';

if (isset($_GET['id_persona'])) {

    $id_persona = $_GET['id_persona'];

    $sql = "DELETE FROM personas WHERE id_persona = $1";

    $resultado = pg_query_params(
        $conn,
        $sql,
        [$id_persona]
    );

    if ($resultado) {
        header("Location: borrar.php");
        exit;
    } else {
        echo "Error al eliminar el registro";
    }

} else {
    echo "id_persona no recibido";
}

pg_close($conn);
?>