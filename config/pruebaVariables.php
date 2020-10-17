<?php 

    /* session_start();
    print_r($_SESSION['conectado']); */
    include_once '../datos/statements.php';
    
    $ids = array(
        'id1' => $_GET['id_semana']+0,
        'id2' => ($_GET['id_semana']+1),
        'id3' => (($_GET['id_semana']-1) == 0 ? 10 : ($_GET['id_semana']-1)),
        'id4' => (($_GET['id_semana']-2 == -1 ? 9 : ($_GET['id_semana']-2 == 0 ? 10 : $_GET['id_semana']-2)))
    );

    print_r($ids);

    $datos = cargarcintas($ids);

    echo "<pre>";
    print_r($datos);
    echo "</pre>";
?>