<?php
    session_start();
    require_once "../datos/statements.php";
    
    //Complemento
    function object_sorter($clave, $orden = null) {
        return function ($a, $b) use ($clave, $orden) {
            $result = ($orden == "DESC") ? strnatcmp($b->$clave, $a->$clave) : strnatcmp($a->$clave, $b->$clave);
            return $result;
        };
    }

//  CREAR ===========================================================================================================
    //
    function nueva_finca() {
        $datos = array(
            "ibm" => $_GET['data']['ibm'],
            "nombre" => $_GET['data']['nombre'],
            "neta" => $_GET['data']['neta'],
            "bruta" => $_GET['data']['bruta'],
            "empresa" => $_GET['data']['empresa']
        );
        $lotes = $_GET['data']['lotes'];
        $nueva_finca = nuevafinca($datos, $lotes);
        if($nueva_finca == true){
            echo true;
        }else{
            echo false;
        } 
    }

    //
    function guardar_nuevo_lote() {
        $nameLote = $_POST['nameLote'];
        $areaNeta = $_POST['areaNeta'];
        $areaBruta = $_POST['areaBruta'];
        $ibmFinca = $_POST['ibmFinca'];
        $result = guardarnuevolote($nameLote, $areaNeta, $areaBruta, $ibmFinca);
        echo $result;
    }

    //
    function nueva_empresa() {
        $empresa = array(
            'nit' => $_POST['empresa']['nit'],
            'nom' => $_POST['empresa']['nom'],
            'dir' => $_POST['empresa']['dir'],
            'tel' => $_POST['empresa']['tel']
        );
        $result = nuevaempresa($empresa);
        echo $result;
    }

    // 
    function guardar_caja() {
        $caja = array(
            'codigo' => $_POST['caja']['codigo'],
            'descripcion' => $_POST['caja']['descripcion'],
            'factor' => $_POST['caja']['factor'],
            'tipofruta' => $_POST['caja']['tipofruta']
        );
        $result = guardarcaja($caja);
        echo $result;
    }

    //Crea embarque según datos y consulta cajas para cargar la vista 
    function crear_embarque() {
        $datos = json_decode($_POST['datos']);
        $result = crearembarque($datos->codEmbarque, $datos->anho, $datos->idSemana);
        $vista = array();
        if ($result == true) {
            //aquí va todo lo que se va poner en la vista para asignar las cajas
            $vista['embarque'] = $datos->descripcionSemana . " del " . $datos->anho;
            $vista['codEmbarque'] = $datos->codEmbarque;
            //Tabla cajas lleva todos los campos a usar en la tabla
            for ($x=0; $x < count($datos->codigoCajas) ; $x++) { 
                $vista['cajas'][$x] = buscarcaja($datos->codigoCajas[$x]);
            }
            usort($vista['cajas'], object_sorter('FKId_TblTipoFruta'));
            echo json_encode($vista);
        } else {
            echo $result;
        }
    }

    //generar semanas
    function anho_nuevo() {
        $anhos = buscarregistro("SEMANA 52", "N_Semana", "tblsemanas", false);
        $ultimo_anho = end($anhos);
        $verificar_anho = buscarregistro($_POST["anhonuevo"]+1, "Anho_generado", "tblregistrosemanas", false);
        if (isset($verificar_anho[0])) {
            echo "No se creó";
        } else {
            $fechai = date('Y-m-d', strtotime($ultimo_anho->Fecha_Inicio.'+ 1 week'));
            $fechaf = date('Y-m-d', strtotime($ultimo_anho->Fecha_Fin.'+ 1 week'));
            $result = anhonuevo($fechai, $fechaf, $ultimo_anho->Anho+1, $ultimo_anho->FKId_TblCintas+1);
            if ($result === true)
                echo "Ok";
            else
                echo "Err";
        }
    }

    //Guarda la programación y el estimativo de la semana
    function guardar_programacion() {
        $datos = array();
        $datos = json_decode($_POST['jsonProgramacion']);
        foreach ($datos->cajas as $c) {
            $existsRegister = existsCajaAlineada($c->codigoCaja, $c->ibmFinca, $datos->codEmbarque);
            if (count($existsRegister) > 0)
                actualizarprogramacion($existsRegister[0]->PKId, $c->cantidad);
            else
                guardarprogramacion($datos->codEmbarque, $c->ibmFinca, $c->codigoCaja, $c->cantidad);
        }
        eliminar_s($datos->codEmbarque, 'FKCod_TblEmbarque', 'tblestimativo');
        foreach ($datos->estimativo as $e){
            guardarestimativo($e->finca, $e->premiun, $e->especial, $datos->codEmbarque);
        }
    }

    // Guarda los datos de la vista insertar produccion llenando todas las tablas 
    function guardar_produccion() {
        // Controla el estado de la producción
        $state = null; //Cambia el estado si, los registros son actualizados, si superan el límite de producción y si sólo guardan por primera vez
        $datosProduccion = json_decode($_POST['datosProduccionGuardar']);
        $validarCantidadesCajas = false;

        //Compara la cantidad de cajas a ingresar no sea mayor a la programada
        foreach ($datosProduccion->tblCajas as $caja) {
            if ($caja[1] != null) {
                $cantidadEmbarque = compararEmbarqueAndProduccion($_SESSION['conectado']->PKIbm, $caja[1], $datosProduccion->cod_embarque);
                if ($caja[10] > $cantidadEmbarque->Cantidad) {
                    $validarCantidadesCajas = false;
                    break;
                } else {
                    $validarCantidadesCajas = true;
                }
            } else {
                break;
            }
        }
        if ($validarCantidadesCajas) { 
        
            //Verifica si existe una producción previa y la elimina 
            $existsProduccion = buscarregistro($datosProduccion->cod_embarque, 'Cod_Embarque', 'TblProduccion', 'FKIbm_TblFincas = '.$_SESSION['conectado']->PKIbm);
            if (isset($existsProduccion[0])) {
                $state = (eliminar_produccion($datosProduccion->cod_embarque, $_SESSION['conectado']->PKIbm) === true ? 21 : null);
            }

            $lastIdEmbolse = guardarembolse(
                $datosProduccion->embolse->id_semana, 
                ($datosProduccion->embolse->presente == null ? 0 : $datosProduccion->embolse->presente), 
                ($datosProduccion->embolse->prematuro == null ? 0 : $datosProduccion->embolse->prematuro)
            );

        // TblRacimos ---------------------------
            $lastIdRacimos = guardarracimos(
                $datosProduccion->embolse->id_semana, 
                $datosProduccion->tblRacimos[4][8], 
                $datosProduccion->tblRacimos[8][8]
            );

            // Obtener cintas 
                // Ubicados en orden de semanas 12-11-10-9 
                $cintas = array(
                    0 => (($datosProduccion->embolse->id_cinta-2) == 0 ? 10 : (($datosProduccion->embolse->id_cinta-2) == -1 ? 9 : ($datosProduccion->embolse->id_cinta-2))),
                    1 => (($datosProduccion->embolse->id_cinta-1) == 0 ? 10 : ($datosProduccion->embolse->id_cinta-1)),
                    2 => $datosProduccion->embolse->id_cinta+0,
                    3 => (($datosProduccion->embolse->id_cinta+1) == 11 ? 1 : ($datosProduccion->embolse->id_cinta+1)),
                );
            // ---------------------------
            if ($lastIdRacimos != false) {
                for ($x=1; $x < 8 ; $x++) { 
                    // Validar los campos a ingresar si son los campos de los usuarios
                    $idRacimosDetalle = guardarracimos_detalle(
                        $lastIdRacimos, $x, 
                        $datosProduccion->tblRacimos[4][$x],
                        $datosProduccion->tblRacimos[8][$x],
                        $datosProduccion->tblRacimos[5][$x], 
                        $datosProduccion->tblRacimos[6][$x]
                    );
                    if  ($idRacimosDetalle != false) {
                        for ($y=0; $y < 4; $y++) { 
                            guardarracimos_detalle_detalle($idRacimosDetalle, $cintas[$y], $datosProduccion->tblRacimos[$y][$x]);
                        }
                    }
                }
            } else {
                echo false;
            }
        // End TblRacimos ------------------------------------------

        // TblNacional y cargue ------------------------------------
            
            $lastIdNacional = guardarnacional($datosProduccion->tblNacional[6][8]);
            if ($lastIdNacional !== false) {
                for ($x=1; $x < 8; $x++) {
                    for ($y=1; $y < 7; $y++) {
                        guardarnacional_detalle($lastIdNacional, $x, $y, $datosProduccion->tblNacional[$y-1][$x]);
                    }
                }

                // TblCargue - se ubica aquí para verificar que exista mercado nacional para realizar cargue
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
                        guardarcargue($datosCargue);
                    }
                    if ($c[0] == 'CAJAS EN PLATAFORMA' && $c[9] > 0) {
                        $dataRow = [$c[3], $c[4], $c[5], $c[6], $c[7], $c[8], $c[9]];
                        guardarcajasplataforma($lastIdNacional, $dataRow);
                    }
                }
            } else {
                echo false;
            }

        // End TblNacional y cargue --------------------------------

        // TblCajas ------------------------------------------------

            //Guarda los datos en la tblProduccion
            $maxItems = count($datosProduccion->tblCajas);
            $lastIdProduccion = guardarproduccion(
                $_SESSION['conectado']->PKIbm, $lastIdEmbolse, $lastIdRacimos, $datosProduccion->embolse->id_semana, $lastIdNacional, $datosProduccion->cod_embarque,
                $datosProduccion->tblCajas[$maxItems-11][10], $datosProduccion->tblCajas[$maxItems-10][10], $datosProduccion->tblCajas[$maxItems-9][10],
                ($datosProduccion->tblCajas[$maxItems-7][10] == '#VALUE!' ? null : $datosProduccion->tblCajas[$maxItems-7][10]), 
                ($datosProduccion->tblCajas[$maxItems-6][10] == '#VALUE!' ? null : $datosProduccion->tblCajas[$maxItems-6][10]),
                ($datosProduccion->tblCajas[$maxItems-5][10] == '#VALUE!' ? null : $datosProduccion->tblCajas[$maxItems-5][10]),
                $datosProduccion->tblCajas[$maxItems-4][10], 
                ($datosProduccion->tblCajas[$maxItems-3][10] == '#VALUE!' ? null : $datosProduccion->tblCajas[$maxItems-3][10]),
                substr($datosProduccion->cod_embarque, 4,4), 
                ($datosProduccion->tblCajas[$maxItems-8][10] > 0 ? $datosProduccion->tblCajas[$maxItems-8][10] : null)
            );
            if ($lastIdProduccion !== false) {
                for ($x = 1; $x < 8; $x++) {
                    $idProduccionDetalle = guardarproduccion_detalle(
                        $lastIdProduccion, $x, 
                        $datosProduccion->tblCajas[$maxItems-11][$x+2], 
                        $datosProduccion->tblCajas[$maxItems-10][$x+2],
                        $datosProduccion->tblCajas[$maxItems-9][$x+2],
                        $datosProduccion->tblCajas[$maxItems-7][$x+2],
                        $datosProduccion->tblCajas[$maxItems-6][$x+2],
                        $datosProduccion->tblCajas[$maxItems-5][$x+2],
                        $datosProduccion->tblCajas[$maxItems-4][$x+2],
                        $datosProduccion->tblCajas[$maxItems-3][$x+2],
                        $datosProduccion->tblCajas[$maxItems-2][$x+2],
                        $datosProduccion->tblCajas[$maxItems-1][$x+2],
                        $datosProduccion->tblCajas[$maxItems-8][$x+2]
                    );
                    if ($idProduccionDetalle != false) {
                        for ($y = 0; $y < $maxItems-10; $y++) {
                            guardarproduccion_detalle_detalle(
                                $idProduccionDetalle, $datosProduccion->tblCajas[$y][1], 
                                ($datosProduccion->tblCajas[$y][$x+2] > 0 ? $datosProduccion->tblCajas[$y][$x+2] : null)
                            );
                        }
                    } else {
                        echo false;
                    }
                }
                $state = ($state === 21 ? $state : 20);
            } else {
                echo false;
            }
        // End TblCajas --------------------------------------------
        
        } else {
            $state = 22; //response 22 is a error code for limit of elaboration
        }
        echo $state;
    }

    function create_user() {
        $assignFinca = $_POST['assignFinca'];
        $userName = $_POST['userName'];
        $password = $_POST['password'];
        $isAdministrator = $_POST['isAdministrator'];
        $result = createuser($assignFinca, $userName, $password, $isAdministrator);
        echo $result;
    }

//  BUSCAR =================================================================================================================

    // Busca un registro en cualquier tabla y si existe condicional lo valida
    function buscar_registro() {
        $key = $_REQUEST['key'];
        $campo = $_REQUEST['campo'];
        $tabla = $_REQUEST['tabla'];
        $condicional = isset($_REQUEST['condicional']) ? $_REQUEST['condicional'] : false;
        $result = buscarregistro($key, $campo, $tabla, $condicional);
        echo json_encode($result);
    }

    // Retorna el ibm de la finca conectada o controla la finca conectada según el usuario
    function verify_ibmfinca() {
        if ($_SESSION['conectado']->PKIbm == null or $_SESSION['conectado']->Nombre == null) {
            $fincasList = listarfincas();
            $result = [];
            foreach ($fincasList as $fl) {
                $result += [$fl->PKIbm => $fl->Nombre];
            }
            echo json_encode($result);
        } else {
            echo json_encode([
                'ibmFinca' => $_SESSION['conectado']->PKIbm,
                'nombreFinca' => $_SESSION['conectado']->Nombre
            ]);
        }
    }

    //Obtiene los datos de las fincas desde el archivo /datos/statements.php para enviarlos de vuelta al archivo contenido.js
    function listar_fincas() {
        $fincas = listarfincas();
        foreach ($fincas as $f) {
        echo "<tr>
                <td>
                " . $f->PKIbm . "
                </td>
                <td>
                " . $f->Nombre . "
                </td>
                <td>
                " . round($f->area_neta, 2) . "
                </td>
                <td>
                " . round($f->area_bruta, 2) . "
                </td>
                <td dato='$f->PKIbm'>
                    <a href='#nuevolote' class='notika-icon notika-edit' data-toggle='modal' data-target='#nuevolote' onclick='nuevo_lote($f->PKIbm)' title='Nuevo lote'></a> - 
                    <objet class='dropdown'> 
                        <a class='notika-icon notika-menu dropdown-toggle' id='drop_finca' data-toggle='dropdown' aria-haspopup='true' aria-expanded='true'></a>
                        <ul class='dropdown-menu' aria-labelledby='drop_finca'>
                            <li><a href='#ver_lotes' data-toggle='modal' data-target='#modal-ll' onclick='ver_lotes($f->PKIbm)'>Lotes</a></li>
                            <li><a href='#ver_empresa' ibm='$f->PKIbm' data-toggle='modal' data-target='#modal-ve'>Razón Social</a></li>
                        </ul>
                    </objet> - 
                    <a href='#eliminar_finca' class='notika-icon notika-trash' title='Eliminar'></a>
                </td>
            </tr>";
        }
    }

    //Returna el último lote de una finca
    function ultimo_lote() {
        $lotes = listarlotes($_GET['ibmFinca']);
        echo json_encode(end($lotes));
    }

    //
    function listar_empresas() {
        $empresas = listarempresas();
        foreach ($empresas as $e) {
        echo "<tr>
                <td>
                " . $e->PKNit . "
                </td>
                <td>
                " . $e->Nombre . "
                </td>
                <td>
                " . $e->Direccion . "
                </td>
                <td>
                " . $e->Telefono . "
                </td>
                <td dato='$e->PKNit'>
                    <a href='#editar_empresa' nit='$e->PKNit' data-toggle='modal' data-target='#modal-ed' class='notika-icon notika-edit' title='Editar'></a> - 
                    <a href='#eliminar_empresa' nit='$e->PKNit' class='notika-icon notika-close' title='Eliminar'></a>
                </td>
            </tr>";
        }
    }

    //Busca los datos para cargar el select_rs en la capa web
    function select_rs() {
        $select_rs = listarempresas();
        echo "<option value='0'>Seleccione...</option>";
        foreach ($select_rs as $s) {
            echo "<option value='". $s->PKNit ."'>". $s->Nombre ."</option>";
        }
    }

    //
    function listar_cajas() {
        $cajas = cajasproduccion();
        foreach ($cajas as $c) {
            echo "<tr>
                    <td>"
                        . $c->PKCodigo . 
                    "</td>
                    <td>"
                        . $c->Descripcion . 
                    "</td>
                    <td>"
                        . round($c->FactorConversion, 2) .
                    "</td>
                    <td>"
                        . $c->TipoFruta .
                    "<td>
                        <a href='#editar_caja' codigo='$c->PKCodigo' class='notika-icon notika-edit' title='Editar' data-toggle='modal' data-target='#modal-ec'></a> - 
                        <a href='#ver_elaboracion' codigo='$c->PKCodigo' class='notika-icon notika-menus' title='Ver Elaboración' data-toggle='modal' data-target='#modal-ve'></a> - 
                        <a href='' class='notika-icon notika-trash' title='Eliminar' onclick=eliminarcaja($c->PKCodigo)></a>
                    </td>
                </tr>";
        }
    }

    //
    function listar_lotes() {
        $lotes = listarlotes($_POST['ibm_l']);
        foreach ($lotes as $l) {
            echo "
                <tr>
                    <td>"
                        . $l->Lote .
                    "</td>
                    <td>"
                        . round($l->Area_Neta, 2) .
                    "</td>
                    <td>"
                        . round($l->Area_Bruta, 2) .
                    "</td>
                    <td>
                        <a href='#editar_lote' id='$l->PKId' data-toggle='modal' data-target='#editarlote' class='notika-icon notika-edit' title='Editar'></a> - 
                        <a href='#eliminar_lote' id='$l->PKId' class='notika-icon notika-close' title='Eliminar'></a>
                    </td>
                </tr>";
        }
    }
    
    //Buscar Finca por ibm o por nombre
    function buscar_finca() {
        if ( isset($_GET['nombreFinca']) ) {
            $finca = buscarregistro($_GET['nombreFinca'], "Nombre", "TblFincas", false)[0];
            echo $finca->PKIbm;
        } else if ( isset($_POST['ibm_f']) ) {
            $finca = buscarfinca($_POST['ibm_f']);
            echo $finca->Nombre;
        }
    }

    //Buscar lote por id
    function buscar_lote() {
        $result = buscarlote($_POST['id_lote']);
        $lote = array(
            'lote' => $result->Lote,
            'neta' => $result->Area_Neta,
            'bruta' => $result->Area_Bruta,
        );
        echo json_encode($lote);
    }

    //Buscar empresa por ibm finca
    function buscar_empresa() {
        $result = buscarempresa($_POST['ibm_e']);
        $empresa = array(
            'nit' => $result->PKNit,
            'nombre' => $result->Nombre,
            'dir' => $result->Direccion,
            'tel' => $result->Telefono
        );
        echo json_encode($empresa);
    }

    //Carga semanas por año
    function cargar_semanaspa() {
        $result = cargarsemanaspa($_POST['anho']);
        foreach ($result as $r) {
            echo "<option value='$r->PKId'>$r->N_Semana</option>";
        }
    }

    //Buscar empresa por nit para editar
    function editar_empresa() {
        $result = editarempresa($_POST['nit']);
        $empresa = array(
            'nit' => $result->PKNit,
            'nom' => $result->Nombre,
            'dir' => $result->Direccion,
            'tel' => $result->Telefono
        );
        echo json_encode($empresa);
    }

    //
    function buscar_caja() {
        $result = buscarcaja($_POST['codigo']);
        $caja = array(
            'codigo' => $result->PKCodigo,
            'descripcion' => $result->Descripcion,
            'factor' => $result->FactorConversion,
            'tipofruta' => $result->FKId_TblTipoFruta
        );
        echo json_encode($caja);
    }

    //
    function ver_filtrocaja() {
        if (isset($_POST['filtro'])) {
            $filtro = $_POST['filtro'];
            switch ($filtro) {

                case 'semanal':
                    echo "  
                        <div class='nk-int-mk sl-dp-mn sm-res-mg-t-10'>
                            <h2>Año</h2>
                        </div>
                        <input type='text' class='form-control' name='ano_semana-ve'>
                        <div class='nk-int-mk sl-dp-mn sm-res-mg-t-10'>
                            <h2>Semana</h2>
                        </div>
                        <div class='bootstrap-select fm-cmp-mg'>
                            <select class='form-control' name='semana-ve'>
                            </select>
                        </div>";
                            
                break;
                
                case 'anual':
                    echo "
                        <div class='nk-int-mk sl-dp-mn sm-res-mg-t-10'>
                            <h2>Año</h2>
                        </div>
                        <input type='text' class='form-control' name='ano_anual'>
                    ";
                break;
                
                default:
                    break;
            }
        }
    }

    //
    function fincas_ve() {
        $fincas = listarfincas();
        echo "<option value='0'>SELECCIONE LA FINCA...</option>";
        foreach($fincas as $f){
            echo "
                <option value='$f->PKIbm'>$f->Nombre</option>
            ";
        }
    }

    //Muestra los datos del modal ver_elaboracion en base al filtro
    function ver_elaboracion() {
        //decodifica el json y lo convierte en un array para controlarlo desde php
        $filtros = (json_decode($_POST['filtros']));
        //inicializa una variable para controlar el contenido obtenido de statements.php
        $result = "";
        //verifica el tipo de filtro para así crear los campos de la tabla según el tipo y mostrarlos en pantalla
        if ($filtros->tipo == 'semanal') {
            //llama funcion de statements.php con los resultados de la consulta
            $result = verelaboracion_s($filtros->finca, $filtros->semana, $filtros->ano, $filtros->codigocaja);
            //verifica que se hayan encontrado datos y los imprime
            if (!empty($result)) {
                echo "
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Día</th>
                            <th>Cantidad</th>
                        </tr>
                    </thead>
                    <tbody>
                ";
                foreach ($result as $r) {
                    echo "
                        <tr>
                            <td>$r->Fecha</td>
                            <td>$r->Dia</td>
                            <td>$r->Total_CajaDia</td>
                        </tr>
                    ";
                }
                echo "</tbody>";
            //Si no encuentra datos imprime false, lo que se interpreta en un swal en cajasproduccion.js
            } else {
                echo false;
            }
        } else if ($filtros->tipo == 'anual') {
            $result = verelaboracion_a($filtros->finca, $filtros->ano, $filtros->codigocaja);
            if (!empty($result->total_anual)) {
                echo"
                    <div class='ui raised link centered card'>
                        <div class='content'>
                            <div class='center aligned header'>Total Elaboración</div>
                            <div class='center aligned description'>
                                <div class='ui massive label'>
                                    $result->total_anual
                                </div>
                            </div>
                        </div>
                    </div>
                ";
            } else {
                echo false;
            }
        } else if ($filtros->tipo == 'historico') {
            $result = verelaboracion_h($filtros->finca, $filtros->codigocaja);
            if (!empty($result->total_historico)) {
                echo"
                    <div class='ui raised link centered card'>
                        <div class='content'>
                            <div class='center aligned header'>Total Elaboración - Histórico</div>
                            <div class='center aligned description'>
                                <div class='ui massive label'>
                                    $result->total_historico
                                </div>
                            </div>
                        </div>
                    </div>
                ";
            } else {
                echo false;
            }
        }
    }

    //
    function cargarcajas_select() {
        $cajas = cajasproduccion();
        foreach ($cajas as $c) {
            echo "
                <option value='$c->PKCodigo'>$c->PKCodigo</option>
            ";
        }
        //aquí mismo cargar cajas en el select de la semana anterior y edición de embarque, limpia y llena nuevamente el select
    }

    //
    function tipofruta_select() {
        $tipofruta = tipofrutaselect();
        //verifica si la petición es editar para enviar los option con el tipo de fruta selected
        if (!isset($_POST['tipofruta_editar'])) {
            echo "<option value='0'>Seleccione...</option>";
            foreach ($tipofruta as $t){
                echo "
                    <option value='$t->PKId'>$t->Descripcion</option>
                ";
            }
        } else {
            foreach ($tipofruta as $t) {
                if ($t->PKId == $_POST['tipofruta_editar']) {
                    echo "
                        <option value='$t->PKId' selected='true'>$t->Descripcion</option>
                    ";
                } else {
                    echo "
                        <option value='$t->PKId'>$t->Descripcion</option>
                    ";
                }
            }
        }
    }

    //
    function info_semana($idSemana) {
        // Obtiene y cambia los números de acuerdo a los ids de las cintas en la tabla que van de 1 a 10, los retorna en orden de 12 a 9 semanas
        $semana = buscarregistro($idSemana, 'PKId', 'tblsemanas', false);
        $datos['semana'] = $semana[0];
        $ids[] = buscarregistro(
            (($semana[0]->FKId_TblCintas-2 == -1 ? 9 : ($semana[0]->FKId_TblCintas-2 == 0 ? 10 : $semana[0]->FKId_TblCintas-2))),
            'PKId', 'TblCintas', false
        )[0];
        $ids[] = buscarregistro(
            (($semana[0]->FKId_TblCintas-1) == 0 ? 10 : ($semana[0]->FKId_TblCintas-1)),
            'PKId', 'TblCintas', false
        )[0];
        $ids[] = buscarregistro(
            $semana[0]->FKId_TblCintas+0,
            'PKId', 'TblCintas', false
        )[0];
        $ids[] = buscarregistro(
            (($semana[0]->FKId_TblCintas+1) == 11 ? 1 : ($semana[0]->FKId_TblCintas+1)),
            'PKId', 'TblCintas', false
        )[0];
        $datos['cintas'] = $ids;
        return $datos;
    }

    // 
    function cargar_cajas_ip() {
        $result['cajas'] = cargarcajasip($_POST['cod_embarque'], $_SESSION['conectado']->PKIbm);
        $result['semana'] = semanape($_POST['cod_embarque']);
        echo json_encode($result);
    }

    //
    function cargar_produccion_ip() {
        $cod_embarque = $_GET['cod_embarque'];
        $tblProduccion = buscarregistro($cod_embarque, 'Cod_Embarque', 'TblProduccion', 'FKIbm_TblFincas = '.$_SESSION['conectado']->PKIbm);
        $tblProduccion = (count($tblProduccion) == 1 ? $tblProduccion[0] : ""); 
        if ($tblProduccion != "") {

            $tblEmbolse = buscarregistro($tblProduccion->FKId_TblEmbolse, "PKId", "tblembolse", false);
            $tblEmbolse = (count($tblEmbolse) == 1 ? $tblEmbolse[0] : "");
            $idCinta = buscarregistro($tblProduccion->FKId_TblSemanas, "PKId", "tblsemanas", false);

            //TblRacimos
            $tblRacimos = buscarregistro($tblProduccion->FKId_TblRacimos, "PKId", "tblracimos", false);
            $tblRacimos = buscarregistro($tblRacimos[0]->PKId, "FKId_TblRacimos", "tbldet_tblracimos_tbldias", false);
            $infoRacimos = array();
            foreach ($tblRacimos as $dr) {
                $pushDetalle = [$dr->N_RacimosR_Dia, $dr->Total_PEmbarque, $dr->Total_POtrasFincas];
                $datosDia = buscarregistro($dr->PKId, "FKId_TblDet_TblRacimos_TblDias", "tbldet_tbldet_tblracimos_tbldias", false);
                $pushDetalleDetalle = [];
                foreach ($datosDia as $dd) {
                    $pushDetalleDetalle[] = $dd->N_RacimosC_Cintas;
                }
                $resultRacimos = array_merge($pushDetalleDetalle, $pushDetalle);
                array_push($infoRacimos, $resultRacimos);
            }
            
            //TblCajas
            $tblCajas = buscarregistro($tblProduccion->PKId, "FKId_TblProduccion", "TblDet_TblProduccion", false);
            $infoCajas = array();
            foreach ($tblCajas as $dc) {
                $pushDetalle = [
                    "cajasRechazadas" => $dc->Total_CR_Dia, "frutaPiso" => $dc->Fruta_Piso, "ratio" => $dc->Ratio, "merma" => $dc->Merma, 
                    "pesoRacimos" => $dc->Peso_Racimos, "areaRecorrida" => $dc->Area_Recorrida, 
                    "pesoVastago" => $dc->Peso_Vastago, "lotesCortados" => $dc->Lotes_Cortados, "lotesIniciados" => $dc->Lotes_Iniciados
                ];
                $datosDia = buscarregistro($dc->PKId, "FKId_TblDet_TblProduccion", "TblDet_TblDet_TblProduccion", false);
                $pushDetalleDetalle = [];
                foreach ($datosDia as $ddd) {
                    $pushDetalleDetalle[] = $ddd->N_CajasProducidas_Dia;
                }
                $resultCajas = array_merge($pushDetalleDetalle, $pushDetalle);
                array_push($infoCajas, $resultCajas);
            }

            //TblNacional
            $tblNacional = buscarregistro($tblProduccion->FKId_TblMercadoNacional, "PKId", "TblMercadoNacional", false);
            $infoPlataforma = buscarregistro($tblNacional[0]->PKId, 'FKId_TblMercadoNacional', 'TblCajasPlataforma', false);
            $tblNacional = buscarregistro($tblNacional[0]->PKId, "FKId_TblMercadoNacional", "TblDet_TblMercadoNacional", false);
            $infoNacional = [
                'lunes' => [],
                'martes' => [],
                'miercoles' => [],
                'jueves' => [],
                'viernes' => [],
                'sabado' => [],
                'domingo' => []
            ];
            foreach ($tblNacional as $dn) {
                switch ($dn->FKId_TblDias) {
                    case '1':
                        array_push($infoNacional['lunes'], $dn->Cantidad_Elaborado);
                        break;
                    case '2':
                        array_push($infoNacional['martes'], $dn->Cantidad_Elaborado);
                        break;
                    case '3':
                        array_push($infoNacional['miercoles'], $dn->Cantidad_Elaborado);
                        break;
                    case '4':
                        array_push($infoNacional['jueves'], $dn->Cantidad_Elaborado);
                        break;
                    case '5':
                        array_push($infoNacional['viernes'], $dn->Cantidad_Elaborado);
                        break;
                    case '6':
                        array_push($infoNacional['sabado'], $dn->Cantidad_Elaborado);
                        break;
                    case '7':
                        array_push($infoNacional['domingo'], $dn->Cantidad_Elaborado);
                        break;
                    default:
                        break;
                }
            }

            //TblCargue
            $infoCargue = buscarregistro($tblProduccion->Cod_Embarque, "FKCod_TblEmbarque", "TblCargue", 'FKIbm_TblFincas = '.$_SESSION['conectado']->PKIbm);

            //infoElaboracion
            $totalElaborado = produccionporcodigo($cod_embarque, $_SESSION['conectado']->PKIbm);
            $totalProgramado = totalprogramadofinca($cod_embarque, $_SESSION['conectado']->PKIbm);
            $infoElaboracion = ['totalElaborado' => $totalElaborado->totalElaborado, 'totalProgramado' => $totalProgramado->Total];

            //Result
            $datosProduccion = [
                'cod_embarque' => $cod_embarque,
                'embolse' => [
                    'id_semana' => $tblProduccion->FKId_TblSemanas,
                    'id_cinta' => $idCinta[0]->FKId_TblCintas,
                    'presente' => $tblEmbolse->N_PlantasPresente, 
                    'prematuro' => $tblEmbolse->N_PlantasPrematuro 
                ],
                'tblRacimos' => $infoRacimos,
                'tblCajas' => $infoCajas,
                'tblNacional' => $infoNacional,
                'tblCargue' => $infoCargue,
                'tblCajasPlataforma' => isset($infoPlataforma[0]) ? $infoPlataforma[0] : [],
                'infoElaboracion' => $infoElaboracion
            ];
            echo json_encode($datosProduccion);
        } else {
            echo json_encode(['result' => false]);
        }
    }

    //
    function ver_alineacion() {
        $codEmbarque = $_POST['codEmbarque'];
        $datos = veralineacion($codEmbarque, $_SESSION['conectado']->PKIbm);
        foreach ($datos as $d) {
            echo "
                <tr>
                    <td>$d->Codigo</td>
                    <td>$d->Caja</td>
                    <td>$d->Cantidad</td>
                </tr>
            ";
        }
    }

    //
    function cajas_semana_anterior() {
        $result = cajassemanaanterior($_POST['codEmbarque']);
        echo json_encode($result);
    }

    //
    function listar_usuarios() {
        if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) {
            $datos = listarusuarios();
            foreach ($datos as $d) {
                $controlEstadoUsuario = $d->EstadoUsuario == 'ACTIVO' ? 'success' : 'danger';
                // controla el tipousuario
                // $controlTipoUsuario = $d->TipoUsuario == 'ADMINISTRADOR' ? 'success' : 'danger';
                // $controlTipoUsuarioIcono = $d->TipoUsuario == 'ADMINISTRADOR' ? 'unlock' : 'lock';
                // <a class='btn btn-$controlTipoUsuario $controlTipoUsuario-icon-notika btn-reco-mg btn-button-mg' onclick='changePrivileges($d->PKId, $d->FKId_TblTipoUsuario)' data-tooltip='Change privileges' data-position='right center'><i class='fa fa-$controlTipoUsuarioIcono'></i></a>

                echo "
                    <div class='col-lg-4 col-md-4 col-sm-6 col-xs-12'>
                        <div class='contact-list mg-t-15'>
                            <div class='contact-win'>
                                <div class='contact-img'>
                                    <h2>". ($d->Nombre == '' ? strtoupper($d->Usuario) : $d->Nombre) ."</h2>
                                    <button class='btn btn-$controlEstadoUsuario btn-xs notika-btn-$controlEstadoUsuario waves-effect'>$d->EstadoUsuario</button>
                                </div>
                                <div class='conct-sc-ic'>
                                    <a class='btn btn-orange orange-icon-notika btn-reco-mg btn-button-mg' onclick='changePassword($d->PKId)' data-tooltip='Change password' data-position='right center'><i class='fa fa-key'></i></a>
                                    <a class='btn btn-$controlEstadoUsuario $controlEstadoUsuario-icon-notika btn-reco-mg btn-button-mg' onclick='changeStatus($d->PKId, $d->FKId_TblEstadoUsuario)' data-tooltip='Change status' data-position='right center'><i class='fa fa-ban'></i></a>
                                    <a class='btn btn-danger danger-icon-notika btn-reco-mg btn-button-mg' onclick='deleteUser($d->PKId)' data-tooltip='Delete user' data-position='right center'><i class='fa fa-trash'></i></a>
                                </div>
                            </div>
                            <div class='contact-ctn'>
                                <div class='contact-ad-hd'>
                                    <h2>$d->Usuario</h2>
                                    <p class='ctn-ads'>$d->TipoUsuario</p>
                                </div>
                            </div>
                        </div>
                    </div>
                ";
            }
        }
    }

    //
    function cargar_programacion() {
        $codEmbarque = $_GET['codEmbarque'];
        $listaCajas = buscarregistro($codEmbarque, 'FKCod_TblEmbarque', 'TblDet_TblEmbarque', 'FKIbm_TblFincas = (SELECT TOP 1 PKIbm FROM tblfincas);');
        $result = [ 'infoCajas' => [], 'estimativo' => [] ];
        foreach ($listaCajas as $lc) {
            $infoCaja = buscarcaja($lc->FKCodigo_TblCajasProduccion);
            $infoCaja->Programacion = buscarprogramacion($lc->FKCodigo_TblCajasProduccion, $codEmbarque);
            array_push($result['infoCajas'], $infoCaja);
        }

        $estimativo = buscarregistro($codEmbarque, 'FKCod_TblEmbarque', 'TblEstimativo', false);
        array_push($result['estimativo'], $estimativo);

        usort($result['infoCajas'], object_sorter('FKId_TblTipoFruta'));
        echo json_encode($result);
    }

    // retorna los datos a la gráfica principal
    function datos_flot() {
        echo json_encode(datosflot($_GET['anhoActual']));
    }

    // retorna los datos del home admin
    function datos_home() {
        $result = ['cardSemanaRegistrada' => [], 'cardEstimativo' => [], 'cardRechazadasAndElaboradas' => [], 'cardComparativa' => []];
        $fincas = listarfincas();
        foreach ($fincas as $f) {
            
            //cardSemanaRegistrada
            $itemUltimaSemana = buscarultimasemana($f->PKIbm);
            if (count($itemUltimaSemana) > 0)
                array_push($result['cardSemanaRegistrada'], $itemUltimaSemana[0]);
            else 
                array_push($result['cardSemanaRegistrada'], $f);
            
            //cardRechazadasAndElaboradas
            $itemUltimaProduccion = buscarultimaproduccion($f->PKIbm);
            if (count($itemUltimaSemana) > 0)
                array_push($result['cardRechazadasAndElaboradas'], $itemUltimaProduccion[0]);
            else 
                array_push($result['cardRechazadasAndElaboradas'], $f);
                
            //cardComparativa
            $itemComparativa = buscarproduccioncomparar($f->PKIbm);
            array_push($result['cardComparativa'], $itemComparativa);
        }

        //cardEstimativo
        $estimativo = buscarultimoestimativo(count($fincas));
        $tableHead = '<th>CONCEPTO</th>';
        $tablePremiun = '<td>PREMIUN</td>';
        $tableEspecial = '<td>ESPECIAL</td>';
        foreach ($estimativo as $e) {
            $tableHead .= "<th>$e->Finca</th>";
            $tablePremiun .= "<td>$e->Premiun</td>";
            $tableEspecial .= "<td>$e->Especial</td>";
        }
        $result['cardEstimativo']['tableHead'] = $tableHead;
        $result['cardEstimativo']['tableBody']['premiun'] = $tablePremiun;
        $result['cardEstimativo']['tableBody']['especial'] = $tableEspecial;
        $result['cardEstimativo']['codEmbarque'] = $estimativo[0]->FKCod_TblEmbarque;
        
        echo json_encode($result);

    }

    // retorna los datos del home user
    function datos_home_user() {
        $fechaSplit = explode('-', $_GET['fecha_actual']);
        $result = ['ultimaProduccion' => [], 'rowOne' => [], 'rowTwo' => [], 'rowThree' => [], 'rowFour' => []];

        //Use register
        $ultimaProduccion = buscarultimaproduccion($_SESSION['conectado']->PKIbm)[0];
        $result['ultimaProduccion'] = $ultimaProduccion;

        //rowOne
        $result['rowOne']['historico'] = totalelaboradofinca($_SESSION['conectado']->PKIbm, $fechaSplit[0])[0];

        //rowTwo
        $ultimaProgramacion = buscarultimaprogramacion($_SESSION['conectado']->PKIbm)[0];
        $totalProgramado = totalprogramadofinca($ultimaProgramacion->PKCod, $_SESSION['conectado']->PKIbm);
        $ultimaProduccionPorCodigo = produccionporcodigo($ultimaProgramacion->PKCod, $_SESSION['conectado']->PKIbm);
        $result['rowTwo']['ultimaProgramacion']['codigoEmbarque'] = $ultimaProgramacion->PKCod;
        $result['rowTwo']['ultimaProgramacion']['totalProgramado'] = $totalProgramado->Total;
        $result['rowTwo']['ultimaProgramacion']['totalElaborado'] = isset($ultimaProduccionPorCodigo->totalElaborado) ? $ultimaProduccionPorCodigo->totalElaborado : 0;
        
        //rowThree
        $cajasElaboradasUltimaSemana = buscarelaboradosemana($ultimaProduccion->Cod_Embarque, $_SESSION['conectado']->PKIbm);
        foreach ($cajasElaboradasUltimaSemana as $c) {
            $result['rowThree']['cajasElaboradasUltimaSemana'][] = $c->elaboradoDia;
        }
        $nacionalElaboradasDia = [];
        for ($x = 1; $x < 8; $x++) {
            $data = buscarelaboradodianacional($ultimaProduccion->Cod_Embarque, $_SESSION['conectado']->PKIbm, $x);
            $nacionalElaboradasDia[] = $data->totalElaborado;
        }
        $result['rowThree']['nacionalElaboradasUltimaSemana'] = $nacionalElaboradasDia;

        //rowFour
        $semanaActual = semanaporfecha($_GET['fecha_actual']);
        $semanaWithInfo = info_semana($semanaActual->PKId);
        $result['rowFour']['ultimaAlineacion'] = veralineacion($ultimaProgramacion->PKCod, $_SESSION['conectado']->PKIbm);
        $result['rowFour']['ultimaSemanaInfo'] = $semanaWithInfo;

        //Final
        echo json_encode($result);
    }

    //
    function buscar_semana_verificar() {
        $idSemana = $_POST['idSemana'];
        $semana = buscarregistro($idSemana, 'PKId', 'tblsemanas', false)[0];
        $result = ['Semana' => $semana, 'Privileges' => $_SESSION['conectado']->FKId_TblTipoUsuario];
        echo json_encode($result);
    }

    //
    function listar_fincas_option() {
        $result = listarfincas();
        echo json_encode($result);
    }

    function ver_reporte() {
        return json_encode('todo ok');
    }

    //
    function buscar_cajas_programadas() {
        echo json_encode(totalprogramadofinca($_GET['codEmbarque'], $_SESSION['conectado']->PKIbm));
    }

    //
    function listar_embarques() { 
        $result = ['tblEmbarques' => '', 'tblSemanal' => '', 'cmbFincas' => '', 'cmbCajas' => '', 'cmbTipoFruta' => ''];
        $embarques = listarembarques();
        $result['tblEmbarques'] = $embarques;

        $produccion = listartblproduccion();
        $result['tblSemanal'] = $produccion;

        $fincas = listarfincas();
        $result['cmbFincas'] .= "<option>Seleccione...</option>";
        foreach ($fincas as $f) {
            $result['cmbFincas'] .= "
                <option value='$f->PKIbm'>$f->Nombre</option>
            ";
        }

        $cajas = cajasproduccion();
        foreach ($cajas as $c) {
            $result['cmbCajas'] .= "
                <option value='$c->PKCodigo'>$c->PKCodigo</option>
            ";
        }

        $tipoFruta = tipofrutaselect();
        $result['cmbTipoFruta'] .= "<option>Seleccione...</option>";
        foreach ($tipoFruta as $tp) {
            $result['cmbTipoFruta'] .= "
                <option value='$tp->PKId'>$tp->Descripcion</option>
            ";
        }
        echo json_encode($result);
        // print_r($result);
    }

    // 
    function generar_reportes() {
        $options = json_decode($_POST['options']);
        $statement = '';
        if ($options->reportType === 'tblSemanal') {
            if ($options->anho) {
                $statement = "
                    SELECT *, p.PKId as Id
                    FROM TblProduccion as p
                    INNER JOIN TblSemanas as s 
                    ON p.FKId_TblSemanas = s.PKId
                    INNER JOIN TblFincas as f
                    ON f.PKIbm = p.FKIbm_TblFincas
                    WHERE p.Anho_Produccion = $options->anho
                ";
                if ($options->from and $options->to) {
                    $convertData = [
                        'from' => explode(' ', $options->from),
                        'to' => explode(' ', $options->to),
                        'all' => []
                    ];
                    for ($x = $convertData['from'][1]; $x <= $convertData['to'][1]; $x++) { 
                        $convertData['all'][] = "'".$convertData['from'][0]." $x'";
                    }
                    $convertData['return'] = implode(', ', $convertData['all']);
                    $statement .= "AND s.N_Semana IN (" . ($convertData['return']) . ")";
                    /*if ($option['finca']) {
                    }*/
                }
            }
        }
        echo $statement . ' ------------------------------------------------ ';
        $result = generarReportes($statement);
        echo json_encode($result);
    }

            /*
                SELECT *, p.PKId as Id
                FROM TblDet_TblDet_TblProduccion as ddp, TblDet_TblProduccion as dp, TblProduccion as p, TblSemanas as s, TblFincas as f
                WHERE 
                AND ddp.N_CajasProducidas_Dia > 0
                AND ddp.FKId_TblDet_TblProduccion = dp.PKId
                AND dp.FKId_TblProduccion = p.PKId
                AND p.FKIbm_TblFincas = f.PKIbm
                AND p.FKId_TblSemanas = s.PKId
                AND ddp.FKCodigo_TblCajasProduccion IN ('1015', '1014', '1107', '1124')
                AND p.PKId IN
                (
                    SELECT p.PKId
                    FROM TblProduccion as p
                    INNER JOIN TblSemanas as s 
                    ON p.FKId_TblSemanas = s.PKId
                    INNER JOIN TblFincas as f
                    ON f.PKIbm = p.FKIbm_TblFincas
                    WHERE p.Anho_Produccion = '2020'
                    AND p.FKIbm_TblFincas = '80074'
                    AND s.N_Semana BETWEEN 'SEMANA 49' AND 'SEMANA 52'
                )

                quitar el botón de search

        if ($options['reportType'] === 'tblGeneral') {
            # code...
        }
        if ($options['reportType'] === 'tblRechazos') {
            # code...
        }
        if ($options['reportType'] === 'tblNacional') {
            # code...
        }*/

    //
    function cajas_tipofruta() {
        $cajas = buscarregistro($_GET['id'], 'FKId_TblTipoFruta', 'TblCajasProduccion', false);
        $result = '';
        foreach ($cajas as $c) {
            $result .= "
                <option value='$c->PKCodigo'>$c->PKCodigo</option>
            ";
        }
        echo $result;
    }

//  ACTUALIZAR ==================================================================================================================
    
    //
    function actualizar_empresa() {
        $empresa = array(
            'nit' => $_POST['empresa']['nit'],
            'nom' => $_POST['empresa']['nom'],
            'dir' => $_POST['empresa']['dir'],
            'tel' => $_POST['empresa']['tel']
        );
        $result = actualizarempresa($empresa);
        echo $result;
    }

    //
    function actualizar_caja() {
        $caja = array(
            'codigo_real' => $_POST['caja']['codigo_real'],
            'codigo' => $_POST['caja']['codigo'],
            'descripcion' => $_POST['caja']['descripcion'],
            'factor' => $_POST['caja']['factor'],
            'tipofruta' => $_POST['caja']['tipofruta']
        );
        $result = actualizarcaja($caja);
        echo $result;
    }

    //
    function editar_lote() {
        $result = editarlote($_POST['id_lote'], $_POST['area_neta'], $_POST['area_bruta']);
        echo $result;
    }

    //
    function change_privileges_user() {
        $idUser = $_POST['idUser'];
        $value = ($_POST['value'] == 1 ? 2 : 1);
        $result = changeprivilegesuser($idUser, $value);
        echo $result;
    }
    
    //
    function change_status_user() {
        $idUser = $_POST['idUser'];
        $value = ($_POST['value'] == 1 ? 2 : 1);
        $result = changestatussuser($idUser, $value);
        echo $result;
    }

    //
    function change_password() {
        $idUser = $_POST['idUser'];
        $password = $_POST['password'];
        $result = changepassword($idUser, $password);
        echo $result;
    }

    //
    function nueva_caja_select() {
        $codEmbarque = $_POST['codEmbarque'];
        $codigoCajas = json_decode($_POST['codigoCajas']);
        $result = [];
        foreach ($codigoCajas as $cc) {
            $infoCaja = buscarcaja($cc);
            $infoCaja->Programacion = buscarprogramacion($cc, $codEmbarque);
            array_push($result, $infoCaja);
        }
        echo json_encode($result);
    }

//  ELIMINAR ==================================================================================================================
    //
    function eliminar() {
        $key = $_REQUEST['key'];
        $campo = $_REQUEST['campo'];
        $tabla = $_REQUEST['tabla'];
        $eliminar = eliminar_s($key, $campo, $tabla);
        echo $eliminar;
    }   

    //
    function eliminar_embarque() {
        $codEmbarque = $_POST['codEmbarque'];
        $hasProduccion = buscarregistro($codEmbarque, 'Cod_Embarque', 'TblProduccion', false);
        $hasDetalleEmbarque = buscarregistro($codEmbarque, 'FKCod_TblEmbarque', 'TblDet_TblEmbarque', false);
        $hasEstimativo = buscarregistro($codEmbarque, 'FKCod_TblEmbarque', 'TblEstimativo', false);
        $hasProduccion = count($hasProduccion) > 0 ? false : true;
        if ($hasProduccion) {
            $hasDetalleEmbarque = count($hasDetalleEmbarque) > 0 ? eliminar_s($codEmbarque, 'FKCod_TblEmbarque', 'TblDet_TblEmbarque') : true;
            $hasEstimativo = count($hasEstimativo) > 0 ? eliminar_s($codEmbarque, 'FKCod_TblEmbarque', 'TblEstimativo') : true;
            if ($hasDetalleEmbarque and $hasEstimativo) {
                eliminar_s($codEmbarque, 'PKCod', 'TblEmbarque');
                echo true;
            } else {
                echo false;
            }
        } else {
            echo false;
        }
    }

    // Elimina toda la producción y sus detalles
    function eliminar_produccion($codEmbarque, $ibmFinca) {
        $tblProduccion = buscarregistro($codEmbarque, 'Cod_Embarque', 'TblProduccion', "FKIbm_TblFincas = $ibmFinca");
        $tblProduccion = (count($tblProduccion) == 1 ? $tblProduccion[0] : null);
        if ($tblProduccion !== null) {
        // Eliminar racimos y sus detalles
            $tblRacimos = buscarregistro($tblProduccion->FKId_TblRacimos, 'PKId', 'TblRacimos', false)[0];
            $tblDet_TblRacimos = buscarregistro($tblRacimos->PKId, 'FKId_TblRacimos', 'TblDet_TblRacimos_TblDias', false);
            foreach ($tblDet_TblRacimos as $dr) {
                eliminar_s($dr->PKId, 'FKId_TblDet_TblRacimos_TblDias', 'TblDet_TblDet_TblRacimos_TblDias');
            }
            eliminar_s($tblRacimos->PKId, 'FKId_TblRacimos', 'TblDet_TblRacimos_TblDias');
        // Eliminar mercado nacional - cargue y sus detalles
            $tblNacional = buscarregistro($tblProduccion->FKId_TblMercadoNacional, 'PKId', 'TblMercadoNacional', false)[0];
            eliminar_s($tblNacional->PKId, 'FKId_TblMercadoNacional', 'TblDet_TblMercadoNacional');
            // TblCajasPlataforma
            eliminar_s($tblNacional->PKId, 'FKId_TblMercadoNacional', 'TblCajasPlataforma');

            $tblCargue = buscarregistro($tblProduccion->Cod_Embarque, 'FKCod_TblEmbarque', 'TblCargue', "FKIbm_TblFincas = $ibmFinca");
            foreach ($tblCargue as $c) {
                eliminar_s($c->PKId_Cargue, 'PKId_Cargue', 'TblCargue');
            }

        // Eliminar producción y sus detalles
            $tblDet_TblProduccion = buscarregistro($tblProduccion->PKId, 'FKId_TblProduccion', 'TblDet_TblProduccion', false);
            foreach ($tblDet_TblProduccion as $dp) {
                eliminar_s($dp->PKId, 'FKId_TblDet_TblProduccion', 'TblDet_TblDet_TblProduccion');
            }
            eliminar_s($tblProduccion->PKId, 'FKId_TblProduccion', 'TblDet_TblProduccion');

        // Eliminar claves principales
            if (
                eliminar_s($tblProduccion->PKId, 'PKId', 'TblProduccion') and
                eliminar_s($tblProduccion->FKId_TblEmbolse, 'PKId', 'TblEmbolse') and
                eliminar_s($tblRacimos->PKId, 'PKId', 'TblRacimos') and
                eliminar_s($tblNacional->PKId, 'PKId', 'TblMercadoNacional')
            ) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

// ------------------------------------------------------------------------------------------
    if(isset($_REQUEST['op']) and isset($_SESSION['conectado'])){
        $op = $_REQUEST['op'];
        switch ($op) {

    //Métodos de crear
            case 'nuevafinca':
                nueva_finca();
                break;
            
            case 'guardar_nuevo_lote':
                guardar_nuevo_lote();
                break;
            
            case 'guardarempresa':
                nueva_empresa();
                break;
            
            case 'guardarcaja':
                guardar_caja();
                break;

            //Crea embarque y muestra las cajas en la vista de programar embarque
            case 'crear_embarque':
                crear_embarque();
                break;
            
            case 'anhonuevo':
                anho_nuevo();
                break;
            
            //Guarda los datos de la programación y el estimativo de la semana
            case 'guardar_programacion':
                guardar_programacion();
                break;

            // 
            case 'guardarProduccion':
                guardar_produccion();
                break;

            //
            case 'create_user':
                create_user();
                break;

    //Métodos de mostrar
            case 'verify_ibmfinca':
                verify_ibmfinca();
                break;

            case 'listarfincas':
                listar_fincas();
                break;

            case 'ultimo_lote':
                ultimo_lote();
                break;

            case 'listarempresas':
                listar_empresas();
                break;

            case 'select_rs':
                select_rs();
                break;

            case 'cajasproduccion':
                listar_cajas();
                break;
            
            case 'listarlotes':
                listar_lotes();
                break;
            
            case 'buscarfinca':
                buscar_finca();
                break;

            case 'buscarlote':
                buscar_lote();
                break;

            case 'mostrarempresa':
                buscar_empresa();
                break;
            
            //Carga los option con las semanas por año
            case 'cargarsemanaspa':
                cargar_semanaspa();
                break;

            //Carga los datos de la empresa a editar
            case 'editarempresa':
                editar_empresa();
                break;
            
            //Carga los datos de la caja a editar
            case 'buscarcaja':
                buscar_caja();
                break;

            //Carga los datos de acuerdo al filtro en ver_elaboracion
            case 'verfiltrocaja':
                ver_filtrocaja();
                break;

            //Carga las fincas para el select de ver_elaboración
            case 'fincasve':
                fincas_ve();
                break;
    
            //Carga la elaboración de cajas de acuerdo a los filtros
            case 'verelaboracion':
                ver_elaboracion();
                break;
                
            //Carga cajas para select de programarembarque
            case 'cargarcajas_select':
                cargarcajas_select();
                break;
            
            //Carga tipo de fruta para select nuevo o editar
            case 'tipofruta-select':
                tipofruta_select();
                break;
            
            //
            case 'cargardatos_racimos_ip':
                echo json_encode(info_semana($_POST['id_semana']));
                break;
            
            // Verifica si existe el código de embarque
            case 'codEmbarque_verificar':
                buscar_registro();
                break;

            // Carga las cajas para ingresar producción según la finca
            case 'cargar_cajas_ip':
                cargar_cajas_ip();
                break;

            // 
            case 'cargar_produccion_ip':
                cargar_produccion_ip();
                break;

            // 
            case 'ver_alineacion':
                ver_alineacion();
                break;

            //
            case 'cajas_semana_anterior':
                cajas_semana_anterior();
                break;

            //
            case 'listar_usuarios':
                listar_usuarios();
                break;

            //
            case 'cargar_programacion':
                cargar_programacion();
                break;

            //
            case 'datos_flot':
                datos_flot();
                break;

            //
            case 'datos_home':
                datos_home();
                break;
                
            // Busca semana
            case 'datos_home_user':
                datos_home_user();
                break;

            // Busca semana
            case 'buscar_semana_verificar':
                buscar_semana_verificar();
                break;
            
            //
            case 'listar_fincas_option':
                listar_fincas_option();
                break;

            //
            case 'buscar_cajas_programadas':
                buscar_cajas_programadas();
                break;
            
            //
            case 'listarembarques': 
                listar_embarques();
                break;

            //
            case 'generar_reportes':
                generar_reportes();
                break;

            //
            case 'cajas_tipofruta':
                cajas_tipofruta();
                break;

                
    //Metodos de actualizar
            case 'actualizarempresa':
                actualizar_empresa();
                break;
            
            case 'actualizarcaja':
                actualizar_caja();
                break;
            
            case 'editarlote':
                editar_lote();
                break;

            case 'change_privileges_user':
                change_privileges_user();
                break;
                
            case 'change_status_user':
                change_status_user();
                break;  

            case 'nueva_caja_select':
                nueva_caja_select();
                break;
            
            case 'change_password':
                change_password();
                break;
            
    //Métodos de eliminar
            case 'eliminar':
                eliminar();
                break;

            case 'eliminarempresa':
                eliminar();
                break;

            case 'eliminarcaja':
                eliminar();
                break;

            case 'eliminarembarque':
                eliminar_embarque();
                break;

            case 'eliminarproduccion':
                echo (eliminar_produccion($_POST['codEmbarque'], $_SESSION['conectado']->PKIbm));
                break;
    // Defecto
            // Método de asignación de ibmFinca only user admin
            case 'assign_ibmfinca':
                $_SESSION['conectado']->PKIbm = $_GET['ibmFinca'];
                echo $_SESSION['conectado']->PKIbm;
                break;

            default:
                header("Location:../index.php");
                break;
        }
    }
?>