//CONTROL DE VISTAS EN PROGRAMAR EMBARQUE ------------------------------------------------------------------
    //Muestra la vista para seleccionar las cajas del embarque y verifica si el embarque a generar ya existe...
    $(document).on("click", "[href='#seleccionar_pe']", function(e) {
        e.preventDefault();
        if ($("#semanas_pe").val() != null) {
            var semana_pe, num_semana_pe, anho_pe, cod_embarque_buscar;
            semana_pe = $("#semanas_pe option:selected").text();
            num_semana_pe = semana_pe.split(" ");
            anho_pe = $("#ano_pe").val();
            cod_embarque_buscar = `EMB-${anho_pe+num_semana_pe[1]}`;
            // -------------------------------------------------------------------------
            const op = new FormData();
            op.append("op", "buscarembarque");
            op.append("cod_embarque", cod_embarque_buscar);
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok) {
                    return response.text();
                } else {
                    throw "No se puede obtener los datos";
                }
            })
            .then(res => {
                if (res == true) {
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
                } else {
                    $("#seleccion-pe").removeAttr("hidden");
                    cargar_cajas_pe();
                }
            });
        }else {
            swal("Seleccionar Cajas", "Debe seleccionar una semana a programar", "error");
        }
        // var semana = $("#semanas_pe option:selected").text();
    });

    //Mostrar vista con semanas disponibles para programar embarque
    $(document).on("click", "#btnBuscar_pe", function (e) {
        e.preventDefault();
        $("#semanas_pe").html("");
        var ano_pe = $("#ano_pe").val();
        var ano_posible = new Date();
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
                $("#semanas_pe").html(res);
            });
        }
    });

//MOSTRAR DATOS --------------------------------------------------------------------------------    
    
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
        swal({
            title: "Está seguro?",
            text: "¡Se creará permanentemente el embarque!",
            type: "warning",
            showCancelButton: true,
            confirmButtonText: "Si, crear!",
            cancelButtonText: "No, cancelar!",
        }).then(function(isConfirm) {
            if(isConfirm) {
                $("#alineacion-pe").prop("hidden", false);
                $("#estimativo-pe").prop("hidden", false);
                $("#opciones-pe").prop("hidden", false);
                var tabla_body = document.querySelector("#data_cajas_pe"); 
                var ano = $("#ano_pe").val();
                var id_semana = $("#semanas_pe").val();
                var descripcion_semana = $("#semanas_pe option:selected").text();
                var num_semana = descripcion_semana.split(" ");
                var cod_embarque = `EMB-${ano+num_semana[1]}`;
                var codigocajas = $("#select-sc-pe").val();
                //obtiene los datos a necesitar para enviar a contenido.php para ser procesados y devueltos
                var datos = {
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
                    tabla_body.innerHTML = ""; // Limpia el body de la tabla 
                    var x=0; //Se usa para asignar el número de cada caja en la tabla
                    //recorre el objeto para llenar la tabla
                    for (const data_cajas_pe of res.cajas) {
                        var tipofruta;
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
                                <td><span class="ui ${tipofruta} label" title="${data_cajas_pe.Descripcion}">${data_cajas_pe.PKCodigo}</span></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_zz" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_gm" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_tw" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_cn" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_al" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_kl" style="width:80px" value="0"></td>
                                <td align="center"><input type="text" class="valida text-center" id="tcj_h" style="width:80px" value="0" disabled></td>
                                <td align="center"><input type="text" class="valida text-center" id="tcj_pm" style="width:80px" factor_con="${data_cajas_pe.FactorConversion}" value="0" disabled></td>
                                <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                            </tr>
                        `;
                        //añadir nueva caja sin alterar las actuales
                        //validar campos
                    }
                });
            }
        });
    });

    //Guardar programación + estimativo
    $(document).on("click", "#btnGuardar-pe",  () => {
        var alineacion = [
            "cod_embarque" = "EMB-202001"
        ];
        /* $("#tblAlineacion-pe tbody tr").each( (index) => {
            $(this).children("td").each( (index2) => {
                
            });
            
        }); */
        var datos = [
            "cod_finca" = "001",
            "cod_caja" = "011",
            "cantidad" = "111",
        ];
        alert(JSON.stringify(alineacion));
        console.log(JSON.stringify(alineacion));
        // alineacion.push(datos);
        // console.log(JSON.stringify(alineacion));
    });
// COMPLEMTOS ----------------------------------------------------------------------------------------------

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
        var campo_cajas = 0;
        for (x=2; x < 8; x++) {
            campo_cajas += parseInt($(this).parents("tr").find("td").eq(x).find("input[type='text']").val());
        }
        $(this).parents("tr").find("td").eq(8).find("input[type='text']").val(r => {
            return campo_cajas;
        });

        //llena PRE.20 KLS en columna -------------------------------------------------------
        var factorsito = $(this).parents("tr").find("td").eq(9).find("input[type='text']");
        factorsito.val(r => {
            return (campo_cajas*factorsito.attr("factor_con"));
        });


        //llena el total_cajas en columna
        var total_cajas_h = 0;
        [...document.querySelectorAll("#tcj_h")].forEach( element => {
            total_cajas_h += parseInt(element.value);
        });
        $("#t_cj").html(r => {
            return total_cajas_h;
        });

        //llena el total_cajas en columna de PREMIUN 20.KLS
        var total_cajas_pm = 0;
        [...document.querySelectorAll("#tcj_pm")].forEach( element => {
            total_cajas_pm += parseInt(element.value);
        });
        $("#t_pm").html(r => {
            return total_cajas_pm;
        });
        //igualar campos totales a cero al cancelar un embarque, e importar el index

        //--------------------------------------------
        var ident = $(this).attr("ident");
        var suma_final = 0;
        $(`[ident='${ident}']`).each(function (){
            // var valor = $(this).val();
            // var valor2 = (valor == null || valor == undefined || valor == "") ? 0 : valor;
            suma_final += parseInt($(this).val());
        });
        $(`#${ident}`).html(r => {
            return suma_final;
        });
    });
