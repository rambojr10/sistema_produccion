// FORMATO DATATABLE CAJAS -----------------------------------------------------------------
    function data_cajas(element) {
        $("#"+element).DataTable({
            language: {
                "processing":       "Procesando...",
                "search":           "Buscar:",
                "lengthMenu":       "Ver _MENU_ elementos",
                "info":             "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty":        "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered":     "(filtrados de _MAX_ elementos en total)",
                "infoPostFix":      "",
                "loadingRecords":   "Cargando...",
                "zeroRecords":      "No se encontraron resultados",
                "emptyTable":       "Ningún dato disponible en esta tabla",
                "paginate": {
                    "first":      "Primero",
                    "previous":   "Último",
                    "next":       "Siguente",
                    "last":       "Anterior"
                },
                "aria": {
                    "sortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            },
            "bDestroy": true
        });
    }
    
// MOSTRAR CAJAS -------------------------------------------------------------------------   
    
    //Muestra los datos en el modal de la caja a editar
    $(document).on("click", "[href='#editar_caja']", function() {
        var codigo = $(this).attr("codigo");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'buscarcaja', codigo: codigo},
            cache: false,
            success: function(res) {
                var caja = JSON.parse(res);
                $("[name='codigo_caja']").val(caja.codigo);
                $("[name='codigo_caja']").attr("codigo_real", caja.codigo);
                $("[name='descripcion_caja']").val(caja.descripcion);
                $("[name='factor_caja']").val(caja.factor);
                tipofruta_select("editarcaja", caja.tipofruta); //Carga el tipo de fruta para modal editar caja
            }
        });
    });

    //Muestra la elaboración de una caja en específico
    $(document).on("click", "[href='#ver_elaboracion']", function (e){
        e.preventDefault();
        $("#resultado_ve").html("");
        if ($("#cbsemanal").is(":checked") || $("#cbanual").is(":checked") || $("#cbhistorico").is(":checked")){
            $("#form_ve").html("");
            $("#cbsemanal").prop('checked', false);
            $("#cbanual").prop('checked', false);
            $("#cbhistorico").prop('checked', false);
        }
       
        // -------------------------------------------
        var codigocaja = $(this).attr("codigo");
        $("#nombre_caja").html(
            $(this).parents("tr").find("td").eq(1).html() 
            + " - <span class='label label-primary'>" + 
            $(this).parents("tr").find("td").eq(3).html()
            + "</span>"
        );
        $("#codigo_ve").html(codigocaja);
        const op = new FormData();
        op.append("op", "fincasve");
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.text();
            }else{
                throw "No se pueden cargar los datos";
            }
        })
        .then(res => {
            $("[name='fincas_ve']").html(res);
        });
    });
    
    
//GUARDAR Y ACTUALIZAR CAJAS --------------------------------------------------------------------------------
    //actualizar datos - hacer validación de campos vacíos
    //guarda o actualiza de acuerdo al parámetro enviado desde el llamdo de la función
    function cajas_ga(op, codigo) {
        var text = "";
        var button = "";
        if(op == "actualizarcaja") {
            var caja = {
                codigo_real: codigo,
                codigo: $("[name='codigo_caja']").val(), 
                descripcion: $("[name='descripcion_caja']").val(), 
                factor: $("[name='factor_caja']").val(),
                tipofruta: $("[name='tipofruta_caja']").val()
            }
            text =  "¡El registro será actualizado!";
            button = "Si, actualizar!";
            alerta = {
                tipo: 'Actualización',
                success:{
                    descripcion: 'Registro actualizado correctamente'
                },
                error:{
                    descripcion: 'No se pudo actualizar el registro'
                },
            };
        } else if(op = "guardarcaja") {
            var caja = {
                codigo: $("[name='codigo_caja_nueva']").val(), 
                descripcion: $("[name='descripcion_caja_nueva']").val(), 
                factor: $("[name='factor_caja_nueva']").val(),
                tipofruta: $("[name='tipofruta_caja_nueva']").val()
            }
            text = "¡Será agregado un nuevo registro!";
            button = "Si, agregar!";
            alerta = {
                tipo: 'Nuevo registro',
                success: {
                    descripcion: 'Nuevo registro agregado satisfactoriamente'
                },
                error: {
                    descripcion: 'No se ha podido registrar los datos'
                },
            };
        }
        swal({
            title: 'Está seguro?',
            text: text,
            type: "warning",
            showCancelButton: true,
            confirmButtonText: button,
            cancelButtonText: "No, cancelar!",
        }).then(isConfirm => {
            if(isConfirm) {
                $.post({
                    url: '../logica/contenido.php',
                    data: {op: op, caja: caja},
                    cache: false,
                    success: function(res) {
                        if(res == true) {
                            swal(alerta.tipo, alerta.success.descripcion, "success");
                            $("#tblcajasproduccion").dataTable().fnDestroy();
                            $("#cajasproduccion").load("../capa_web/tablas/tabla_cajasproduccion.php?op=cajasproduccion");
                        } else {
                            swal(alerta.tipo, alerta.error .descripcion, "error");
                        }
                    }
                });
            }
        })
    } 

    $(document).on("click", "[name='btnActualizar_caja']", function() {
        //obtiene el código a actualizar previamente guardado
        var codigo = $("[name='codigo_caja']").attr("codigo_real");
        cajas_ga("actualizarcaja", codigo);
    });

    $(document).on("submit", "#form_nuevacaja", function(e) {
        e.preventDefault();
        cajas_ga("guardarcaja", 0);
    });

//ELIMINAR CAJA ------------------------------------------------------------------------------------------------
    function eliminarcaja(codigo) {
        swal({
            title: "Está seguro?",
            text: "¡Se eliminará permanentemente el registro!",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Si, eliminar!",
            cancelButtonText: "No, cancelar!",
        }).then(function(isConfirm) {
            if(isConfirm) {
                $.post({
                    url: '../logica/contenido.php',
                    data: {op: 'eliminarcaja', key: codigo, campo: 'PKCodigo', tabla: 'tblcajasproduccion'},
                    cache: false,
                    success: function (res) {
                        if (res == true) {
                            swal("Eliminación", "Registro eliminado correctamente.", "success");
                            $.post({
                                url: '../logica/contenido.php',
                                data: {op: 'cajasproduccion'},
                                cache: false,
                                success: function(res) {
                                    $("#tblcajasproduccion").dataTable().fnDestroy();
                                    $("#cajasproduccion").load("../capa_web/tablas/tabla_cajasproduccion.php?op=cajasproduccion");
                                }
                            });
                        } else {
                            swal("Eliminación", "Error al intentar eliminar el registro.", "error");
                        }
                    }
                });
            }
        });
    }

// COMPLEMENTOS ------------------------------------------------------------------------------------------

    //Modal ver_elaboracion
    $(document).on('change', "#cbsemanal", function () {
        $("#resultado_ve").html("");
        $("#cbanual").prop('checked', false);
        $("#cbhistorico").prop('checked', false);
        if ($(this).is(':checked')){
            const op = new FormData();
            op.append('op', 'verfiltrocaja');
            op.append('filtro', 'semanal');
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.text();
                else
                    throw "No se pueden cargar los datos, S";
            })
            .then(res => {
                $("#form_ve").html(res)
            });
        }else{
            $("#form_ve").html("");
        }
    });

    $(document).on('change', "#cbanual", function () {
        $("#resultado_ve").html("");
        $("#cbsemanal").prop('checked', false);
        $("#cbhistorico").prop('checked', false);
        if ($(this).is(":checked")) {
            const op = new FormData();
            op.append('op', 'verfiltrocaja');            
            op.append('filtro', 'anual');
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.text();
                else
                    throw "No se pueden cargar los datos";
            })
            .then(res => {
                $("#form_ve").html(res);
            });
        } else {
            $("#form_ve").html("");
        }
    });

    $(document).on('change', "#cbhistorico", function () {
        $("#resultado_ve").html("");
        $("#cbsemanal").prop('checked', false);
        $("#cbanual").prop('checked', false);
        $("#form_ve").html("");
    });

    // Mostrar elaboración de cajas por filtro
    $(document).on('click', '#btnbuscar_ve', function (e) {
        e.preventDefault();
        //Inicializo vairables de almacenamiento de datos temporales
        var filtro = "";
        var finca = $("select[name='fincas_ve']").val();
        var semana = "";
        var ano = "";
        //Verifico cual de los checkbox está seleccionado y asigno los valores de los campos a las variables
        if ($("#cbsemanal").is(":checked")) {
            filtro = "semanal";
            semana = $("[name='semana-ve']").val();
            ano = $("[name='ano_semana-ve']").val();
        }else if ($("#cbanual").is(":checked")){
            filtro = "anual";
            ano = $("[name='ano_anual']").val();
        }else if ($("#cbhistorico").is(":checked")){
            filtro = "historico";
        }

        //Verifico si se ha seleccionado una finca
        if (finca != 0) {
            //Lanzo la función de acuerdo al tipo de filtro a aplicar
            switch (filtro) {
                case 'semanal':
                    //valido que los campos tengan datos
                    if (semana != "" && ano != "")
                        buscar_ve('semanal');
                    else
                        swal("Verificación", "Faltan campos por llenar, por favor verifique.", "error");
                    break;
                
                case 'anual':
                    //valido que los campos tengan datos
                    if (ano != "")
                        buscar_ve('anual');
                    else
                        swal("Verificación", "Faltan campos por llenar, por favor verifique.", "error");
                    break;

                case 'historico':
                    buscar_ve('historico');
                    break;
            
                default:
                    swal("Verificación", "Faltan campos por llenar, por favor verifique.", "error");
                    break;
            }
        }
            
        //funcion que envía los datos de acuerdo a lo anterior para mostrar lo obtenido
        function buscar_ve(tipo) {
            const op = new FormData();
            const filtros = {
                finca: finca,
                tipo: tipo,
                semana: semana,
                ano: ano,
                codigocaja: $("#codigo_ve").html()
            };
            const jfiltros = JSON.stringify(filtros);
            op.append("op", "verelaboracion");
            op.append("filtros", jfiltros);
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                }else{
                    throw "No se pueden cargar los datos";
                }
            })
            .then(res => {
                if (res != false){
                    $("#resultado_ve").html(res);
                }else{
                    swal("Ver Elaboración", "No se encuentran los datos solicitados", "error");
                }
            });
        }
        
    });
        
    //Carga el tipo de fruta en funcion de la variable x que recibe el lugar donde se asignan los option
    //si se llama desde editar recibe el id del tipo de fruta sino recibe null
    function tipofruta_select(x, tipofruta_editar) { 
        const op = new FormData();
        op.append("op", "tipofruta-select");
        if (tipofruta_editar != null)
            op.append("tipofruta_editar", tipofruta_editar);
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok)
                return response.text();
            else
                throw "No se pueden cargar los datos";
        })
        .then(res => {
            //verifica de donde se llama el método y asigna los datos según
            if (x == 'nuevacaja')
                $("[name='tipofruta_caja_nueva']").html(res);
            else if (x == 'editarcaja')
                $("[name='tipofruta_caja']").html(res);
            
            const codigoCaja = document.querySelector("[name='codigo_caja']");
            codigoCaja.addEventListener('input', function () {
                if(this.value.length > 5)
                    this.value = this.value.slice(0,5);
            });
        });
    }

    //Carga el tipo de fruta para modal nueva caja
    $(document).on("click", "#modal_nuevacaja", function() {
        $('[name="codigo_caja_nueva"]').val('');
        $('[name="descripcion_caja_nueva"]').val('');
        $('[name="factor_caja_nueva"]').val('');
        tipofruta_select("nuevacaja", null);
    });

    //cuando se digite un año en el campo ano_semana-ve del filtro semanal se cargan las semanas del año digitado
    $(document).on("input", "[name='ano_semana-ve']", function(){
        if ($(this).val().length == 4) {
            const op = new FormData();
            op.append("op", "cargarsemanaspa");
            op.append("anho", $(this).val());
            fetch("../logica/contenido.php", {
                method: "POST",
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.text();
                else
                    throw "No se ha podido completar la acción";
            })
            .then(res => {
                $("[name='semana-ve']").html(res);
            });
        } else {
            $("[name='semana-ve']").html("");
        }
    });
