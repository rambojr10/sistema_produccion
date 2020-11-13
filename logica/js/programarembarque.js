//CONTROL DE VISTAS EN PROGRAMAR EMBARQUE --------------------------------------------------------------------

    //Muestra la vista para seleccionar las cajas del embarque y verifica si el embarque a generar ya existe...+
    $(document).on("click", "[href='#seleccionar_pe']", function(e) {
        e.preventDefault();
        if ($("#semanas_pe").val() != null) {
            let semana_pe = $("#semanas_pe option:selected").text();
            let num_semana_pe = semana_pe.split(" ");
            let anho_pe = $('#anho_pe').data('anho');
            let codEmbarque = `EMB-${anho_pe+num_semana_pe[1]}`;

            // -------------------------------------------------------------------------
            const op = new FormData();
            op.append("op", "codEmbarque_verificar");
            op.append("key", codEmbarque);
            op.append("campo", "PKCod");
            op.append("tabla", "TblEmbarque");
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.json();
                else
                    throw "No se puede obtener los datos";
            })
            .then(res => {

                console.log('seleccionar', res)

                if (res.length > 0) {
                    swal({
                        title: "¡Datos pendientes!",
                        text: "El embarque ya existe, ¿desea cargarlo?",
                        type: "question",
                        showCancelButton: true,
                        confirmButtonText: "Si, cargar!",
                        cancelButtonText: "No, cancelar!",
                        reverseButtons: true
                    }).then((isConfirm) => {
                        if(isConfirm){
                            console.log('resExiste', res);
                            // Ejecutar una función que también se utiliza en seleccionar semana anterior
                            cargar_embarque_pe(codEmbarque, semana_pe, anho_pe);
                        }
                    });
                } else {
                    $("#seleccion-pe").removeAttr("hidden");
                    cargar_cajas_pe(false);
                }
            });
        }else {
            swal("Seleccionar Cajas", "Debe seleccionar una semana a programar", "error");
        }
    });

    //Mostrar vista con semanas disponibles para programar embarque
    $(document).on("click", "#btnBuscar_pe", function (e) {
        e.preventDefault();
        $('#semanas_pe').html('');
        let anho_pe = $('#anho_pe').val();
        let anho_posible = new Date();
        if  (anho_pe == anho_posible.getFullYear() || anho_pe == (anho_posible.getFullYear()+1)) {
            const op = new FormData();
            op.append('op', 'cargarsemanaspa');
            op.append('anho', anho_pe);
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.text();
                else
                    throw "Error al cargar los datos";
            })
            .then(res => {
                if (res != "") {
                    $("#semanas_pe").html(res);
                    //Seteo el año 
                    $("#anho_pe").data("anho", anho_pe);
                    $.notify({
                        icon: "fa fa-check-circle",
                        title: "<strong>Buscar semanas: </strong>",
                        message: "Semanas cargadas correctamente"
                    },{
                        type: "success"
                    });
                } else {
                    $.notify({
                        icon: "fa fa-times",
                        title: "<strong>Buscar semanas: </strong>",
                        message: "No se han podido cargar las semanas"
                    },{
                        type: "danger"
                    });
                }
            });
        } else {
            $.notify({
                icon: "fa fa-times",
                title: "<strong>Buscar semanas: </strong>",
                message: "Fuera de rango"
            },{
                type: "danger"
            });
        }
    });

    // Agrega las cajas seleccionadas de la semana anterior
    $(document).on('click', "[href='#semana_anterior_pe']", function(e) {
        e.preventDefault();
        if ($("#semanas_pe").val() != null) {
            let semana_pe = $("#semanas_pe option:selected").text();
            $('#semanas_pe').data('idSemana', $('#semanas_pe').val());
            let num_semana_pe = semana_pe.split(" ");
            let anho_pe = $("#anho_pe").data('anho');
            let codEmbarque = `EMB-${anho_pe+num_semana_pe[1]}`;

            const op = new FormData();
            op.append("op", "codEmbarque_verificar");
            op.append("key", codEmbarque);
            op.append("campo", "PKCod");
            op.append("tabla", "TblEmbarque");
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok) 
                    return response.json()
                else
                    throw "No se ha podido cargar los datos SA"
            })
            .then(res => {

                if (res.length == 0) {
                    const op = new FormData();
                    op.append('op', 'cajas_semana_anterior');
                    op.append('codEmbarque', `EMB-${anho_pe+num_semana_pe[1]-1}`);
                    fetch('../logica/contenido.php', {
                        method: 'POST',
                        body: op
                    })
                    .then(response => {return response.json()})
                    .then(res => {
                        if (res.length > 0) {
                            $("#seleccion-pe").removeAttr("hidden");
                            let cajasSemanaAnterior = [];
                            res.forEach((element) => {
                                cajasSemanaAnterior.push(element.PKCodigo)
                            });
                            cargar_cajas_pe(cajasSemanaAnterior);
                        } else {
                            swal('Seleccionar cajas', 'No existe una selección anterior', 'error')
                        }
                    });
                } else { //si el embarque ya existe, se carga
                    // Envía el código del embarque y la descripción de la semana
                    cargar_embarque_pe(codEmbarque, semana_pe, anho_pe);
                }
            });
        }
    });

//MOSTRAR DATOS -----------------------------------------------------------------------------------------------    
    
    //Carga las cajas para mostrarlas en el select de programar embarque
    function cargar_cajas_pe(cajasSemanaAnterior){
        fetch('../logica/contenido.php?op=cargarcajas_select')
        .then(response => response.text())
        .then(res => {
            $("#select-sc-pe").html(res);
            $("#select-sc-pe").val((cajasSemanaAnterior != false ? cajasSemanaAnterior : ''));
            $("#select-sc-pe").select2();
        });
    }

    //
    function cargar_embarque_pe(...valuesInvoice) {
        fetch(`../logica/contenido.php?op=cargar_programacion&codEmbarque=${valuesInvoice[0]}`)
        .then(response => response.json())
        .then(datos => {
            // localStorage.setItem('embarqueStateEdit', codEmbarque); usarlo en caso de update pero voy a eliminar y crear nuevamente
            $("#alineacion-pe").prop("hidden", false);
            $("#estimativo-pe").prop("hidden", false);
            $("#opciones-pe").prop("hidden", false);
            $('#cod_embarque-pe').text(valuesInvoice[0]); //asigna en pantalla el código de embarque
            $('#cod_embarque-pe').data('codEmbarque', valuesInvoice[0]); //guarda el código de embarque
            $('#descripcion_embarque-pe').text(`${valuesInvoice[1]} del ${valuesInvoice[2]}`); //asigna en pantalla la descripcion del embarque

            let tablaBody = document.querySelector("#data_cajas_pe"); 
            tablaBody.innerHTML = ""; // Limpia el body de la tabla 
            let x = 0; //Se usa para asignar el número de cada caja en la tabla
            //recorre el objeto para llenar la tabla
            for (const infoCajas of datos.infoCajas) {
                let tipoFruta;
                switch (infoCajas.FKId_TblTipoFruta) { 
                    case "1":
                        tipoFruta = "yellow";
                        break;
                    case "2":
                        tipoFruta = "green";
                        break;
                    case "3":
                        tipoFruta = "gray";
                        break;
                    case "4":
                        tipoFruta = "gray";
                        break;
                    case "5":
                        tipoFruta = "gray";
                        break;
                    case "6":
                        tipoFruta = "blue";
                        break;
                
                    default:
                        break;
                }

                let totalCajas = 0;
                infoCajas.Programacion.forEach(element => {
                    totalCajas += (element.Cantidad*1)
                });
                // ic -> InputCajas se usa como identificador para obtener sus valores
                tablaBody.innerHTML += `
                    <tr>
                        <td>${x+=1}</td>
                        <td idTd="datos"><span class="ui ${tipoFruta} label" title="${infoCajas.Descripcion}">${infoCajas.PKCodigo}</span></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_zz" style="width:80px" value="${infoCajas.Programacion[0].Cantidad}"></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_gm" style="width:80px" value="${infoCajas.Programacion[1].Cantidad}"></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_tw" style="width:80px" value="${infoCajas.Programacion[2].Cantidad}"></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_cn" style="width:80px" value="${infoCajas.Programacion[3].Cantidad}"></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_al" style="width:80px" value="${infoCajas.Programacion[4].Cantidad}"></td>
                        <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_kl" style="width:80px" value="${infoCajas.Programacion[5].Cantidad}"></td>
                        <td align="center"><input type="text" class="valida text-center tcj_h" style="width:80px" value="${totalCajas}" disabled></td>
                        <td align="center"><input type="text" class="valida text-center tcj_pm" style="width:80px" factor_con="${infoCajas.FactorConversion}" value="${totalCajas * infoCajas.FactorConversion}" disabled></td>
                        <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                    </tr>
                `; 
            };
            // fetch(`../capa_web/programarembarque.php?var=${'Esto es una variable desde js'}`)
        });
    }

// GUARDAR DATOS ----------------------------------------------------------------------------------------------
    
    //Guardar selección de cajas, crea embarque
    $(document).on("click", "#btnGuardar-sc", function (e) {
        e.preventDefault();
        $("#alineacion-pe").prop("hidden", false);
        $("#estimativo-pe").prop("hidden", false);
        $("#opciones-pe").prop("hidden", false);
        let anho = $("#anho_pe").data("anho");
        let idSemana = $("#semanas_pe").val();
        $("#semanas_pe").data("idSemana", idSemana);
        let descripcionSemana = $("#semanas_pe option:selected").text();
        let codigoCajas = $("#select-sc-pe").val();
        let numSemana = descripcionSemana.split(" ");
        let codEmbarque = `EMB-${anho+numSemana[1]}`;
        //obtiene los datos a necesitar para enviar a contenido.php para ser procesados y devueltos
        let datos = {
            codEmbarque: codEmbarque,
            anho: anho,
            idSemana: idSemana,
            descripcionSemana: descripcionSemana,
            codigoCajas: codigoCajas
        };
        const op = new FormData();
        op.append('op', 'crear_embarque');
        op.append('datos', JSON.stringify(datos));
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok)
                return response.json();
            else
                throw "No se ha podido completar la petición PE";
        })
        .then(datosTablas => {
            generar_tablas_pe(datosTablas);
        });
    });

    //Guardar programación + estimativo
    $(document).on("click", "#btnGuardar-pe",  () => {
        swal({
            title: "Está seguro?",
            text: "¡Se creará permanentemente el embarque!",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Si, crear!",
            cancelButtonText: "No, cancelar!",
        })
        .then(function(isConfirm) {
            if(isConfirm) {
                let codEmbarque = $("#cod_embarque-pe").data("codEmbarque");
                let anho = $("#anho_pe").data("anho");
                let idSemana = $("#semanas_pe").data("idSemana");
                var detalles = {
                    codEmbarque: codEmbarque,
                    anho: anho,
                    idSemana: idSemana,
                    cajas: [],
                    estimativo: [
                        {
                            finca: "ZARZAMORA",
                            premiun: ($("#premiun_zz").val()),
                            especial: ($("#especial_zz").val())
                        }, 
                        {
                            finca: "GUAIMARAL",
                            premiun: ($("#premiun_gm").val()),
                            especial: ($("#especial_gm").val())
                        },
                        {
                            finca: "TAIWÁN",
                            premiun: ($("#premiun_tw").val()),
                            especial: ($("#especial_tw").val())
                        },
                        {
                            finca: "CANDELARIA",
                            premiun: ($("#premiun_cn").val()),
                            especial: ($("#especial_cn").val())
                        },
                        {
                            finca: "ÁLAMOS",
                            premiun: ($("#premiun_al").val()),
                            especial: ($("#especial_al").val())
                        },
                        {
                            finca: "KALAMARÍ",
                            premiun: ($("#premiun_kl").val()),
                            especial: ($("#especial_kl").val())
                        }
                    ]                
                }
                //Recorre la tabla obteniendo los datos de cada fila 
                $("#tblAlineacion-pe tbody tr").each( function() {
                    let codigoCaja;
                    $(this).find("td").each(function(index) {
                        let cantidad;
                        if ($(this).attr("idTd") == "datos") {
                            if (index === 1) {
                                codigoCaja = $(this).text();
                            } else {
                                cantidad = $(this).find("input[type='text']").val();
                                let nomFinca = $(this).find("input[type='text']").attr("ident");
                                //De acuerdo al abreviado de la finca se usa para enviarlo a una función y buscar el ibm
                                switch (nomFinca) {
                                    case "t_zz":
                                        nomFinca = "zarzamora";
                                        break;
                                    case "t_gm":
                                        nomFinca = "guaimaral";
                                        break;
                                    case "t_tw":
                                        nomFinca = "taiwan";
                                        break;
                                    case "t_cn":
                                        nomFinca = "candelaria";
                                        break;
                                    case "t_kl":
                                        nomFinca = "kalamari";
                                        break;
                                    case "t_al":
                                        nomFinca = "alamos";
                                        break;
                                
                                    default:
                                        break;
                                }
                                $.ajax({
                                    async: false,
                                    cache: false,
                                    dataType: 'JSON',
                                    data: {
                                        op: 'buscarfinca',
                                        nombreFinca: nomFinca
                                    },
                                    type: 'GET',
                                    url: '../logica/contenido.php',
                                    success: (resIbmFinca) => {
                                        let item = {
                                            codigoCaja: codigoCaja,
                                            ibmFinca: resIbmFinca,
                                            cantidad: cantidad
                                        }
                                        detalles.cajas.push(item);
                                    }
                                });
                            }
                        }
                    });
                });
                
                if (validar_datos()) {
                    $(".osc").fadeIn();
                    $("#loader").fadeIn();
                    const op = new FormData();
                    op.append("op", "guardar_programacion");
                    op.append("jsonProgramacion", JSON.stringify(detalles));
                    fetch('../logica/contenido.php', {
                        method: "POST",
                        body: op
                    })
                    .then(response => {
                        if (response.ok)
                            return response.text()
                        else
                            throw "No se ha podido guardar los datos";
                    })
                    .then(res => {
                        if (res == true) {
                            // Loader
                            $(".osc").fadeOut();
                            $("#loader").fadeOut();

                            swal("Programar embarque", "Programación guardada satisfactoriamente", "success");
                            $("[href='#programarembarque']").trigger("click");
                        }
                    });
                } else {
                    swal("Programar embarque", "Por favor complete los datos", "error");
                }
            }
        })
    });

    // Genera las tablas después de crear el embarque
    function generar_tablas_pe(datos) {
        let tablaBody = document.querySelector("#data_cajas_pe"); 
        $("#cod_embarque-pe").text(datos.codEmbarque); //asigna en pantalla el código de embarque
        $("#cod_embarque-pe").data("codEmbarque", datos.codEmbarque); //guarda el código de embarque
        $("#descripcion_embarque-pe").text(datos.embarque); //asigna en pantalla la descripcion del embarque
        tablaBody.innerHTML = ""; // Limpia el body de la tabla 
        let x = 0; //Se usa para asignar el número de cada caja en la tabla
        //recorre el objeto para llenar la tabla
        for (const dataCajasPe of datos.cajas) {
            let tipoFruta;
            switch (dataCajasPe.FKId_TblTipoFruta) {
                case "1":
                    tipoFruta = "yellow";
                    break;
                case "2":
                    tipoFruta = "green";
                    break;
                case "3":
                    tipoFruta = "gray";
                    break;
                case "4":
                    tipoFruta = "gray";
                    break;
                case "5":
                    tipoFruta = "gray";
                    break;
                case "6":
                    tipoFruta = "blue";
                    break;
            
                default:
                    break;
            }

            // ic -> InputCajas se usa como identificador para obtener sus valores
            tablaBody.innerHTML += `
                <tr>
                    <td>${x+=1}</td>
                    <td idTd="datos"><span class="ui ${tipoFruta} label" title="${dataCajasPe.Descripcion}">${dataCajasPe.PKCodigo}</span></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_zz" style="width:80px" value="0"></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_gm" style="width:80px" value="0"></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_tw" style="width:80px" value="0"></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_cn" style="width:80px" value="0"></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_al" style="width:80px" value="0"></td>
                    <td idTd="datos" align="center"><input type="text" class="valida text-center ic" ident="t_kl" style="width:80px" value="0"></td>
                    <td align="center"><input type="text" class="valida text-center tcj_h" style="width:80px" value="0" disabled></td>
                    <td align="center"><input type="text" class="valida text-center tcj_pm" style="width:80px" factor_con="${dataCajasPe.FactorConversion}" value="0" disabled></td>
                    <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                </tr>
            `;
        }
    }

// Eliminar datos ---------------------------------------------------------------------------------------------

    // Elimina un embarque generado en el módulo programar embarque (previo a guardarlo)
    $(document).on("click", "#btnEliminar-pe", function() {
        swal({
            title: "Está seguro?",
            text: "El embarque se eliminará, podrá crearlo nuevamente cuando desee",
            type: "question",
            showCancelButton: true,
            confirmButtonText: "Si, eliminar!",
            cancelButtonText: "No, cancelar!",
            reverseButtons: true
        })
        .then(isConfirm => {
            if (isConfirm){
                const op = new FormData();
                let codEmbarque = $("#cod_embarque-pe").data("codEmbarque")
                op.append("op", "eliminarembarque");
                op.append("key", codEmbarque);
                op.append("tabla", "tblembarque");
                op.append("campo", "PKCod");
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
                    if (res == true) {
                        $("[href='#programarembarque']").trigger("click");
                    }
                })
            }
        });
    });

// COMPLEMENTOS -----------------------------------------------------------------------------------------------

    //Quita el select de las cajasproduccion
    $(document).on("click", "#btnCancelar-sc", function(e) {
        e.preventDefault();
        $("#seleccion-pe").attr("hidden", "true");
        $("#alineacion-pe").attr("hidden", "true");
        $("#estimativo-pe").attr("hidden", "true");
        $("#opciones-pe").attr("hidden", "true");
    });

    //sumar campos deshabilitados de acuerdo a lo que se va digitando
    $(document).on("input", ".ic", function() {
        let campo_cajas = 0;
        for (x=2; x < 8; x++) {
            campo_cajas += parseInt($(this).parents("tr").find("td").eq(x).find("input[type='text']").val());
        }
        $(this).parents("tr").find("td").eq(8).find("input[type='text']").val(r => {
            return campo_cajas;
        });

        //llena PRE.20 KLS en columna -------------------------------------------------------
        let factorsito = $(this).parents("tr").find("td").eq(9).find("input[type='text']");
        factorsito.val(r => {
            return (campo_cajas*factorsito.attr("factor_con"));
        });

        //llena el total_cajas en columna
        let total_cajas_h = 0;
        [...document.querySelectorAll(".tcj_h")].forEach( element => {
            total_cajas_h += parseInt(element.value);
        });
        $("#t_cj").html(r => {
            return total_cajas_h;
        });

        //llena el total_cajas en columna de PREMIUN 20.KLS
        let total_cajas_pm = 0;
        [...document.querySelectorAll(".tcj_pm")].forEach( element => {
            total_cajas_pm += parseInt(element.value);
        });
        $("#t_pm").html(r => {
            return total_cajas_pm;
        });
        //igualar campos totales a cero al cancelar un embarque, e importar el index

        //--------------------------------------------
        let ident = $(this).attr("ident");
        let suma_final = 0;
        $(`[ident='${ident}']`).each(function (){
            suma_final += parseInt($(this).val());
        });
        $(`#${ident}`).html(r => {
            return suma_final;
        });
    });

    // Validar datos
    function validar_datos() {
        let tblAlineacion = $("#t_cj").text(); 
        let tblEstimativoPremiun = $("#t_premiun").text();
        let tblEstimativoEspecial = $("#t_especial").text();
        let retorno = false;
        if(tblAlineacion > 1 && tblEstimativoPremiun > 1 && tblEstimativoEspecial > 1){
            retorno = true;
        }
        return retorno;
    }
