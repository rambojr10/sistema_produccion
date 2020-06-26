<?php
    require_once 'conexion.php';
    //Orden crud
    
//Sentencias de creación =========================================================================================

    function nuevafinca($datos_c, $lotes){
        $ibm = $datos_c['ibm'];
        $nombre = $datos_c['nombre'];
        $neta = $datos_c['neta'];
        $bruta = $datos_c['bruta'];
        $bruta = $datos_c['bruta'];
        $empresa = $datos_c['empresa'];
        $bd = conectar();
        try{
            $datos = $bd->prepare("INSERT INTO tblfincas VALUES(:ibm, :nombre, :neta, :bruta, :empresa)");
            $datos->bindParam(":ibm", $ibm, PDO::PARAM_STR);
            $datos->bindParam(":nombre", $nombre, PDO::PARAM_STR);
            $datos->bindParam(":neta", $neta, PDO::PARAM_STR);
            $datos->bindParam(":bruta", $bruta, PDO::PARAM_STR);
            $datos->bindParam(":empresa", $empresa, PDO::PARAM_STR);
            if($datos->execute()){
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
            }else{
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
            if($datos->execute()){
                return true;
            }else{
                return false;
            }
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
            if ($datos->execute()) {
                return true;
            }else{
                return false;
            }
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    function crearembarque($cod_embarque, $ano, $semana){
        try{
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblembarque VALUES(:cod_embarque, :semana, :ano)");
            $datos->bindParam(":cod_embarque", $cod_embarque, PDO::PARAM_STR);
            $datos->bindParam(":semana", $semana, PDO::PARAM_INT);
            $datos->bindParam(":ano", $ano, PDO::PARAM_STR);
            if ($datos->execute()){
                return $bd->query("SELECT * FROM TblEmbarque ORDER BY PKCod DESC LIMIT 1")->fetch();
            }else {
                return false;
            }
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }

    //Genera semanas según el año siguiente, recibe la fecha de la primera semana del año próximo y empieza a generar los datos a partír de la primera inserción
    function anhonuevo($fechai, $fechaf, $anho, $cinta){
        try{
            $bd = conectar();
            $datos = $bd->prepare("INSERT INTO tblsemanas VALUES(null, 'SEMANA 1', :fechai, :fechaf, :anho, :cinta)");
            $datos->bindParam(":fechai", $fechai, PDO::PARAM_STR);
            $datos->bindParam(":fechaf", $fechaf, PDO::PARAM_STR);
            $datos->bindParam(":anho", $anho, PDO::PARAM_INT);
            $datos->bindParam(":cinta", $cinta, PDO::PARAM_INT);
            if($datos->execute()){
                for ($x=2; $x < 53; $x++) { 
                    $datos = $bd->prepare("
                        SELECT  tblsemanas.Fecha_Inicio as fechai, 
                                tblsemanas.Fecha_Fin as fechaf, 
                                tblsemanas.FKId_TblCintas as cinta 
                        FROM tblsemanas WHERE tblsemanas.N_Semana = 'SEMANA ".($x-1)."' AND tblsemanas.Anho = :anho
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
                if ($datos->execute()) {
                    return true;
                }else {
                    return false;
                }
            }else {
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
            if($datos->execute()) {
                return true;
            }else {
                return false;
            }
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
            if($datos->execute()) {
                return true;
            }else {
                return false;
            }
        } catch (Exception $e) {
            echo "Error".$e;
        }
    }
    
    
// Sentencias de búsqueda ==========================================================================================
    //función busca un único registro globalmente
    function buscarregistro($key, $campo, $tabla){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM ".$tabla." WHERE ".$campo." = :key");
        $datos->bindParam(":key", $key, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }


    function ingreso($usuario, $password){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblusuarios INNER JOIN tblfincas 
                                ON tblusuarios.FKIbm_TblFincas = tblfincas.PKIbm 
                                WHERE tblusuarios.FKIbm_TblFincas = :usuario 
                                AND tblusuarios.Password = :password");
        $datos->bindParam(":usuario", $usuario, PDO::PARAM_STR);
        $datos->bindParam(":password", $password, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    function listarfincas(){
        $bd = conectar();
        $datos = $bd->prepare("SELECT f.PKIbm, f.Nombre, 
                                (SELECT ROUND(SUM(Area_Neta), 2) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_neta, 
                                (SELECT ROUND(SUM(Area_Bruta), 2) FROM tbllotes WHERE FKIbm_TblFincas = f.PKIbm) as area_bruta
                                FROM tblfincas as f");
        $datos->execute();
        return $datos->fetchAll();
    }

    function listarempresas(){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas");
        $datos->execute();
        return $datos->fetchAll();
    }

    function cajasproduccion(){
        $bd = conectar();
        $datos = $bd->prepare("SELECT c.PKCodigo, c.Descripcion, c.FactorConversion, t.Descripcion TipoFruta
                                FROM tblcajasproduccion c, tbltipofruta t
                                WHERE c.FKId_TblTipoFruta = t.PKId");
        $datos->execute();
        return $datos->fetchAll();
    }

    function listarlotes($ibm_l){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE FKIbm_TblFincas = :ibm_l");
        $datos->bindParam(":ibm_l", $ibm_l, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    function buscarfinca($ibm_f){
        $bd = conectar();
        $datos = $bd->prepare("SELECT tblfincas.Nombre FROM TblFincas WHERE PKIbm = :ibm_f");
        $datos->bindParam(":ibm_f", $ibm_f, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarlote($id_lote){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tbllotes WHERE PKId = :id_lote");
        $datos->bindParam(":id_lote", $id_lote, PDO::PARAM_INT);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarempresa($ibm_e){
        $bd = conectar();
        $datos = $bd->prepare("SELECT e.PKNit, e.Nombre, e.Direccion, e.Telefono 
                                FROM tblempresas as e, tblfincas as f 
                                WHERE f.FKNit_TblEmpresas = e.PKNit AND f.PKIbm = :ibm_e");
        $datos->bindParam(":ibm_e", $ibm_e, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function editarempresa($nit){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblempresas WHERE PKNit = :nit");
        $datos->bindParam(":nit", $nit, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function buscarcaja($codigo){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblcajasproduccion WHERE PKCodigo = :codigo");
        $datos->bindParam(":codigo", $codigo, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetch();
    }

    function cargarsemanaspa($anho){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM tblsemanas WHERE Anho = :anho");
        $datos->bindParam(":anho", $anho, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //Funciones de ver elaboración de acuerdo al tipo de filtro
        function verelaboracion_s($finca, $semana, $ano, $codigocaja){
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

        function verelaboracion_a($finca, $ano, $codigocaja){
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

        function verelaboracion_h($finca, $codigocaja){
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
    // ----------------------------------------------------------------

    //
    function cargarsemanas_pe($ano_pe){
        $bd = conectar();
        $datos = $bd->prepare("
            SELECT s.PKId, s.N_Semana
            FROM tblsemanas as s
            WHERE NOT EXISTS (SELECT NULL
                                FROM tblembarque as e
                                WHERE s.PKId = e.FKId_TblSemanas
                                AND e.anho = :ano)
            AND s.Anho = :ano");
        $datos->bindParam(":ano", $ano_pe, PDO::PARAM_STR);
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function tipofrutaselect(){
        $bd = conectar();
        $datos = $bd->prepare("SELECT * FROM TblTipoFruta");
        $datos->execute();
        return $datos->fetchAll();
    }

    //
    function cargarcintas($ids){
        $bd = conectar();
        $datos = $bd->prepare("SELECT c.PKId as id_cinta, c.Descripcion as cinta, s.PKId as id_semana, s.N_Semana as semana, 
                                s.Fecha_Inicio as fecha_inicio, s.Fecha_Fin as fecha_fin  
                            FROM tblcintas as c, tblsemanas as s 
                            WHERE s.PKId IN (:id1, :id2, :id3, :id4) 
                            AND s.FKId_TblCintas = c.PKId");
        $datos->bindParam(":id1", $ids['id1'], PDO::PARAM_INT);
        $datos->bindParam(":id2", $ids['id2'], PDO::PARAM_INT);
        $datos->bindParam(":id3", $ids['id3'], PDO::PARAM_INT);
        $datos->bindParam(":id4", $ids['id4'], PDO::PARAM_INT);
        if ($datos->execute()) {
            return $datos->fetchAll();
        }else {
            return false;
        }
    }

//Sentencias de actualización------------------------------------------------------------------------------------------------------------

    //Recibe arreglo de php para actualizar los datos
    function actualizarempresa($empresa){
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
    function actualizarcaja($caja){
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
            if ($datos->execute()){
                return true;
            }else {
                return false;
            }
        }catch (Exception $e) {
            echo "Error".$e;
        }
    }
    
//Sentencias de eliminación ----------------------------------------------------------------------------------------
    //Esta función recibe la llave primaria y la tabla como referencia de eliminación (eliminar_s = método Eliminar del archivo statements)
    //sirve para eliminar datos de un único registro
    function eliminar_s($key, $campo, $tabla){
        try {
            $bd = conectar();
            if ($tabla == 'tblfincas'){
                eliminar_lotes($key);
            }
            $datos = $bd->prepare("DELETE FROM ".$tabla." WHERE ".$campo." = :key");
            $datos->bindParam(":key", $key, PDO::PARAM_STR);
            $datos->execute();
            return true;
        }catch (Exception $e){
            echo "Error".$e;
        }
    }

    function eliminar_lotes($key){
        try{
            $bd = conectar();
            $datos = $bd->prepare("DELETE FROM tbllotes WHERE tbllotes.FKIbm_TblFincas = :key");
            $datos->bindParam(":key", $key, PDO::PARAM_STR);
            $datos->execute();
        }catch(Exception $e){
            echo "Error".$e;
        }
    }

?>