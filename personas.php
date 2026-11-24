<?php

include 'conexion.php';

$sql = "SELECT id_persona, nombre, apaterno, amaterno, rol
        FROM personas
        ORDER BY id_persona";

$resultado = pg_query($conn, $sql);

?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Listado de Personas</title>

    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }

        th, td {
            border: 1px solid #000;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #dddddd;
        }

        h2 {
            text-align: center;
        }
    </style>

</head>
<body>

<h2>Listado de Personas</h2>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido Paterno</th>
            <th>Apellido Materno</th>
            <th>Rol</th>
        </tr>
    </thead>

    <tbody>

        <?php while ($fila = pg_fetch_assoc($resultado)) { ?>

            <tr>
                <td><?php echo $fila['id_persona']; ?></td>
                <td><?php echo $fila['nombre']; ?></td>
                <td><?php echo $fila['apaterno']; ?></td>
                <td><?php echo $fila['amaterno']; ?></td>
                <td><?php echo $fila['rol']; ?></td>
            </tr>

        <?php } ?>

    </tbody>
</table>

</body>
</html>

<?php
pg_close($conn);
?>