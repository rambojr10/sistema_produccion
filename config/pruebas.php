<?php 

    include_once '../datos/statements.php';

    session_start();
    echo "<pre>";
    print_r($_SESSION);
    echo "</pre>";

    $datosProduccion = json_decode($_POST['datosProduccionGuardar']);
    $datosCargue = array();
    foreach ($datosProduccion->tblCargue as $c) {
        if ($c[9] > 0 && $c[0] != null && $c[1] != null && $c[2] != null && $c[10] != null && $c[11] != null) {
            $datosCargue = [
                'ibmFinca' => $_SESSION['conectado']->PKIbm,
                'cliente' => $c[1],
                'fechaCargue' => $c[0],
                'numeroPoma' => $c[2],
                'dedoSuelto' => $c[3],
                'cluster' => $c[4],
                'manoEntera' => $c[5],
                'especial' => $c[6],
                'bolsa20Kilos' => $c[7],
                'bolsa25Kilos' => $c[8],
                'total' => $c[9],
                'placa' => $c[10],
                'conductor' => $c[11],
                'codEmbarque' => $datosProduccion->cod_embarque
            ];
        }
        if ($c[0] == 'CAJAS EN PLATAFORMA' && $c[9] > 0 ) {
            echo 'entró en cajas plataforma y creó esto';
            $dataRow = [$c[3], $c[4], $c[5], $c[6], $c[7], $c[8], $c[9]];
            print_r($dataRow);
            $result = guardarcajasplataforma(1006, $dataRow);
            echo "lo envíó y devolvió";
            echo "<pre>";
            print_r($result);
            echo "</pre>";
        }
       
    }

    echo "aquí va el <br><br>";

    print_r($datosProduccion);
?>