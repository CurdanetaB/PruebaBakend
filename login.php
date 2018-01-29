<?php
if (isset($_GET["salir"])) {
    //ELIMINAR SESION - averiguar
    session_unset();
    session_destroy();

} elseif (isset($_POST["username"],$_POST["password"])) {
    if ($_POST["username"] == "aguacate" && $_POST["password"] == "mafioso") {
        session_start();
        $_SESSION['sesion'] = true;
        session_write_close();
    }
}

header('Location: index.php');