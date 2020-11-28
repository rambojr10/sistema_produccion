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
        if (isset($usuario->FKId_TblEstadoUsuario) && $usuario->FKId_TblEstadoUsuario == 1) {
            session_start();
            $_SESSION["conectado"] = $usuario;
            header("Location:../capa_web/inicio.php");
        } else {
            header("Location:../index.php");
        }
    }
?>