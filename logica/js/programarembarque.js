//CONTROL DE VISTAS EN PROGRAMAR EMBARQUE --------------------------------------------------------------------
    
    //Muestra la vista para seleccionar las cajas del embarque y verifica si el embarque a generar ya existe...
    $(document).on("click", "[href='#seleccionar_pe']", function(e) {
        e.preventDefault();
        if ($("#semanas_pe").val() != null) {
            let semana_pe = $("#semanas_pe option:selected").text();
            let num_semana_pe = semana_pe.split(" ");
            let anho_pe = $("#ano_pe").val();
            let cod_embarque = `EMB-${anho_pe+num_semana_pe[1]}`;
            // -------------------------------------------------------------------------
            const op = new FormData();
            op.append("op", "codEmbarque_verificar");
            op.append("key", cod_embarque);
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
                if (res.length > 0) {
                    swal({
                        title: "¡Datos pendientes!",
                        text: "El embarque ya existe, ¿desea cargarlo?",
                        type: "info",
                        showCancelButton: true,
                        confirmButtonText: "Si, cargar!",
                        cancelButtonText: "No, cancelar!"
                    }).then(function(isConfirm) {
                        if(isConfirm){
                            //FALTA RECIBIR PETICIÓN Y PROCESARLA
                        }
                    });
                    console.log(res);
                } else {
                    $("#seleccion-pe").removeAttr("hidden");
                    cargar_cajas_pe();
                }
            });
        }else {
            swal("Seleccionar Cajas", "Debe seleccionar una semana a programar", "error");
        }
    });

    //Mostrar vista con semanas disponibles para programar embarque
    $(document).on("click", "#btnBuscar_pe", function (e) {
        e.preventDefault();
        $("#semanas_pe").html("");
        let ano_pe = $("#ano_pe").val();
        let ano_posible = new Date();
        if  (ano_pe == ano_posible.getFullYear() || ano_pe == (ano_posible.getFullYear()+1)) {
            const op = new FormData();
            op.append("op", "semanaspe");
            op.append("ano_pe", ano_pe);
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                }else{
                    throw "Error al cargar los datos";
                }
            })
            .then(res => {
                if (res != ""){
                    $("#semanas_pe").html(res);
                    $.notify({
                        icon: "fa fa-check-circle",
                        message: "Semanas cargadas correctamente"
                    },{
                        type: "success"
                    });
                }else {
                    $.notify({
                        icon: "fa fa-times",
                        title: "<strong>Buscar semanas: </strong>",
                        message: "No se han podido cargar las semanas"
                    },{
                        type: "danger"
                    });
                }
            });
        }else {
            $.notify({
                icon: "fa fa-times",
                title: "<strong>Buscar semanas: </strong>",
                message: "Fuera de rango"
            },{
                type: "danger"
            });
        }
    });

//MOSTRAR DATOS -----------------------------------------------------------------------------------------------    
    
    //Carga las cajas para mostrarlas en el select de programar embarque
    function cargar_cajas_pe(){
        const op = new FormData();
        op.append("op", "cargarcajas_select");
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.text();
            }else {
                throw "No se ha podido cargar los datos";
            }
        })
        .then(res => {
            $("#select-sc-pe").html(res);
            $("#select-sc-pe").select2();
        });
    }

// GUARDAR DATOS ----------------------------------------------------------------------------------------------
    
    //Guardar selección de cajas, crea embarque
    $(document).on("click", "#btnGuardar-sc", function (e) {
        e.preventDefault();
        $("#alineacion-pe").prop("hidden", false);
        $("#estimativo-pe").prop("hidden", false);
        $("#opciones-pe").prop("hidden", false);
        let tabla_body = document.querySelector("#data_cajas_pe"); 
        let ano = $("#ano_pe").val();
        $("#ano_pe").data("ano", ano);
        let id_semana = $("#semanas_pe").val();
        $("#semanas_pe").data("id_semana", id_semana);
        let descripcion_semana = $("#semanas_pe option:selected").text();
        let codigocajas = $("#select-sc-pe").val();
        let num_semana = descripcion_semana.split(" ");
        let cod_embarque = `EMB-${ano+num_semana[1]}`;
        //obtiene los datos a necesitar para enviar a contenido.php para ser procesados y devueltos
        let datos = {
            cod_embarque: cod_embarque,
            ano: ano,
            id_semana: id_semana,
            descripcion_semana: descripcion_semana,
            codigocajas: codigocajas
        };
        const op = new FormData();
        op.append("op", "crearembarque");
        op.append("datos", JSON.stringify(datos));
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }else {
                throw "No se pueden cargar los datos";
            }
        })
        .then(res => {
            $("#cod_embarque-pe").text(res.cod_embarque); //asigna en pantalla el código de embarque
            $("#cod_embarque-pe").data("cod_embarque", res.cod_embarque); //guarda el código de embarque
            $("#descripcion_embarque-pe").text(res.embarque); //asigna en pantalla la descripcion del embarque
            tabla_body.innerHTML = ""; // Limpia el body de la tabla 
            let x=0; //Se usa para asignar el número de cada caja en la tabla
            //recorre el objeto para llenar la tabla
            for (const data_cajas_pe of res.cajas) {
                let tipofruta;
                switch (data_cajas_pe.FKId_TblTipoFruta) {
                    case "1":
                        tipofruta = "yellow";
                        break;
                    case "2":
                        tipofruta = "green";
                        break;
                    case "3":
                        tipofruta = "gray";
                        break;
                    case "4":
                        tipofruta = "gray";
                        break;
                    case "5":
                        tipofruta = "gray";
                        break;
                    case "6":
                        tipofruta = "blue";
                        break;
                
                    default:
                        break;
                }

                //id= ic -> InputCajas se usa como identificador para obtener sus valores
                tabla_body.innerHTML += `
                    <tr>
                        <td>${x+=1}</td>
                        <td id="datos"  ><span class="ui ${tipofruta} label" title="${data_cajas_pe.Descripcion}">${data_cajas_pe.PKCodigo}</span></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_zz" style="width:80px" value="0"></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_gm" style="width:80px" value="0"></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_tw" style="width:80px" value="0"></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_cn" style="width:80px" value="0"></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_al" style="width:80px" value="0"></td>
                        <td id="datos" align="center"><input type="text" class="valida text-center" id="ic" ident="t_kl" style="width:80px" value="0"></td>
                        <td align="center"><input type="text" class="valida text-center" id="tcj_h" style="width:80px" value="0" disabled></td>
                        <td align="center"><input type="text" class="valida text-center" id="tcj_pm" style="width:80px" factor_con="${data_cajas_pe.FactorConversion}" value="0" disabled></td>
                        <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                    </tr>
                `;
                //añadir nueva caja sin alterar las actuales
                //validar campos
            }
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
                let cod_embarque = $("#cod_embarque-pe").data("cod_embarque");
                let ano = $("#ano_pe").data("ano");
                let id_semana = $("#semanas_pe").data("id_semana");
                var detalles = {
                    cod_embarque: cod_embarque,
                    ano: ano,
                    id_semana: id_semana,
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
                    let codigo_caja;
                    $(this).find("td").each(function(index){
                        let cantidad;
                        if($(this).attr("id") == "datos"){
                            if(index === 1){
                                codigo_caja = $(this).text();
                            }else{
                                cantidad = $(this).find("input[type='text']").val();
                                let nom_finca = $(this).find("input[type='text']").attr("ident");
                                //De acuerdo al abreviado de la finca se usa para enviarlo a una función y buscar el ibm
                                switch (nom_finca) {
                                    case "t_zz":
                                        nom_finca = "zarzamora";
                                        break;
                                    case "t_gm":
                                        nom_finca = "guaimaral";
                                        break;
                                    case "t_tw":
                                        nom_finca = "taiwan";
                                        break;
                                    case "t_cn":
                                        nom_finca = "candelaria";
                                        break;
                                    case "t_kl":
                                        nom_finca = "kalamari";
                                        break;
                                    case "t_al":
                                        nom_finca = "alamos";
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
                                        nombre_finca: nom_finca
                                    },
                                    type: 'GET',
                                    url: '../logica/contenido.php',
                                    success: (res_ibmfinca) => {
                                        item = {
                                            codigo_caja: codigo_caja,
                                            ibm_finca: res_ibmfinca,
                                            cantidad: cantidad
                                        }
                                        detalles.cajas.push(item);
                                    }
                                });
                            }
                        }
                    });
                });
                
                if(validar_datos()){
                    $(".osc").fadeIn();
                    $("#loader").fadeIn();
                    const op = new FormData();
                    op.append("op", "guardarprogramacion");
                    op.append("jsonprogramacion", JSON.stringify(detalles));
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
                            $(".osc").fadeOut();
                            $("#loader").fadeOut();
                            swal("Guardar programación de embarque", "Programación guardada satisfactoriamente", "success");
                            $("[href='#programarembarque']").trigger("click");
                        }
                    });
                }else{
                    swal("Guardar programación de embarque", "Por favor complete los datos", "error");
                }
            }
        })
    });

// Eliminar datos

    // Elimina un embarque generado en el módulo programar embarque (previo a guardarlo)
    $(document).on("click", "#btnEliminar-pe", function() {
        swal({
            title: "Está seguro?",
            text: "El embarque se eliminará, podrá crearlo nuevamente cuando desee",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Si, eliminar!",
            cancelButtonText: "No, cancelar!"
        })
        .then(isConfirm => {
            if (isConfirm){
                const op = new FormData();
                let cod_embarque = $("#cod_embarque-pe").data("cod_embarque")
                op.append("op", "eliminarembarque");
                op.append("key", cod_embarque);
                op.append("tabla", "tblembarque");
                op.append("campo", "PKCod");
                fetch("../logica/contenido.php", {
                    method: "POST",
                    body: op
                })
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    }else {
                        throw "No se ha podido completar la acción";
                    }
                })
                .then(res => {
                    console.log(res);
                    if (res == true) {
                        swal("Eliminar embarque", "Acción completada, "+cod_embarque+" eliminado", "success");
                        $("[href='#programarembarque']").trigger("click");
                    }
                })
            }
        });
    });

// COMPLEMENTOS ----------------------------------------------------------------------------------------------

    //Quita el select de las cajasproduccion
    $(document).on("click", "#btnCancelar-sc", function (e){
        e.preventDefault();
        $("#seleccion-pe").attr("hidden", "true");
        $("#alineacion-pe").attr("hidden", "true");
        $("#estimativo-pe").attr("hidden", "true");
        $("#opciones-pe").attr("hidden", "true");
    });

    //sumar campos deshabilitados de acuerdo a lo que se va digitando
    $(document).on("input", "#ic", function () {
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
        [...document.querySelectorAll("#tcj_h")].forEach( element => {
            total_cajas_h += parseInt(element.value);
        });
        $("#t_cj").html(r => {
            return total_cajas_h;
        });

        //llena el total_cajas en columna de PREMIUN 20.KLS
        let total_cajas_pm = 0;
        [...document.querySelectorAll("#tcj_pm")].forEach( element => {
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
            // var valor = $(this).val();
            // var valor2 = (valor == null || valor == undefined || valor == "") ? 0 : valor;
            suma_final += parseInt($(this).val());
        });
        $(`#${ident}`).html(r => {
            return suma_final;
        });
    });

    // Validar datos
    function validar_datos(){
        let tblalineacion = $("#t_cj").text(); 
        let tblestimativo_premiun = $("#t_premiun").text();
        let tblestimativo_especial = $("#t_especial").text();
        let retorno = false;
        if(tblalineacion > 1 && tblestimativo_premiun > 1 && tblestimativo_especial > 1){
            retorno = true;
        }
        return retorno;
    } 

