 <?php
include 'conexion.php';


if (isset($_GET['id_persona'])) {
	$id_persona=$_GET['id_persona'];
	$sql = "SELECT * FROM personas WHERE id_persona = $1";
	$resultado = pg_query_params($conn, $sql, [$id_persona]);
	$persona = pg_fetch_assoc($resultado);	
} else {
    echo "id_persona no recibido";
}






?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <titl >Registro de Persona</title>
</head>
<body>

    <h2>Registro de Personas</h2>

    <form action="editar2.php" method="POST">
        <label>id_persona:</label>
        <input type="text" name="id_persona" value="<?= $persona['id_persona'] ?>" required>
        <br><br>	

        <label>Nombre:</label>
        <input type="text" name="nombre" value="<?= $persona['nombre'] ?>" required>
        <br><br>

        <label>Apellido Paterno:</label>
        <input type="text" name="apaterno" value="<?= $persona['apaterno'] ?>" required>
        <br><br>

        <label>Apellido Materno:</label>
        <input type="text" name="amaterno" value="<?= $persona['amaterno'] ?>"  required>
        <br><br>

        <label>Rol:</label>
        <select name="rol" required>
            <option value="<?= $persona['rol'] ?>"><?= $persona['rol'] ?></option>
            <option value="1">Administrador</option>
            <option value="2">Usuario</option>
            <option value="3">Invitado</option>
        </select>
        <br><br>

        <button type="submit">Guardar</button>

    </form>

</body>
</html>