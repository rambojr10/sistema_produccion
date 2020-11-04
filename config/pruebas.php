<?php 

    include_once '../datos/statements.php';

    session_start();
    echo "<pre>";
    print_r(listarusuarios());
    echo "</pre>";

?>