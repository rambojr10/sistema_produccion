<?php
    require_once 'conexion.php';
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
            $datos = $bd->prepare("INSERT INTO tblfincas VALUES(:ibm, :nombre, :neta, :bruta, :empresa)");
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
                    $datos = $bd->prepare("INSERT INTO tbllotes VALUES(null, :nom, :neta, :bruta, :ibm)");
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
            $datos = $bd->prepare("INSERT INTO tblsemanas VALUES(null, 'SEMANA 1', :fechai, :fechaf, :anho, :cinta)");
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
                        $ultima_semana = $datos->fetch();
                        if ($ultima_semana->cinta == 10) {
                        	$ultima_semana->cinta = 0;
                        }
                        $datos = $bd->prepare("SELECT DATE_ADD(:fechai, INTERVAL 7 DAY) as fechai, DATE_ADD(:fechaf, INTERVAL 7 DAY) as fechaf, :cinta+1 as cinta");
                        $datos->bindParam(":fechai", $ultima_semana->fechai, PDO::PARAM_STR);
                        $datos->bindParam(":fechaf", $ultima_semana->fechaf, PDO::PARAM_STR);
                        $datos->bindParam(":cinta", $ultima_semana->cinta, PDO::PARAM_INT);
                        if ($datos->execute()){
                            $insertar_semana = $datos->fetch();
                            $datos = $bd->prepare("INSERT INTO tblsemanas VALUES(null, 'SEMANA ".$x."', :fechai, :fechaf, :anho, :cinta)");
                            $datos->bindParam(":fechai", $insertar_semana->fechai, PDO::PARAM_STR);
                            $datos->bindParam(":fechaf", $insertar_semana->fechaf, PDO::PARAM_STR);
                            $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
                            $datos->bindParam(":cinta", $insertar_semana->cinta, PDO::PARAM_INT);
                            $datos->execute();
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                }
                $datos = $bd->prepare("INSERT INTO tblregistrosemanas VALUES (null, :anho)");
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
            $datos = $bd->prepare("INSERT INTO tbldet_tblembarque VALUES(null, :codigo_embarque, :ibm_finca, :codigo_caja, :cantidad);");
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
            $datos = $bd->prepare("INSERT INTO tblestimativo VALUES(null, :finca, :premiun, :especial, :cod_embarque);");
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
                $datos = $bd->prepare("INSERT INTO TblEmbolse VALUES(null, :id_semana, :presente, :prematuro)");
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
                $datos = $bd->prepare("INSERT INTO TblRacimos VALUES(null, :id_semana, :totalRacimosCortados, :totalRacimosRechazados);");
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
                    INSERT INTO TblDet_TblRacimos_TblDias VALUES(
                    null, :lastIdRacimos, :idTblDias, :racimosCortadosDia, :racimosRechazadosDia, 
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
                $datos = $bd->prepare("INSERT INTO TblDet_TblDet_TblRacimos_TblDias VALUES(null, :idRacimosDetalle, :idCinta, :racimosCortadosCinta);");
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
                $datos = $bd->prepare("INSERT INTO TblMercadoNacional VALUES(null, :totalElaborado)");
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
                $datos = $bd->prepare("INSERT INTO TblDet_TblMercadoNacional VALUES(
                    null, :idNacional, :idTblDias, :idCajasNacional, :cantidadElaborado)");
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
                $datos = $bd->prepare("INSERT INTO TblCargue VALUES(
                    null, :ibmFinca, :cliente, :fechaCargue, :numeroPoma, :dedoSuelto, :cluster, :manoEntera, :especial, 
                    :bolsa20Kilos, :bolsa25Kilos, :total, :placa, :conductor, :codEmbarque)");
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

        // Guardar tblproduccion
        function guardarproduccion(
            $ibmFinca, $idEmbolse, $idRacimos, $idSemana, $idNacional, $codEmbarque, $totalCajasElaboradas, $totalCajasRechazadas, 
            $totalCajasExportadas, $ratio, $merma, $pesoRacimos, $areaRecorrida, $pesoVastago, $anhoProduccion) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("INSERT INTO tblproduccion VALUES(
                    null, :ibmFinca, :idEmbolse, :idRacimos, :idSemana, :idNacional, :codEmbarque, :totalCajasElaboradas, :totalCajasRechazadas, 
                    :totalCajasExportadas, :ratio, :merma, :pesoRacimos, :areaRecorrida, :pesoVastago, :anhoProduccion);");
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
            $pesoVastagoDia, $lotesCortadosDia, $lotesIniciadosDia) {
            try {
                $bd = conectar();
                $datos = $bd->prepare("INSERT INTO tbldet_tblproduccion VALUES(
                    null, :idTblProduccion, :idTblDias, :cajasElaboradasDia, 
                    :cajasRechazadasDia, :cajasExportadasDia, :ratioDia, 
                    :mermaDia, :pesoRacimosDia, :areaRecorridaDia, :pesoVastagoDia, :lotesCortadosDia, :lotesIniciadosDia);");
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
                $datos = $bd->prepare("INSERT INTO tbldet_tbldet_tblproduccion VALUES(
                    null, :idProduccionDetalle, :codigoTblCajasProduccion, :cantidadProducidas);");
                $datos->bindParam(':idProduccionDetalle', $idProduccionDetalle, PDO::PARAM_INT);
                $datos->bindParam(':codigoTblCajasProduccion', $codigoTblCajasProduccion, PDO::PARAM_INT);
                $datos->bindParam(':cantidadProducidas', $cantidadProducidas, PDO::PARAM_INT);
                $datos->execute();
            } catch (Exception $e) {
                echo "Error".$e;
            }
        }

    // --------------------------------------------------------------------------

    
    
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
        return $datos->fetchAll();
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
        return $datos->fetchAll();
    }

    function listarfincas() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT f.PKIbm, f.Nombre, 
            (SELECT ROUND(SUM(Area_Neta), 2) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_neta, 
            (SELECT ROUND(SUM(Area_Bruta), 2) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_bruta
            FROM tblfincas as f
        ");
        $datos->execute();
        return $datos->fetchAll();
    }

    function listarempresas() {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas");
        $datos->execute();
        return $datos->fetchAll();
    }

    function cajasproduccion() {
        $bd = conectar();
        $datos = $bd->prepare("SELECT c.PKCodigo, c.Descripcion, c.FactorConversion, t.Descripcion TipoFruta
                                FROM tblcajasproduccion c, tbltipofruta t
                                WHERE c.FKId_TblTipoFruta = t.PKId");
        $datos->execute();
        return $datos->fetchAll();
    }

    function listarlotes($ibm_l) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE FKIbm_TblFincas = :ibm_l");
        $datos->bindParam(":ibm_l", $ibm_l, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    function buscarfinca($ibm_f) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT Nombre FROM tblfincas WHERE PKIbm = :ibm_f");
        $datos->bindParam(":ibm_f", $ibm_f, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarlote($id_lote) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE PKId = :id_lote");
        $datos->bindParam(":id_lote", $id_lote, PDO::PARAM_INT);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarempresa($ibm_e) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT e.PKNit, e.Nombre, e.Direccion, e.Telefono 
                                FROM tblempresas as e, tblfincas as f 
                                WHERE f.FKNit_TblEmpresas = e.PKNit AND f.PKIbm = :ibm_e");
        $datos->bindParam(":ibm_e", $ibm_e, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function editarempresa($nit) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas WHERE PKNit = :nit");
        $datos->bindParam(":nit", $nit, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarcaja($codigo) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblcajasproduccion WHERE PKCodigo = :codigo");
        $datos->bindParam(":codigo", $codigo, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    //Devuelve las semanas por año
    function cargarsemanaspa($anho) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblsemanas WHERE Anho = :anho");
        $datos->bindParam(":anho", $anho, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //Funciones de ver elaboración de acuerdo al tipo de filtro
        function verelaboracion_s($finca, $semana, $ano, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT  (SELECT DATE_ADD(s.Fecha_Inicio, INTERVAL (di.PKId-1) DAY)) as Fecha, 
                            di.Descripcion as Dia, d.N_CajasProducidas_Dia as Total_CajaDia		
                FROM	
                    tbldet_tbldet_tblproduccion as d, tblcajasproduccion as c, tbldias as di, tblfincas as f, 
                    tblsemanas as s, tbldet_tblproduccion as p, tblproduccion as pr
                WHERE
                    d.FKCodigo_TblCajasProduccion = :codigocaja
                AND
                    d.FKCodigo_TblCajasProduccion = c.PKCodigo
                AND 
                    d.FKId_TblDet_TblProduccion = p.PKId
                AND 
                    p.FKId_TblDias = di.PKId
                AND 
                    p.FKId_TblProduccion = pr.PKId
                AND 
                    pr.FKIbm_TblFincas = f.PKIbm
                AND 
                    pr.FKId_TblSemanas = s.PKId
                AND
                    pr.FKIbm_TblFincas = :finca
                AND
                    pr.FKId_TblSemanas = :semana
                AND
                    pr.Anho_Produccion = :ano
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->bindParam(":semana", $semana, PDO::PARAM_INT);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetchAll();
        }

        function verelaboracion_a($finca, $ano, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT SUM(dd.N_CajasProducidas_Dia) as total_anual 
                FROM
                    tbldet_tbldet_tblproduccion as dd, tblcajasproduccion as cp, tbldet_tblproduccion as dp, tblproduccion as pr, tblfincas as fi
                WHERE
                    dd.FKCodigo_TblCajasProduccion = cp.PKCodigo
                AND
                    dd.FKId_TblDet_TblProduccion = dp.PKId
                AND
                    dp.FKId_TblProduccion = pr.PKId
                AND
                    pr.FKIbm_TblFincas = fi.PKIbm
                AND
                    cp.PKCodigo = :codigocaja
                AND 
                    pr.Anho_Produccion = :ano
                AND
                    fi.PKIbm = :finca
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetch();
        }

        function verelaboracion_h($finca, $codigocaja) {
            $bd = conectar();
            $datos = $bd->prepare("
                SELECT SUM(dd.N_CajasProducidas_Dia) as total_historico
                FROM
                    tbldet_tbldet_tblproduccion as dd, tblcajasproduccion as cp, tbldet_tblproduccion as dp, tblproduccion as pr, tblfincas as fi
                WHERE
                    dd.FKCodigo_TblCajasProduccion = cp.PKCodigo
                AND
                    dd.FKId_TblDet_TblProduccion = dp.PKId
                AND
                    dp.FKId_TblProduccion = pr.PKId
                AND
                    pr.FKIbm_TblFincas = fi.PKIbm
                AND
                    cp.PKCodigo = :codigocaja
                AND
                    fi.PKIbm = :finca
            ");
            $datos->bindParam(":codigocaja", $codigocaja, PDO::PARAM_STR);
            $datos->bindParam(":finca", $finca, PDO::PARAM_STR);
            $datos->execute();
            return $datos->fetch();
        }
    // End funciones de ver elaboración --------------------------------------------------

    //
    function tipofrutaselect() {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbltipofruta");
        $datos->execute();
        return $datos->fetchAll();
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
        if ($datos->execute()) {
            return $datos->fetchAll();
        } else {
            return false;
        }
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
            return $datos->fetch();
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
            return $datos->fetch();
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
        return $datos->fetchAll();
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
            AND f.PKIbm = (SELECT PKIbm FROM tblfincas LIMIT 1)
        ");
        $datos->bindParam(':codEmbarque', $codEmbarque, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
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
        return $datos->fetchAll();
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
        return $datos->fetchAll();
    }

    //
    function datosflot() {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT DISTINCT tblfincas.PKIbm, tblfincas.Nombre, 
                (SELECT SUM(tblproduccion.Total_CElaboradas) 
                    FROM tblproduccion 
                    WHERE tblproduccion.FKIbm_TblFincas = tblfincas.PKIbm)  as totalElaborado
            FROM tblfincas, tblproduccion
            WHERE tblfincas.PKIbm = tblproduccion.FKIbm_TblFincas
        ");
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function buscarultimasemana($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT f.PKIbm, f.Nombre, p.FKId_TblSemanas, s.N_Semana
            FROM tblproduccion as p, tblsemanas as s, tblfincas as f
            WHERE p.FKIbm_TblFincas = :ibmFinca 
            AND f.PKIbm = p.FKIbm_TblFincas
            AND s.PKId = p.FKId_TblSemanas 
            ORDER BY p.PKId DESC LIMIT 1
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function buscarultimoestimativo($totalFincas) {
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblestimativo ORDER BY FKCod_TblEmbarque DESC LIMIT :id ");
        $datos->bindParam(':id', $totalFincas, PDO::PARAM_INT);
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function buscarultimaproduccion($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT *
            FROM tblproduccion as p, tblfincas as f, tblsemanas as s
            WHERE p.FKIbm_TblFincas = f.PKIbm
            AND p.FKId_TblSemanas = s.PKId
            AND f.PKIbm = :ibmFinca
            ORDER BY p.Cod_Embarque DESC LIMIT 1
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }
    
    //
    function buscarproduccioncomparar($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT p.FKId_TblSemanas, p.Total_CRechazadas, p.Total_CElaboradas, f.Nombre, p.Cod_Embarque, s.N_Semana
            FROM tblproduccion as p, tblfincas as f, tblsemanas as s
            WHERE p.FKIbm_TblFincas = f.PKIbm
            AND p.FKId_TblSemanas = s.PKId
            AND f.PKIbm = :ibmFinca
            ORDER BY p.Cod_Embarque DESC LIMIT 2
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function totalelaboradofinca($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT SUM(p.Total_CElaboradas) as totalElaborado, SUM(p.Total_CRechazadas) as totalRechazadas 
            FROM tblproduccion as p, tblfincas as f WHERE p.FKIbm_TblFincas = f.PKIbm 
            AND f.PKIbm = :ibmFinca
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function buscarultimaprogramacion($ibmFinca) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT e.PKCod, e.FKId_TblSemanas, e.Anho, de.Cantidad
            FROM tblembarque as e, tbldet_tblembarque as de, tblfincas as f
            WHERE e.PKCod = de.FKCod_TblEmbarque
            AND f.PKIbm = de.FKIbm_TblFincas
            AND de.Cantidad > 0
            AND f.PKIbm = :ibmFinca
            ORDER BY e.PKCod DESC LIMIT 1
        ");
        $datos->bindParam(':ibmFinca', $ibmFinca, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
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
        return $datos->fetchAll();
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
        return $datos->fetchAll();
    }

    // Obtiene el total de elaboración de el día según el id de la produccion
    function buscarelaboradodianacional($codEmbarque, $ibmFinca, $idDia) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT SUM(dmn.Cantidad_Elaborado) totalElaborado, d.Descripcion
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
        return $datos->fetchAll();
    }

    //
    function semanaporfecha($fecha) {
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT * FROM tblsemanas as s
            WHERE :fecha >= DATE(s.Fecha_Inicio) 
            AND DATE(s.Fecha_Fin) >= :fecha     
        ");
        $datos->bindParam(':fecha', $fecha, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
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
            if(eliminar_s($caja['codigo_real'], 'PKCodigo', 'tblcajasproduccion')){
                $bd = conectar();
                $datos = $bd->prepare("INSERT INTO tblcajasproduccion VALUES(:codigo, :descripcion, :factor, :tipofruta)");
                $datos->bindParam(":codigo", $caja['codigo'], PDO::PARAM_STR);
                $datos->bindParam(":descripcion", $caja['descripcion'], PDO::PARAM_STR);
                $datos->bindParam(":factor", $caja['factor'], PDO::PARAM_STR);
                $datos->bindParam(":tipofruta", $caja['tipofruta'], PDO::PARAM_INT);
                $datos->execute();
                return true;
            }
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
            $datos = $bd->prepare("UPDATE tblusuarios as u SET u.FKId_TblTipoUsuario = :value WHERE u.PKId = :idUser");
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
            $datos = $bd->prepare("UPDATE tblusuarios as u SET u.FKId_TblEstadoUsuario = :value WHERE u.PKId = :idUser");
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
            $datos->execute();
            return true;
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