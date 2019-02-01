<?php

session_start();
include 'config.php';

$link = Conectarse();


$usuario = $_POST['Nombre'];

$password = sha1($_POST['password']);



$query = "SELECT * FROM tblusuarios WHERE Nombre = '".$usuario."' AND Password = '".$password."'";

$result = mysql_query($query, $link);


$num_rows = mysql_num_rows($result);

echo $num_rows;
if($result){ 
	if($num_rows > 0) 
	{
		$_SESSION['user'] = $usuario;
		header("Location: inicio.php");
	} else {
		header("Location: index.php?error=si");
	}
}

mysql_close($link);

?>