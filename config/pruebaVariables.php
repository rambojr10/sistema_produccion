<?php 

    /* session_start();
    print_r($_SESSION['conectado']); */
    include_once '../datos/statements.php';

    if (isset($_POST['op']) && $_POST['op'] == 'buscarEmbarque')
?>