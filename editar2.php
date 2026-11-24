<?php

include 'conexion.php';

if (isset($_POST['id_persona'])) {
	
	$nombre=$_POST['nombre'];
	$apaterno=$_POST['apaterno'];
	$amaterno=$_POST['amaterno'];
	$rol=$_POST['rol'];
	$id_persona=$_POST['id_persona'];
	

	$sql = "
		UPDATE personas
		SET
			nombre = $1,
			apaterno = $2,
			amaterno = $3,
			rol = $4
		WHERE id_persona = $5
	";

	$resultado = pg_query_params(
		$conn,
		$sql,
		[
			$nombre,
			$apaterno,
			$amaterno,
			$rol,
			$id_persona
		]
	);

	if ($resultado) {
		echo $sql;
		header("Location: editar.php");
		exit;
	} else {
		echo "Error al actualizar";
	}

	pg_close($conn);



} else {
    echo "id_persona no recibido";
}

?>