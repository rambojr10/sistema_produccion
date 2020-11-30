
    $(document).on("click", "#btnCargarembarque_ip", () => {
        //Captura el valor del input en el modal
        const CodEmbarque_ip = $("#txtCodEmbarque_ip").val();
        //verifica si existe la búsqueda
        const op = new FormData();
        op.append("op", "codEmbarque_verificar");
        op.append("key", CodEmbarque_ip);
        op.append("campo", "PKCod");
        op.append("tabla", "tblembarque");
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok)
                return response.json();
            else
                throw "No se ha podido cargar los datos IP";
        })
        .then(res => {
            //si existe carga el módulo de insertar racimos, enviando un parámetro por get para pintar el valor en la vista
            if (res[0].PKCod == CodEmbarque_ip) {
                $("#btnCancelar_ip").trigger('click');

                //Control user
                fetch('../logica/contenido.php?op=verify_ibmfinca')
                .then(response => response.json())
                .then(res => {
                    if (res.ibmFinca !== undefined && res.nombreFinca !== null) {
                        $('.contenido').load(`../capa_web/tablas/tablas_ingresarproduccion.php?cod_embarque=${CodEmbarque_ip}`);
                        swal("Cargar embarque, insertar producción", "¡Datos cargados correctamente!", "success");
                    } else {
                        swal({
                            title: 'Cargar embarque',
                            text: 'Debe seleccionar una finca para cargar el embarque',
                            type: 'info',
                            showCancelButton: true,
                            input: 'select',
                            inputOptions: res,
                            inputClass: 'form-control',
                            cancelButtonText: 'Cancelar',
                            confirmButtonText: 'Seleccionar',
                            reverseButtons: true
                        })
                        .then(inputValue => {
                            fetch(`../logica/contenido.php?op=assign_ibmfinca&ibmFinca=${inputValue}`)
                            .then(response => response.text())
                            .then(res => {
                                if (res == inputValue) {
                                    $('.contenido').load(`../capa_web/tablas/tablas_ingresarproduccion.php?cod_embarque=${CodEmbarque_ip}`);
                                    swal("Cargar embarque, insertar producción", "¡Datos cargados correctamente!", "success");
                                }
                            })
                        })
                    }
                });
            } else {
                swal("Cargar embarque, insertar racimos", "¡No existe el registro!", "error");
            }
        });
    });
