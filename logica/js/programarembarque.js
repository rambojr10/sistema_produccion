
//CONTROL DE VISTAS EN PROGRAMAR EMBARQUE ------------------------------------------------------------------
    //
    $(document).on("click", "[href='#seleccionar_pe']", function(e) {
        e.preventDefault();
        if  ($("#semanas_pe").val() != null) {
            $("#seleccion-pe").removeAttr("hidden");
            cargar_cajas_pe();
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
            semanas_pe(ano_pe);
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

    //Carga las semanas para el select de programar embarque
    function semanas_pe(ano_pe){
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

// GUARDAR DATOS ----------------------------------------------------------------------------------------------
    
    //Guardar selección de cajas, crea embarque
    $(document).on("click", "#btnGuardar-sc", function (e) {
        e.preventDefault();
        $("#alineacion-pe").prop("hidden", false);
        var tabla_body = document.querySelector("#data_cajas_pe"); 
        var ano = $("#ano_pe").val();
        var id_semana = $("#semanas_pe").val();
        var descripcion_semana = $("#semanas_pe option:selected").text();
        var codigocajas = $("#select-sc-pe").val();
        //obtiene los datos a necesitar para enviar a contenido.php para ser procesados y devueltos
        var datos = {
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
                        <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_cn" style="width:80px" value="0"></td>
                        <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_al" style="width:80px" value="0"></td>
                        <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_tw" style="width:80px" value="0"></td>
                        <td align="center"><input type="text" class="valida text-center" id="ic" ident="t_kl" style="width:80px" value="0"></td>
                        <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                        <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                        <td align="center"><input type="text" class="valida text-center" style="width:80px" value="0" disabled></td>
                    </tr>
                `;
                //formular campos inactivos, total, etc...
                //añadir nueva caja sin alterar las actuales
                //validar campos
            }
        });
    });

// COMPLEMTOS ----------------------------------------------------------------------------------------------

    //Quita el select de las cajasproduccion
    $(document).on("click", "#btnCancelar-sc", function (e){
        e.preventDefault();
        $("#seleccion-pe").attr("hidden", "true");
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

        //--------------------------------------------
        var suma = parseInt($(this).val());
        var ident = $(this).attr("ident");
        var total = (suma == null || suma == undefined || suma == "") ? 0 : suma;
        
        
        //se piensa elaborar un identificador a los campos de abajo para calcular 
    });

    //suma de acuerdo al campo 
    function sumar (valor, campo) {
        var total = 0;

        valor = parseInt(valor);
        // Convertir el valor a un entero (número).
        
        total = document.getElementById(`${campo}`).innerHTML;
        
        // Aquí valido si hay un valor previo, si no hay datos, le pongo un cero "0".
        total = (total == null || total == undefined || total == "") ? 0 : total;
        
        /* Esta es la suma. */
        total = (parseInt(total) + parseInt(valor));
        console.log(total);
        
        // Colocar el resultado de la suma en el control "span".
        document.getElementById(`${campo}`).innerHTML = total;
    }

    //pienso colocar un cod que idenfitique a qué columna pertenece cada uno de los input