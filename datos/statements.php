<?php
    require_once 'sqlserver-connection.php';
    //Orden crud
    
// Sentencias de creación =========================================================================================

    function nuevafinca($datos_c, $lotes){
        $ibm = $datos_c['ibm'];
        $nombre = $datos_c['nombre'];
        $neta = $datos_c['neta'];
        $bruta = $datos_c['bruta'];
        $bruta = $datos_c['bruta'];
        $empresa = $datos_c['empresa'];
        try {
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblfincas VALUES(:ibm, :nombre, :neta, :bruta, :empresa);");
            $datos->bindParam(":ibm", $ibm, PDO::PARAM_STR);
            $datos->bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $datos->bindParam(":neta", $neta, PDO::PARAM_STR);
            $datos->bindParam(":bruta", $bruta, PDO::PARAM_STR);
            $datos->bindParam(":empresa", $empresa, PDO::PARAM_STR);
            if ($datos->execute()) {
                foreach ($lotes as $l) {
                    $nom_l = $l[0];
                    $neta_l = $l[1];
                    $bruta_l = $l[2];
                    $ibm = $datos_c['ibm'];
                    $datos = $bd->prepare("
                        INSERT INTO tbllotes (Lote, Area_Neta, Area_Bruta, FKIbm_TblFincas) 
                        VALUES(:nom, :neta, :bruta, :ibm);
                    ");
                    $datos->bindParam(":nom", $nom_l, PDO::PARAM_STR);
                    $datos->bindParam(":neta", $neta_l, PDO::PARAM_STR);
                    $datos->bindParam(":bruta", $bruta_l, PDO::PARAM_STR);
                    $datos->bindParam(":ibm", $ibm, PDO::PARAM_STR);
                    $datos->execute();
                }
                return true;
            } else {
                return false;
            }
        }catch (Exception $e) {
            echo "Error".$e;
        }
    }

    function guardarnuevolote($nameLote, $areaNeta, $areaBruta, $ibmFinca) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                INSERT INTO tbllotes (Lote, Area_Neta, Area_Bruta, FKIbm_TblFincas) 
                VALUES(:nameLote, :areaNeta, :areaBruta, :ibmFinca);
            ");
            $datos->bindParam(':nameLote', $nameLote, PDO::PARAM_STR);
            $datos->bindParam(':areaNeta', $areaNeta, PDO::PARAM_STR);
            $datos->bindParam(':areaBruta', $areaBruta, PDO::PARAM_STR);
            $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
            if ($datos->execute())
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo 'Error'.$e;
        }
    }

    function nuevaempresa($empresa){
        try {
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblempresas VALUES(:nit, :nombre, :direccion, :telefono)");
            $datos->bindParam(":nit", $empresa['nit'], PDO::PARAM_STR);
            $datos->bindParam(":nombre", $empresa['nom'], PDO::PARAM_STR);
            $datos->bindParam(":direccion", $empresa['dir'], PDO::PARAM_STR);
            $datos->bindParam(":telefono", $empresa['tel'], PDO::PARAM_STR);
            if ($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    function guardarcaja($caja){
        try {
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblcajasproduccion VALUES(:codigo, :descripcion, :factor, :tipofruta)");
            $datos->bindParam(":codigo", $caja['codigo'], PDO::PARAM_STR);
            $datos->bindParam(":descripcion", $caja['descripcion'], PDO::PARAM_STR);
            $datos->bindParam(":factor", $caja['factor'], PDO::PARAM_STR);
            $datos->bindParam(":tipofruta", $caja['tipofruta'], PDO::PARAM_INT);
            if ($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    function crearembarque($cod_embarque, $ano, $semana){
        try {
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblembarque VALUES(:cod_embarque, :semana, :ano)");
            $datos->bindParam(":cod_embarque", $cod_embarque, PDO::PARAM_STR);
            $datos->bindParam(":semana", $semana, PDO::PARAM_INT);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            if ($datos->execute())
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    //Genera semanas según el año siguiente, recibe la fecha de la primera semana del año próximo y empieza a generar los datos a partír de la primera inserción
    function anhonuevo($fechai, $fechaf, $anho, $cinta){
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                INSERT INTO tblsemanas (N_Semana, Fecha_Inicio, Fecha_Fin, Anho, FKId_TblCintas) 
                VALUES('SEMANA 1', :fechai, :fechaf, :anho, :cinta);"
            );
            $datos->bindParam(":fechai", $fechai, PDO::PARAM_STR);
            $datos->bindParam(":fechaf", $fechaf, PDO::PARAM_STR);
            $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
            $datos->bindParam(":cinta", $cinta, PDO::PARAM_INT);
            if ($datos->execute()) {
                for ($x=2; $x < 53; $x++) { 
                    $datos = $bd->prepare("
                        SELECT  Fecha_Inicio as fechai, 
                                Fecha_Fin as fechaf, 
                                FKId_TblCintas as cinta 
                        FROM tblsemanas WHERE N_Semana = 'SEMANA ".($x-1)."' AND Anho = :anho
                    ");
                    $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
                    if ($datos->execute()){
                        $ultima_semana = $datos->fetch(PDO::FETCH_OBJ);
                        if ($ultima_semana->cinta == 10) {
                        	$ultima_semana->cinta = 0;
                        }
                        $fechaInicioInsert = date('Y-m-d', strtotime($ultima_semana->fechai.'+ 1 week'));
                        $fechaFinalInsert = date('Y-m-d', strtotime($ultima_semana->fechaf.'+ 1 week'));
                        $cintaInsert = $ultima_semana->cinta+1;
                        $datos = $bd->prepare("
                            INSERT INTO tblsemanas (N_Semana, Fecha_Inicio, Fecha_Fin, Anho, FKId_TblCintas)
                            VALUES('SEMANA ".$x."', :fechai, :fechaf, :anho, :cinta);
                        ");
                        $datos->bindParam(":fechai", $fechaInicioInsert, PDO::PARAM_STR);
                        $datos->bindParam(":fechaf", $fechaFinalInsert, PDO::PARAM_STR);
                        $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
                        $datos->bindParam(":cinta", $cintaInsert, PDO::PARAM_INT);
                        $datos->execute();
                    } else {
                        return false;
                    }
                }
                $datos = $bd->prepare("INSERT INTO tblregistrosemanas (Anho_generado) VALUES (:anho);");
                $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
                if ($datos->execute())
                    return true;
                else 
                    return false;
            } else {
                return false;
            }
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    //Guardar programacion
    function guardarprogramacion($cod_embarque, $ibm_finca, $codigo_caja, $cantidad) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                INSERT INTO tbldet_tblembarque (FKCod_TblEmbarque, FKIbm_TblFincas, FKCodigo_TblCajasProduccion, Cantidad)
                VALUES(:codigo_embarque, :ibm_finca, :codigo_caja, :cantidad);
            ");
            $datos->bindParam(":codigo_embarque", $cod_embarque, PDO::PARAM_STR);
            $datos->bindParam(":ibm_finca", $ibm_finca, PDO::PARAM_STR);
            $datos->bindParam(":codigo_caja", $codigo_caja, PDO::PARAM_STR);
            $datos->bindParam(":cantidad", $cantidad, PDO::PARAM_INT);
            if($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }
    
    //Guardar estimativo
    function guardarestimativo($finca, $premiun, $especial, $cod_embarque) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                INSERT INTO tblestimativo (Finca, Premiun, Especial, FKCod_TblEmbarque)
                VALUES(:finca, :premiun, :especial, :cod_embarque);
            ");
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->bindParam(":premiun", $premiun, PDO::PARAM_INT);
            $datos->bindParam(":especial", $especial, PDO::PARAM_INT);
            $datos->bindParam(":cod_embarque", $cod_embarque, PDO::PARAM_STR);
            if($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    // Funciones que guardan los datos del módulo ingresar produccion, llenando todas las tablas 

        // Guarda los datos del embolse de la semana
        function guardarembolse($id_semana, $presente, $prematuro) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblEmbolse (FKId_TblSemanas, N_PlantasPresente, N_PlantasPrematuro)
                    VALUES(:id_semana, :presente, :prematuro);
                ");
                $datos->bindParam(':id_semana', $id_semana, PDO::PARAM_INT);
                $datos->bindParam(':presente', $presente, PDO::PARAM_INT);
                $datos->bindParam(':prematuro', $prematuro, PDO::PARAM_INT);
                if ($datos->execute())
                    return $bd->lastInsertId();
                else 
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guarda los datos del total de racimos cortados y rechazados durante la semana
        function guardarracimos($id_semana, $totalRacimosCortados, $totalRacimosRechazados) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblRacimos (FKId_TblSemanas, N_RacimosC, N_RacimosR)
                    VALUES(:id_semana, :totalRacimosCortados, :totalRacimosRechazados);
                ");
                $datos->bindParam(':id_semana', $id_semana, PDO::PARAM_INT);
                $datos->bindParam(':totalRacimosCortados', $totalRacimosCortados, PDO::PARAM_INT);
                $datos->bindParam(':totalRacimosRechazados', $totalRacimosRechazados, PDO::PARAM_INT);
                if  ($datos->execute()) 
                    return $bd->lastInsertId();
                else
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar detalle racimos
        function guardarracimos_detalle(
            $lastIdRacimos, $idTblDias, $racimosCortadosDia, $racimosRechazadosDia, 
            $totalPersonasEmbarque, $totalPersonasOtrasFincas ) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblDet_TblRacimos_TblDias (FKId_TblRacimos, FKId_TblDias, N_RacimosC_Dia, N_RacimosR_Dia, Total_PEmbarque, Total_POtrasFincas)
                    VALUES(:lastIdRacimos, :idTblDias, :racimosCortadosDia, :racimosRechazadosDia, 
                    :totalPersonasEmbarque, :totalPersonasOtrasFincas);
                ");
                $datos->bindParam(":lastIdRacimos", $lastIdRacimos, PDO::PARAM_INT);
                $datos->bindParam(":idTblDias", $idTblDias, PDO::PARAM_INT);
                $datos->bindParam(":racimosCortadosDia", $racimosCortadosDia, PDO::PARAM_INT);
                $datos->bindParam(":racimosRechazadosDia", $racimosRechazadosDia, PDO::PARAM_INT);
                $datos->bindParam(":totalPersonasEmbarque", $totalPersonasEmbarque, PDO::PARAM_INT);
                $datos->bindParam(":totalPersonasOtrasFincas", $totalPersonasOtrasFincas, PDO::PARAM_INT);
                if ($datos->execute())
                    return $bd->lastInsertId();
                else 
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar detalle - detalle racimos
        function guardarracimos_detalle_detalle($idRacimosDetalle, $idCinta, $racimosCortadosCinta) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblDet_TblDet_TblRacimos_TblDias (FKId_TblDet_TblRacimos_TblDias, FKId_TblCintas, N_RacimosC_Cintas)
                    VALUES(:idRacimosDetalle, :idCinta, :racimosCortadosCinta);
                ");
                $datos->bindParam(":idRacimosDetalle", $idRacimosDetalle, PDO::PARAM_INT);
                $datos->bindParam(":idCinta", $idCinta, PDO::PARAM_INT);
                $datos->bindParam(":racimosCortadosCinta", $racimosCortadosCinta, PDO::PARAM_INT);
                $datos->execute();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar mercado nacional
        function guardarnacional($totalElaborado) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("INSERT INTO TblMercadoNacional (Total_Elaborado) VALUES(:totalElaborado)");
                $datos->bindParam(':totalElaborado', $totalElaborado, PDO::PARAM_INT);
                if ($datos->execute()) 
                    return $bd->lastInsertId();
                else 
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }

        }

        // Guardar detalle mercado nacional
        function guardarnacional_detalle($idNacional, $idTblDias, $idCajasNacional, $cantidadElaborado) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblDet_TblMercadoNacional (FKId_TblMercadoNacional, FKId_TblDias, FKId_TblCajasMercadoNacional, Cantidad_Elaborado)
                    VALUES(:idNacional, :idTblDias, :idCajasNacional, :cantidadElaborado);
                ");
                $datos->bindParam(':idNacional', $idNacional, PDO::PARAM_INT);
                $datos->bindParam(':idTblDias', $idTblDias, PDO::PARAM_INT);
                $datos->bindParam(':idCajasNacional', $idCajasNacional, PDO::PARAM_INT);
                $datos->bindParam(':cantidadElaborado', $cantidadElaborado, PDO::PARAM_INT);
                $datos->execute();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar tblcargue
        function guardarcargue($datosCargue) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO TblCargue (FKIbm_TblFincas, Cliente, Fecha_Cargue, N_Poma, DedoSuelto, Cluster, ManoEntera, Especial, Bolsa20Kilos, Bolsa25Kilos, Total, Placa_Vehiculo, Conductor, FKCod_TblEmbarque)
                    VALUES(:ibmFinca, :cliente, :fechaCargue, :numeroPoma, :dedoSuelto, :cluster, :manoEntera, :especial, 
                    :bolsa20Kilos, :bolsa25Kilos, :total, :placa, :conductor, :codEmbarque);
                ");
                $datos->bindParam(':ibmFinca', $datosCargue['ibmFinca'], PDO::PARAM_STR);
                $datos->bindParam(':cliente', $datosCargue['cliente'], PDO::PARAM_STR);
                $datos->bindParam(':fechaCargue', $datosCargue['fechaCargue'], PDO::PARAM_STR);
                $datos->bindParam(':numeroPoma', $datosCargue['numeroPoma'], PDO::PARAM_STR);
                $datos->bindParam(':dedoSuelto', $datosCargue['dedoSuelto'], PDO::PARAM_INT);
                $datos->bindParam(':cluster', $datosCargue['cluster'], PDO::PARAM_INT);
                $datos->bindParam(':manoEntera', $datosCargue['manoEntera'], PDO::PARAM_INT);
                $datos->bindParam(':especial', $datosCargue['especial'], PDO::PARAM_INT);
                $datos->bindParam(':bolsa20Kilos', $datosCargue['bolsa20Kilos'], PDO::PARAM_INT);
                $datos->bindParam(':bolsa25Kilos', $datosCargue['bolsa25Kilos'], PDO::PARAM_INT);
                $datos->bindParam(':total', $datosCargue['total'], PDO::PARAM_INT);
                $datos->bindParam(':placa', $datosCargue['placa'], PDO::PARAM_STR);
                $datos->bindParam(':conductor', $datosCargue['conductor'], PDO::PARAM_STR);
                $datos->bindParam(':codEmbarque', $datosCargue['codEmbarque'], PDO::PARAM_STR);
                $datos->execute();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        function guardarcajasplataforma($idNacional, $dataRow) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO tblcajasplataforma (FKId_TblMercadoNacional, DedoSuelto, Cluster, ManoEntera, Especial, Bolsa20Kilos, Bolsa25Kilos, Total) 
                    VALUES (:idNacional, :dedoSuelto, :cluster, :manoEntera, :especial, :bolsa20, :bolsa25, :total); 
                ");
                $datos->bindParam(':idNacional', $idNacional, PDO::PARAM_INT);
                $datos->bindParam(':dedoSuelto', $dataRow[0], PDO::PARAM_INT);
                $datos->bindParam(':cluster', $dataRow[1], PDO::PARAM_INT);
                $datos->bindParam(':manoEntera', $dataRow[2], PDO::PARAM_INT);
                $datos->bindParam(':especial', $dataRow[3], PDO::PARAM_INT);
                $datos->bindParam(':bolsa20', $dataRow[4], PDO::PARAM_INT);
                $datos->bindParam(':bolsa25', $dataRow[5], PDO::PARAM_INT);
                $datos->bindParam(':total', $dataRow[6], PDO::PARAM_INT);
                $datos->execute();
                return $bd->lastInsertId();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar tblproduccion
        function guardarproduccion(
            $ibmFinca, $idEmbolse, $idRacimos, $idSemana, $idNacional, $codEmbarque, $totalCajasElaboradas, $totalCajasRechazadas, 
            $totalCajasExportadas, $ratio, $merma, $pesoRacimos, $areaRecorrida, $pesoVastago, $anhoProduccion, $frutaPiso) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("INSERT INTO tblproduccion (FKIbm_TblFincas, FKId_TblEmbolse, FKId_TblRacimos, FKId_TblSemanas, FKId_TblMercadoNacional, Cod_Embarque, Total_CElaboradas, Total_CREchazadas, Total_CExportadas, Ratio, Merma, Peso_Racimos, Area_Recorrida, Peso_Vastago, Anho_Produccion, Fruta_Piso)
                    VALUES(:ibmFinca, :idEmbolse, :idRacimos, :idSemana, :idNacional, :codEmbarque, :totalCajasElaboradas, :totalCajasRechazadas, :totalCajasExportadas, :ratio, :merma, :pesoRacimos, :areaRecorrida, :pesoVastago, :anhoProduccion, :frutaPiso);
                ");
                $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
                $datos->bindParam(':idEmbolse', $idEmbolse, PDO::PARAM_INT);
                $datos->bindParam(':idRacimos', $idRacimos, PDO::PARAM_INT);
                $datos->bindParam(':idSemana', $idSemana, PDO::PARAM_INT);
                $datos->bindParam(':idNacional', $idNacional, PDO::PARAM_INT);
                $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
                $datos->bindParam(':totalCajasElaboradas', $totalCajasElaboradas, PDO::PARAM_INT);
                $datos->bindParam(':totalCajasRechazadas', $totalCajasRechazadas, PDO::PARAM_INT);
                $datos->bindParam(':totalCajasExportadas', $totalCajasExportadas, PDO::PARAM_INT);
                $datos->bindParam(':ratio', $ratio, PDO::PARAM_STR);
                $datos->bindParam(':merma', $merma, PDO::PARAM_STR);
                $datos->bindParam(':pesoRacimos', $pesoRacimos, PDO::PARAM_STR);
                $datos->bindParam(':areaRecorrida', $areaRecorrida, PDO::PARAM_STR);
                $datos->bindParam(':pesoVastago', $pesoVastago, PDO::PARAM_STR);
                $datos->bindParam(':anhoProduccion', $anhoProduccion, PDO::PARAM_INT);
                $datos->bindParam(':frutaPiso', $frutaPiso, PDO::PARAM_INT);
                if ($datos->execute())
                    return $bd->lastInsertId();
                else 
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar detalle tblproduccion
        function guardarproduccion_detalle(
            $idTblProduccion, $idTblDias, $cajasElaboradasDia, $cajasRechazadasDia, 
            $cajasExportadasDia, $ratioDia, $mermaDia, $pesoRacimosDia, $areaRecorridaDia, 
            $pesoVastagoDia, $lotesCortadosDia, $lotesIniciadosDia, $frutaPisoDia) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO tbldet_tblproduccion (FKId_TblProduccion, FKId_TblDias, Total_CE_Dia, Total_CR_Dia, Total_CEx_Dia, Ratio, Merma, Peso_Racimos, Area_Recorrida, Peso_Vastago, Lotes_Cortados, Lotes_Iniciados, Fruta_Piso)
                    VALUES(:idTblProduccion, :idTblDias, :cajasElaboradasDia, :cajasRechazadasDia, :cajasExportadasDia, :ratioDia, :mermaDia, :pesoRacimosDia, :areaRecorridaDia, :pesoVastagoDia, :lotesCortadosDia, :lotesIniciadosDia, :frutaPisoDia);
                ");
                $datos->bindParam(':idTblProduccion', $idTblProduccion, PDO::PARAM_INT);
                $datos->bindParam(':idTblDias', $idTblDias, PDO::PARAM_INT);
                $datos->bindParam(':cajasElaboradasDia', $cajasElaboradasDia, PDO::PARAM_INT);
                $datos->bindParam(':cajasRechazadasDia', $cajasRechazadasDia, PDO::PARAM_INT);
                $datos->bindParam(':cajasExportadasDia', $cajasExportadasDia, PDO::PARAM_INT);
                $datos->bindParam(':ratioDia', $ratioDia, PDO::PARAM_STR);
                $datos->bindParam(':mermaDia', $mermaDia, PDO::PARAM_STR);
                $datos->bindParam(':pesoRacimosDia', $pesoRacimosDia, PDO::PARAM_STR);
                $datos->bindParam(':areaRecorridaDia', $areaRecorridaDia, PDO::PARAM_STR);
                $datos->bindParam(':pesoVastagoDia', $pesoVastagoDia, PDO::PARAM_STR);
                $datos->bindParam(':lotesCortadosDia', $lotesCortadosDia, PDO::PARAM_STR);
                $datos->bindParam(':lotesIniciadosDia', $lotesIniciadosDia, PDO::PARAM_STR);
                $datos->bindParam(':frutaPisoDia', $frutaPisoDia, PDO::PARAM_INT);
                if ($datos->execute())
                    return $bd->lastInsertId();
                else 
                    return false;
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

        // Guardar detalle - detalle tblproduccion 
        function guardarproduccion_detalle_detalle($idProduccionDetalle, $codigoTblCajasProduccion, $cantidadProducidas) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("
                    INSERT INTO tbldet_tbldet_tblproduccion (FKId_TblDet_TblProduccion, FKCodigo_TblCajasProduccion, N_CajasProducidas_Dia)
                    VALUES(:idProduccionDetalle, :codigoTblCajasProduccion, :cantidadProducidas);
                ");
                $datos->bindParam(':idProduccionDetalle', $idProduccionDetalle, PDO::PARAM_INT);
                $datos->bindParam(':codigoTblCajasProduccion', $codigoTblCajasProduccion, PDO::PARAM_INT);
                $datos->bindParam(':cantidadProducidas', $cantidadProducidas, PDO::PARAM_INT);
                $datos->execute();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

    // --------------------------------------------------------------------------

    //
    function createuser($assignFinca, $userName, $password, $isAdministrator) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                INSERT INTO tblusuarios (Usuario, Password, Ibm_Finca, FKId_TblTipoUsuario, FKId_TblEstadoUsuario)
                VALUES (:userName, :password, :assignFinca, :isAdministrator, 1);
            ");
            $datos->bindParam(':userName', $userName, PDO::PARAM_STR);
            $datos->bindParam(':password', $password, PDO::PARAM_STR);
            $datos->bindParam(':assignFinca', $assignFinca, PDO::PARAM_STR);
            $datos->bindParam(':isAdministrator', $isAdministrator, PDO::PARAM_INT);
            if ($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }
    
// Sentencias de búsqueda ==========================================================================================
    //función busca un único registro globalmente si tiene condicional lo ejecuta
    function buscarregistro($key, $campo, $tabla, $condicional){
        $tabla = strtolower($tabla);
        $bd = conectar();
        if ($condicional != false)
            $datos = $bd->prepare("SELECT * FROM $tabla WHERE $campo = :key AND $condicional");
        else
            $datos = $bd->prepare("SELECT * FROM $tabla WHERE $campo = :key");
        $datos->bindParam(":key", $key, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    function ingreso($usuario, $password) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT u.Usuario, f.PKIbm, u.FKId_TblTipoUsuario, u.FKId_TblEstadoUsuario, f.Nombre,
                f.Area_Neta, f.Area_Bruta, f.FKNit_TblEmpresas
            FROM tblusuarios as u LEFT JOIN tblfincas as f
            ON u.Ibm_Finca = f.PKIbm
            WHERE u.Usuario = :usuario
            AND u.Password = :password
        ");
        $datos->bindParam(":usuario", $usuario, PDO::PARAM_STR);
        $datos->bindParam(":password", $password, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    function listarfincas() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT f.PKIbm, f.Nombre, 
            (SELECT SUM(Area_Neta) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_neta, 
            (SELECT SUM(Area_Bruta) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_bruta
            FROM tblfincas as f
        ");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    function listarempresas() {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    function cajasproduccion() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT c.PKCodigo, c.Descripcion, c.FactorConversion, t.Descripcion TipoFruta
            FROM tblcajasproduccion c, tbltipofruta t
            WHERE c.FKId_TblTipoFruta = t.PKId
        ");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    function listarlotes($ibm_l) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE FKIbm_TblFincas = :ibm_l");
        $datos->bindParam(":ibm_l", $ibm_l, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    function buscarfinca($ibm_f) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT Nombre FROM tblfincas WHERE PKIbm = :ibm_f");
        $datos->bindParam(":ibm_f", $ibm_f, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    function buscarlote($id_lote) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE PKId = :id_lote");
        $datos->bindParam(":id_lote", $id_lote, PDO::PARAM_INT);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    function buscarempresa($ibm_e) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT e.PKNit, e.Nombre, e.Direccion, e.Telefono 
            FROM tblempresas as e, tblfincas as f 
            WHERE f.FKNit_TblEmpresas = e.PKNit AND f.PKIbm = :ibm_e
        ");
        $datos->bindParam(":ibm_e", $ibm_e, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    function editarempresa($nit) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas WHERE PKNit = :nit");
        $datos->bindParam(":nit", $nit, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    function buscarcaja($codigo) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblcajasproduccion WHERE PKCodigo = :codigo");
        $datos->bindParam(":codigo", $codigo, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    //Devuelve las semanas por año
    function cargarsemanaspa($anho) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblsemanas WHERE Anho = :anho");
        $datos->bindParam(":anho", $anho, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //Funciones de ver elaboración de acuerdo al tipo de filtro
        function verelaboracion_s($finca, $semana, $ano, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT (SELECT DATEADD(DAY, (di.PKId-1), s.Fecha_Inicio)) as Fecha, di.Descripcion as Dia, d.N_CajasProducidas_Dia as Total_CajaDia		
                FROM tbldet_tbldet_tblproduccion as d, tblcajasproduccion as c, tbldias as di, tblfincas as f, 
                    tblsemanas as s, tbldet_tblproduccion as p, tblproduccion as pr
                WHERE d.FKCodigo_TblCajasProduccion = :codigocaja
                AND d.FKCodigo_TblCajasProduccion = c.PKCodigo
                AND d.FKId_TblDet_TblProduccion = p.PKId
                AND p.FKId_TblDias = di.PKId
                AND p.FKId_TblProduccion = pr.PKId
                AND pr.FKIbm_TblFincas = f.PKIbm
                AND pr.FKId_TblSemanas = s.PKId
                AND pr.FKIbm_TblFincas = :finca
                AND pr.FKId_TblSemanas = :semana
                AND pr.Anho_Produccion = :ano
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->bindParam(":semana", $semana, PDO::PARAM_INT);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetchAll(PDO::FETCH_OBJ);
        }

        function verelaboracion_a($finca, $ano, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT SUM(dd.N_CajasProducidas_Dia) as total_anual 
                FROM tbldet_tbldet_tblproduccion as dd, tblcajasproduccion as cp, tbldet_tblproduccion as dp, tblproduccion as pr, tblfincas as fi
                WHERE dd.FKCodigo_TblCajasProduccion = cp.PKCodigo
                AND dd.FKId_TblDet_TblProduccion = dp.PKId
                AND dp.FKId_TblProduccion = pr.PKId
                AND pr.FKIbm_TblFincas = fi.PKIbm
                AND cp.PKCodigo = :codigocaja
                AND pr.Anho_Produccion = :ano
                AND fi.PKIbm = :finca
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetch(PDO::FETCH_OBJ);
        }

        function verelaboracion_h($finca, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT SUM(dd.N_CajasProducidas_Dia) as total_historico
                FROM tbldet_tbldet_tblproduccion as dd, tblcajasproduccion as cp, tbldet_tblproduccion as dp, tblproduccion as pr, tblfincas as fi
                WHERE dd.FKCodigo_TblCajasProduccion = cp.PKCodigo
                AND dd.FKId_TblDet_TblProduccion = dp.PKId
                AND dp.FKId_TblProduccion = pr.PKId
                AND pr.FKIbm_TblFincas = fi.PKIbm
                AND cp.PKCodigo = :codigocaja
                AND fi.PKIbm = :finca
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetch(PDO::FETCH_OBJ);
        }
    // End funciones de ver elaboración --------------------------------------------------

    //
    function tipofrutaselect() {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbltipofruta");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function cargarcajasip($cod_embarque, $ibm_finca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT dem.FKCodigo_TblCajasProduccion, cp.Descripcion, cp.FactorConversion, tp.Descripcion as TipoFruta
            FROM tbldet_tblembarque as dem, tblcajasproduccion as cp, tblembarque as em, tblfincas as fi, tbltipofruta as tp
            WHERE cp.PKCodigo = dem.FKCodigo_TblCajasProduccion
            AND tp.PKId = cp.FKId_TblTipoFruta
            AND em.PKCod = dem.FKCod_TblEmbarque
            AND dem.FKCod_TblEmbarque = :cod_embarque
            AND fi.PKIbm = dem.FKIbm_TblFincas
            AND dem.FKIbm_TblFincas = :ibm_finca
            AND dem.Cantidad > 0
        ");
        $datos->bindParam(':cod_embarque', $cod_embarque, PDO::PARAM_STR);
        $datos->bindParam(':ibm_finca', $ibm_finca, PDO::PARAM_STR);
        if ($datos->execute())
            return $datos->fetchAll(PDO::FETCH_OBJ);
        else
            return false;
    }

    // Carga la semana según el código de embarque
    function semanape($cod_embarque) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT se.N_Semana, se.Fecha_Inicio, se.Fecha_Fin
            FROM tblembarque as em, tblsemanas as se
            WHERE em.FKId_TblSemanas = se.PKId
            AND em.PKCod = :cod_embarque
        ");
        $datos->bindParam(":cod_embarque", $cod_embarque, PDO::PARAM_STR);
        if ($datos->execute())
            return $datos->fetch(PDO::FETCH_OBJ);
        else
            return false;
    }

    //
    function compararEmbarqueAndProduccion($ibmFinca, $codCajasProduccion, $codEmbarque) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT d.Cantidad FROM tbldet_tblembarque as d WHERE d.FKIbm_TblFincas = :ibmFinca
            AND d.FKCodigo_TblCajasProduccion = :codCajasProduccion
            AND d.FKCod_TblEmbarque = :codEmbarque
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':codCajasProduccion', $codCajasProduccion, PDO::PARAM_STR);
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        if ($datos->execute())
            return $datos->fetch(PDO::FETCH_OBJ);
        else
            return false;
    }

    //
    function veralineacion($codEmbarque, $ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT de.FKCodigo_TblCajasProduccion as Codigo, cp.Descripcion as Caja, de.Cantidad as Cantidad, cp.FKId_TblTipoFruta as tipoFruta
            FROM tbldet_tblembarque as de, tblcajasproduccion as cp
            WHERE de.FKCodigo_TblCajasProduccion = cp.PKCodigo
            AND de.FKIbm_TblFincas = :ibmFinca
            AND de.FKCod_TblEmbarque = :codEmbarque
            AND de.Cantidad > 0
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function cajassemanaanterior($codEmbarque) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT cp.PKCodigo
            FROM tblcajasproduccion as cp, tblembarque as e, tbldet_tblembarque as de, tblfincas as f
            WHERE cp.PKCodigo = de.FKCodigo_TblCajasProduccion
            AND f.PKIbm = de.FKIbm_TblFincas
            AND e.PKCod = de.FKCod_TblEmbarque
            AND e.PKCod = :codEmbarque
            AND f.PKIbm = (SELECT TOP 1 PKIbm FROM tblfincas)
        ");
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function listarusuarios() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT u.PKId, u.Usuario, f.Nombre as Nombre, eu.Descripcion as EstadoUsuario, tu.Descripcion as TipoUsuario, 
                u.FKId_TblEstadoUsuario, u.FKId_TblTipoUsuario
            FROM tblusuarios as u
            LEFT JOIN tblfincas as f ON u.Ibm_Finca = f.PKIbm
            LEFT JOIN tblestadousuario as eu ON u.FKId_TblEstadoUsuario = eu.PKId
            LEFT JOIN tbltipousuario as tu ON u.FKId_TblTipoUsuario = tu.PKId
        ");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function buscarprogramacion($codigoCaja, $codEmbarque) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT f.Nombre, de.Cantidad 
            FROM tbldet_tblembarque as de, tblfincas as f
            WHERE de.FKIbm_TblFincas = f.PKIbm
            AND de.FKCodigo_TblCajasProduccion = :codigoCaja
            AND de.FKCod_TblEmbarque = :codEmbarque
        ");
        $datos->bindParam(':codigoCaja', $codigoCaja, PDO::PARAM_STR);
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function datosflot($anhoActual) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT DISTINCT tblfincas.PKIbm, tblfincas.Nombre, 
                (SELECT SUM(tblproduccion.Total_CElaboradas) 
                    FROM tblproduccion 
                    WHERE tblproduccion.FKIbm_TblFincas = tblfincas.PKIbm)  as totalElaborado
            FROM tblfincas, tblproduccion
            WHERE tblfincas.PKIbm = tblproduccion.FKIbm_TblFincas
            AND tblproduccion.Anho_Produccion = :anhoActual
        ");
        $datos->bindParam(':anhoActual', $anhoActual, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function buscarultimasemana($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT TOP 1 f.PKIbm, f.Nombre, p.FKId_TblSemanas, s.N_Semana
            FROM tblproduccion as p, tblsemanas as s, tblfincas as f
            WHERE p.FKIbm_TblFincas = :ibmFinca 
            AND f.PKIbm = p.FKIbm_TblFincas
            AND s.PKId = p.FKId_TblSemanas 
            ORDER BY p.PKId DESC
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function buscarultimoestimativo($totalFincas) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT TOP $totalFincas * FROM tblestimativo ORDER BY FKCod_TblEmbarque DESC");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function buscarultimaproduccion($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT TOP 1 *
            FROM tblproduccion as p, tblfincas as f, tblsemanas as s
            WHERE p.FKIbm_TblFincas = f.PKIbm
            AND p.FKId_TblSemanas = s.PKId
            AND f.PKIbm = :ibmFinca
            ORDER BY p.Cod_Embarque DESC 
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }
    
    //
    function buscarproduccioncomparar($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT TOP 2 p.FKId_TblSemanas, p.Total_CRechazadas, p.Total_CElaboradas, f.Nombre, p.Cod_Embarque, s.N_Semana
            FROM tblproduccion as p, tblfincas as f, tblsemanas as s
            WHERE p.FKIbm_TblFincas = f.PKIbm
            AND p.FKId_TblSemanas = s.PKId
            AND f.PKIbm = :ibmFinca
            ORDER BY p.Cod_Embarque DESC
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function totalelaboradofinca($ibmFinca, $anhoActual) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT SUM(p.Total_CElaboradas) as totalElaborado, SUM(p.Total_CRechazadas) as totalRechazadas 
            FROM tblproduccion as p, tblfincas as f WHERE p.FKIbm_TblFincas = f.PKIbm 
            AND f.PKIbm = :ibmFinca
            AND p.Anho_Produccion = :anhoActual
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':anhoActual', $anhoActual, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function buscarultimaprogramacion($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT TOP 1 e.PKCod, e.FKId_TblSemanas, e.Anho, de.Cantidad
            FROM tblembarque as e, tbldet_tblembarque as de, tblfincas as f
            WHERE e.PKCod = de.FKCod_TblEmbarque
            AND f.PKIbm = de.FKIbm_TblFincas
            AND de.Cantidad > 0
            AND f.PKIbm = :ibmFinca
            ORDER BY e.PKCod DESC
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function totalprogramadofinca($codEmbarque, $ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT SUM(de.Cantidad) as Total
            FROM tbldet_tblembarque as de
            WHERE de.FKCod_TblEmbarque = :codEmbarque
            AND de.FKIbm_TblFincas = :ibmFinca
        ");
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    //
    function buscarelaboradosemana($codEmbarque, $ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT dp.Total_CE_Dia as elaboradoDia
            FROM tbldet_tblproduccion as dp
            INNER JOIN tblproduccion as p
            ON p.PKId = dp.FKId_TblProduccion
            AND p.Cod_Embarque = :codEmbarque
            AND p.FKIbm_TblFincas = :ibmFinca
        ");
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    // Obtiene el total de elaboración de el día según el id de la produccion
    function buscarelaboradodianacional($codEmbarque, $ibmFinca, $idDia) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT SUM(dmn.Cantidad_Elaborado) totalElaborado
            FROM tbldet_tblmercadonacional as dmn, tblmercadonacional as mn, tbldias as d
            WHERE mn.PKId = dmn.FKId_TblMercadoNacional
            AND d.PKId = dmn.FKId_TblDias
            AND mn.PKId = (SELECT FKId_TblMercadoNacional FROM tblproduccion WHERE Cod_Embarque = :codEmbarque AND FKIbm_TblFincas = :ibmFinca)
            AND d.PKId = :idDia
        ");
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':idDia', $idDia, PDO::PARAM_INT);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    //
    function semanaporfecha($fecha) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT * FROM tblsemanas as s
            WHERE '$fecha' >= CAST(s.Fecha_Inicio as DATE) 
            AND CAST(s.Fecha_Fin as DATE) >= '$fecha'
        ");
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    //
    function existsCajaAlineada($codigoCaja, $ibmFinca, $codEmbarque) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT * FROM tbldet_tblembarque 
            WHERE FKCodigo_TblCajasProduccion = :codigoCaja 
            AND FKIbm_TblFincas = :ibmFinca 
            AND FKCod_TblEmbarque = :codEmbarque
        ");
        $datos->bindParam(':codigoCaja', $codigoCaja, PDO::PARAM_STR);
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }

    //
    function produccionporcodigo($codEmbarque, $ibmFinca){
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT Total_CElaboradas as totalElaborado
            FROM tblproduccion as p, tblfincas as f, tblsemanas as s
            WHERE p.FKIbm_TblFincas = f.PKIbm
            AND p.FKId_TblSemanas = s.PKId
            AND f.PKIbm = :ibmFinca
            AND p.Cod_Embarque = :codEmbarque 
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch(PDO::FETCH_OBJ);
    }

    //
    function listarembarques() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT e.PKCod, s.N_Semana, s.Fecha_Inicio, s.Fecha_Fin, s.Anho
            FROM tblembarque as e
            INNER JOIN tblsemanas as s
            ON e.FKId_TblSemanas = s.PKId
        ");
        $datos->execute();
        return $datos->fetchAll(PDO::FETCH_OBJ);
    }


// Sentencias de actualización------------------------------------------------------------------------------------------------------------

    //Recibe arreglo de php para actualizar los datos
    function actualizarempresa($empresa) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("UPDATE tblempresas SET Nombre = :nom, Direccion = :dir, Telefono = :tel WHERE PKNit = :nit");
            $datos->bindParam(":nom", $empresa['nom']);
            $datos->bindParam(":dir", $empresa['dir']);
            $datos->bindParam(":tel", $empresa['tel']);
            $datos->bindParam(":nit", $empresa['nit']);
            if($datos->execute()){
                return true;
            }else{
                return false;
            }                        
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    //Actualiza con código 
    function actualizarcaja($caja) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("
                UPDATE tblcajasproduccion 
                SET PKCodigo = :codigo, Descripcion = :descripcion, FactorConversion = :factor, FKId_TblTipoFruta = :tipofruta 
                WHERE PKCodigo = :codigoreal
            ");
            $datos->bindParam(":codigoreal", $caja['codigo_real'], PDO::PARAM_STR);
            $datos->bindParam(":codigo", $caja['codigo'], PDO::PARAM_STR);
            $datos->bindParam(":descripcion", $caja['descripcion'], PDO::PARAM_STR);
            $datos->bindParam(":factor", $caja['factor'], PDO::PARAM_STR);
            $datos->bindParam(":tipofruta", $caja['tipofruta'], PDO::PARAM_INT);
            if ($datos->execute())
                return true;
            else
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    //
    function editarlote($id_lote, $area_neta, $area_bruta) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("UPDATE tbllotes SET Area_Neta =". $area_neta .", Area_Bruta =". $area_bruta ." WHERE PKId =". $id_lote .";");
            if ($datos->execute())
                return true;
            else
                return false;
        }catch (Exception $e) {
            echo "Error".$e;
        }
    }

    // Cambia los privilegios de usuario en base a estandar o admin
    function changeprivilegesuser($idUser, $value) {
        try {
            $bd = conectar(); 
            $datos = $bd->prepare("UPDATE tblusuarios SET FKId_TblTipoUsuario = :value WHERE PKId = :idUser");
            $datos->bindParam(':idUser', $idUser, PDO::PARAM_INT);
            $datos->bindParam(':value', $value, PDO::PARAM_INT);
            if ($datos->execute())
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    // Cambia el estado de un usuario en base a activo o inactivo
    function changestatussuser($idUser, $value) {
        try {
            $bd = conectar(); 
            $datos = $bd->prepare("UPDATE tblusuarios SET FKId_TblEstadoUsuario = :value WHERE PKId = :idUser");
            $datos->bindParam(':idUser', $idUser, PDO::PARAM_INT);
            $datos->bindParam(':value', $value, PDO::PARAM_INT);
            if ($datos->execute())
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    // Cambia el password de un usuario 
    function changepassword($idUser, $password) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("UPDATE tblusuarios SET password = :password WHERE PKId = :idUser");
            $datos->bindParam(':idUser', $idUser, PDO::PARAM_INT);
            $datos->bindParam(':password', $password, PDO::PARAM_STR);
            if ($datos->execute())
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo 'Error'.$e;
        }
    }

    //
    function actualizarprogramacion($idRegistro, $cantidad) {
        try {
            $bd = conectar();
            $datos = $bd->prepare("UPDATE tbldet_tblembarque SET cantidad = :cantidad WHERE PKId = :idRegistro");
            $datos->bindParam(':cantidad', $cantidad, PDO::PARAM_INT);
            $datos->bindParam(':idRegistro', $idRegistro, PDO::PARAM_INT);
            if ($datos->execute()) 
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo 'Error'.$e;
        }
    }
    
// Sentencias de eliminación ----------------------------------------------------------------------------------------
    //Esta función recibe la llave primaria y la tabla como referencia de eliminación (eliminar_s = método Eliminar del archivo statements)
    function eliminar_s($key, $campo, $tabla) {
        $tabla = strtolower($tabla);
        try {
            $bd = conectar();
            if ($tabla == 'tblfincas')
                eliminar_lotes($key);
            $datos = $bd->prepare("DELETE FROM ".$tabla." WHERE ".$campo." = :key");
            $datos->bindParam(":key", $key, PDO::PARAM_STR);
            if ($datos->execute()) 
                return true;
            else 
                return false;
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    function eliminar_lotes($key){
        try{
            $bd = conectar();
            $datos = $bd->prepare("DELETE FROM tbllotes WHERE FKIbm_TblFincas = :key");
            $datos->bindParam(":key", $key, PDO::PARAM_STR);
            $datos->execute();
        }catch(Exception $e){
            echo "Error".$e;
        }
    }

?>