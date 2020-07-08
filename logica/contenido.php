<?php

    require_once "../datos/statements.php";
    
//  CREAR ===========================================================================================================
    //
    function nueva_finca(){
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
    function nueva_empresa(){
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
    function guardar_caja(){
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
    function crear_embarque(){
        $datos = json_decode($_POST['datos']);
        $result = crearembarque($datos->cod_embarque, $datos->ano, $datos->id_semana);
        // print_r($result);
        $vista = array();
        if ($result != false) {
            //aquí va todo lo que se va poner en la vista para asignar las cajas
            $vista['embarque'] = $datos->descripcion_semana . " del " . $datos->ano;
            $vista['cod_embarque'] = $result->PKCod;
            //Tabla cajas lleva todos los campos a usar en la tabla
            for ($x=0; $x < count($datos->codigocajas) ; $x++) { 
                $vista['cajas'][$x] = buscarcaja($datos->codigocajas[$x]);
            }
            // $vista['cod_embarque'] = "EMB-202001";
            echo json_encode($vista);
        }else {
            echo $result;
        }
    }

    //generar semanas
    function anho_nuevo(){
        $anhos = buscarregistro("SEMANA 52", "N_Semana", "tblsemanas");
        $ultimo_anho = end($anhos);
        $verificar_anho = buscarregistro($_POST["anhonuevo"]+1, "Anho_generado", "tblregistrosemanas");
        if (isset($verificar_anho[0])) {
            echo "No se creó";
        }else {
            $fechai = date('Y-m-d', strtotime($ultimo_anho->Fecha_Inicio.'+ 1 week'));
            $fechaf = date('Y-m-d', strtotime($ultimo_anho->Fecha_Fin.'+ 1 week'));
            $result = anhonuevo($fechai, $fechaf, $ultimo_anho->Anho+1, $ultimo_anho->FKId_TblCintas+1);
            if ($result === true) {
                echo "Ok";
            }else {
                echo "Err";
            }
        }
    }

    //Guarda la programación y el estimativo de la semana
    function guardar_programacion(){
        $result = false;
        $datos = array();
        $datos = json_decode($_POST['jsonprogramacion']);
        foreach ($datos->cajas as $c){
            $result = guardarprogramacion($datos->cod_embarque, $c->ibm_finca, $c->codigo_caja, $c->cantidad);
        }
        foreach ($datos->estimativo  as $e){
            $result = guardarestimativo($e->finca, $e->premiun, $e->especial, $datos->cod_embarque);
        }
        echo $result;
    }

//  BUSCAR =================================================================================================================

    //
    function buscar_registro() {
        $key = $_REQUEST['key'];
        $campo = $_REQUEST['campo'];
        $tabla = $_REQUEST['tabla'];
        $result = buscarregistro($key, $campo, $tabla);
        echo json_encode($result);
    }

    //Obtiene los datos de las fincas desde el archivo /datos/statements.php para enviarlos de vuelta al archivo contenido.js
    function listar_fincas(){
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
                " . $f->area_neta . "
                </td>
                <td>
                " . $f->area_bruta . "
                </td>
                <td dato='$f->PKIbm'>
                    <a href='#editar_finca' class='notika-icon notika-edit' title='Editar'></a> - 
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

    //
    function listar_empresas(){
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
                    <a href='#eliminar_empresa' class='notika-icon notika-close' title='Eliminar' onclick='eliminarempresa($e->PKNit)'></a>
                </td>
            </tr>";
        }
    }

    //Busca los datos para cargar el select_rs en la capa web
    function select_rs(){
        $select_rs = listarempresas();
        echo "<option value='0'>Seleccione...</option>";
        foreach ($select_rs as $s) {
            echo "<option value='". $s->PKNit ."'>". $s->Nombre ."</option>";
        }
    }

    //
    function listar_cajas(){
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
                        . $c->FactorConversion .
                    "</td>
                    <td>"
                        . $c->TipoFruta .
                    "<td>
                        <a href='#editar_caja' codigo='$c->PKCodigo' class='notika-icon notika-edit' title='Editar' data-toggle='modal' data-target='#modal-ec'></a> - 
                        <a href='#ver_elaboracion' codigo='$c->PKCodigo' class='notika-icon notika-menus' title='Ver Elaboración' data-toggle='modal' data-target='#modal-ve'></a> - 
                        <a href='#eliminar_caja' class='notika-icon notika-trash' title='Eliminar' onclick=eliminarcaja($c->PKCodigo)></a>
                    </td>
                </tr>";
        }
    }

    //
    function listar_lotes(){
        $lotes = listarlotes($_POST['ibm_l']);
        foreach ($lotes as $l) {
            echo "
                <tr>
                    <td>"
                        . $l->Lote .
                    "</td>
                    <td>"
                        . $l->Area_Neta .
                    "</td>
                    <td>"
                        . $l->Area_Bruta .
                    "</td>
                    <td>
                        <a href='#editar_lote' id='$l->PKId' data-toggle='modal' data-target='#editarlote' class='notika-icon notika-edit' title='Editar'></a> - 
                        <a href='#eliminar_lote' class='notika-icon notika-close' title='Eliminar'></a>
                    </td>
                </tr>";
        }
    }
    
    //Buscar Finca por ibm o por nombre
    function buscar_finca(){
        if (isset($_GET['nombre_finca'])){
            $finca = buscarregistro($_GET['nombre_finca'], "Nombre", "TblFincas");
            echo $finca[0]->PKIbm;
        }else if (isset($_POST['ibm_f'])){
            $finca = buscarfinca($_POST['ibm_f']);
            echo $finca->Nombre;
        }
    }

    //Buscar lote por id
    function buscar_lote(){
        $result = buscarlote($_POST['id_lote']);
        $lote = array(
            'lote' => $result->Lote,
            'neta' => $result->Area_Neta,
            'bruta' => $result->Area_Bruta,
        );
        echo json_encode($lote);
    }

    //Buscar empresa por ibm finca
    function buscar_empresa(){
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
    function editar_empresa(){
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
    function buscar_caja(){
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
    function ver_filtrocaja(){
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
    function fincas_ve(){
        $fincas = listarfincas();
        echo "<option value='0'>SELECCIONE LA FINCA...</option>";
        foreach($fincas as $f){
            echo "
                <option value='$f->PKIbm'>$f->Nombre</option>
            ";
        }
    }

    //Muestra los datos del modal ver_elaboracion en base al filtro
    function ver_elaboracion(){
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
            }else{
                echo false;
            }
        }else if ($filtros->tipo == 'anual') {
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
            }else{
                echo false;
            }
        }else if ($filtros->tipo == 'historico') {
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
            }else{
                echo false;
            }
        }
    }

    //Carga los option con las semanas para el select en programar embarque
    function semanas_pe(){
        $semanas = cargarsemanas_pe($_POST['ano_pe']);
        foreach ($semanas as $s) {
            echo "<option value='$s->PKId'>$s->N_Semana</option>";
        }
    }

    //
    function cargarcajas_select(){
        $cajas = cajasproduccion();
        foreach ($cajas as $c) {
            echo "
                <option value='$c->PKCodigo'>$c->PKCodigo</option>
            ";
        }
        //aquí mismo cargar cajas en el select de la semana anterior, limpia y llena nuevamente el select con 
        //las cajas de la semana anterior, 
    }

    //
    function tipofruta_select(){
        $tipofruta = tipofrutaselect();
        //verifica si la petición es editar para enviar los option con el tipo de fruta selected
        if (!isset($_POST['tipofruta_editar'])) {
            echo "<option value='0'>Seleccione...</option>";
            foreach ($tipofruta as $t){
                echo "
                    <option value='$t->PKId'>$t->Descripcion</option>
                ";
            }
        }else {
            foreach ($tipofruta as $t) {
                if ($t->PKId == $_POST['tipofruta_editar']) {
                    echo "
                        <option value='$t->PKId' selected='true'>$t->Descripcion</option>
                    ";
                }else{
                    echo "
                        <option value='$t->PKId'>$t->Descripcion</option>
                    ";
                }
            }
        }
    }

    //
    function cargardatos_racimos_ip() {
        $ids = array(
            'id1' => $_POST['id_semana']+0,
            'id2' => ($_POST['id_semana']+1),
            'id3' => ($_POST['id_semana']-1),
            'id4' => ($_POST['id_semana']-2)
        );
        $datos['semanas'] = cargarcintas($ids);
        echo json_encode($datos);
    }

    // futuro uso para cajas en ingresar producción
    /* function cargarembarques_select(){
        $result = cargarembarques();
    } */


//  ACTUALIZAR ==================================================================================================================
    
    //
    function actualizar_empresa(){
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
    function actualizar_caja(){
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
    function editar_lote(){
        $result = editarlote($_POST['id_lote'], $_POST['area_neta'], $_POST['area_bruta']);
        echo $result;
    }
    
//  ELIMINAR ==================================================================================================================
    //
    function eliminar(){
        $key = $_REQUEST['key'];
        $campo = $_REQUEST['campo'];
        $tabla = $_REQUEST['tabla'];
        $eliminar = eliminar_s($key, $campo, $tabla);
        echo $eliminar;
    }   


    //valida el ingreso al archivo desde la petición del archivo logica/contenido.js 
    if(isset($_REQUEST['op'])){
        $op = $_REQUEST['op'];
        switch ($op) {

    //Métodos de crear
            case 'nuevafinca':
                nueva_finca();
                break;
            
            case 'guardarempresa':
                nueva_empresa();
                break;
            
            case 'guardarcaja':
                guardar_caja();
                break;

            //Crea embarque y muestra las cajas en la vista de programar embarque
            case 'crearembarque':
                crear_embarque();
                break;
            
            case 'anhonuevo':
                anho_nuevo();
                break;
            
            //Guarda los datos de la programación y el estimativo de la semana
            case 'guardarprogramacion':
                guardar_programacion();
                break;

    //Métodos de mostrar
            case 'listarfincas':
                listar_fincas();
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
            
            //Carga las semanas para el select de programarmebarque
            case 'semanaspe':
                semanas_pe();
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
                cargardatos_racimos_ip();
                break;
            
            // Verifica si existe el código de embarque
            case 'codEmbarque_verificar':
                buscar_registro();
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
                eliminar();
                break;


    // Defecto
            default:
                header("Location:../index.php");
                break;
        }
    }
?>