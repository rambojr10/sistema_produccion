// -----------------------------------------------------------------------------------------------------------------------------
    //carga los scrips
    
    // Métodos de mostrar
    $(document).on("click", "#btnCargarembarque_racimos_ip", function() {
        //Captura el valor del input en el modal
        const CodEmbarque_racimos_ip = $("#txtCodEmbarque_racimos_ip").val();
        //verifica si existe la búsqueda
        const op = new FormData();
        op.append("op", "codEmbarque_verificar");
        op.append("key", CodEmbarque_racimos_ip);
        op.append("campo", "PKCod");
        op.append("tabla", "tblembarque");
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            else {
                throw "No se ha podido cargar los datos IP";
            }
        })
        .then(res => {
            //si existe carga el módulo de insertar racimos, enviando un parámetro por get para pintar el valor en la vista
            if (res != "" && res[0].PKCod == CodEmbarque_racimos_ip){
                $("#btnCancelar_modal_racimos").trigger('click');
                swal("Cargar embarque, insertar racimos", "¡Datos cargados correctamente!", "success")
                $('.contenido').load(`../capa_web/tablas/tabla_racimos_ip.php?cod=${CodEmbarque_racimos_ip}`);
            }
            else{
                swal("Cargar embarque, insertar racimos", "¡No existe el registro!", "error");
            }
        });
    });

    $(document).on("click", "#btnCargarembarque_cajas_ip", () => {
        $("#btnCancelar_modal_cajas").trigger('click');
        $('.contenido').load('../capa_web/tablas/tabla_cajasproduccion_ip.php');
        
        /* const CodEmbarque_cajas_ip = $("#txtCodEmbarque_cajas_ip").val();
        const op = new FormData();
        op.append("op", "codEmbarque_verificar");
        op.append("key", CodEmbarque_cajas_ip);
        op.append("campo", "PKCod");
        op.append("tabla", "tblembarque");
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            else {
                throw "No se ha podido cargar los datos IP";
            }
        })
        .then(res => {
            if (res != "" && res[0].PKCod == CodEmbarque_cajas_ip) {
                $("#btnCancelar_modal_cajas").trigger('click');
                // swal("Cargar Embarque", )
                // $('.contenido').load(`../capa_web/tablas/tabla_cajasproduccion_ip.php?cod_embarque=${CodEmbarque_cajas_ip}`);
                
            }
        }); */
    });
