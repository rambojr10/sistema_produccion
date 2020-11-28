<?php 

    include_once '../datos/statements.php';

    session_start();
    echo "<pre>";
    print_r($_SESSION);
    echo "</pre>";

    $existsRegister = existsCajaAlineada('1010', '80004', 'EMB-20201');
    if (count($existsRegister) > 0)
        print_r($existsRegister);
    else 
        echo "string";
?>