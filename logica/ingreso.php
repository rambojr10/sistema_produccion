<?php
    include "../datos/statements.php";

    if (isset($_POST['op'])) {
        $op = $_POST['op'];
        switch ($op) {
            case 'ingreso':
                ingresar();
                break;
            
            default:
                header("Location:../index.php");
                break;
        }
    }

    function ingresar() {
        $usuario = ingreso($_POST['usuario'], $_POST['password']);
        if (isset($usuario[0]->FKId_TblEstadoUsuario) && $usuario[0]->FKId_TblEstadoUsuario == 1) {
            session_start();
            $_SESSION["conectado"] = $usuario[0];
            header("Location:../capa_web/inicio.php");
        } else {
            header("Location:../index.php");
        }
    }
?>