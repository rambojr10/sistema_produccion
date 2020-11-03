<?php 
    require_once '../datos/statements.php';

    session_start();
    echo '<pre>';
    print_r($_SESSION);
    echo '</pre>';

    $result = cajassemanaanterior('EMB-202010');
    echo '<pre>';
    print_r($result);
    echo '</pre>';
    
?>