<?php session_start() ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css" />
    <script src="main.js"></script>
</head>
<body><?php
if (isset($_SESSION['sesion']) && $_SESSION['sesion'] === true) {
    //Mostrar boton de salir
?><FORM action="login.php?salir" method="post">
    <button type="submit">Salir</button>
</FORM><?php
} else {
    $_SESSION['sesion'] = false;
    //Mostrar formulario de acceso
?><FORM action="login.php" method="post">
    <P>
    <INPUT type="text" name="username" placeholder="Usuario"><BR>
    <INPUT type="password" name="password" placeholder="Contraseña"><BR>
    <button type="submit">Acceder</button>
    </P>
 </FORM><?php
}
?></body>
</html>