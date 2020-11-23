<?php 

    include_once '../datos/statements.php';

    session_start();
    echo "<pre>";
    print_r($_SESSION);
    echo "</pre>";

    function datos_home_user() {
        $result = ['ultimaProduccion' => [], 'rowOne' => [], 'rowTwo' => [], 'rowThree' => [], 'rowFour' => []];

        //Use register
        $ultimaProduccion = buscarultimaproduccion($_SESSION['conectado']->PKIbm)[0];
        $result['ultimaProduccion'] = $ultimaProduccion;

        //rowOne
        $result['rowOne']['historico'] = totalelaboradofinca($_SESSION['conectado']->PKIbm)[0];

        //rowTwo
        $ultimaProgramacion = buscarultimaprogramacion($_SESSION['conectado']->PKIbm)[0];
        $totalProgramado = totalprogramadofinca($ultimaProgramacion->PKCod, $_SESSION['conectado']->PKIbm)[0];
        $result['rowTwo']['ultimaProgramacion']['codigoEmbarque'] = $ultimaProgramacion->PKCod;
        $result['rowTwo']['ultimaProgramacion']['totalProgramado'] = $totalProgramado->Total;
        $result['rowTwo']['ultimaProgramacion']['totalElaborado'] = $ultimaProduccion->Total_CElaboradas;
        
        //rowThree
        $cajasElaboradasUltimaSemana = buscarelaboradosemana($ultimaProduccion->Cod_Embarque, $_SESSION['conectado']->PKIbm);
        foreach ($cajasElaboradasUltimaSemana as $c) {
            $result['rowThree']['cajasElaboradasUltimaSemana'][] = $c->elaboradoDia;
        }
        $nacionalElaboradasDia = [];
        for ($x = 1; $x < 8; $x++) {
            $data = buscarelaboradodianacional($ultimaProduccion->Cod_Embarque, $_SESSION['conectado']->PKIbm, $x)[0]->totalElaborado;
            $nacionalElaboradasDia[] = $data;
        }
        $result['rowThree']['nacionalElaboradasUltimaSemana'] = $nacionalElaboradasDia;

        //rowFour
        $result['rowFour']['ultimaAlineacion'] = veralineacion($ultimaProgramacion->PKCod, $_SESSION['conectado']->PKIbm);

        //Final
        echo "<pre>";
        print_r($result);
        echo "</pre>";
    }

    datos_home_user();
?>