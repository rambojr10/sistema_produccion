
//carga los scrips ------------------------------------------------------------------------------------------------------------
    
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
            if (response.ok) {
                return response.json();
            }
            else {
                throw "No se ha podido cargar los datos IP";
            }
        })
        .then(res => {
            console.log(res);
            //si existe carga el módulo de insertar racimos, enviando un parámetro por get para pintar el valor en la vista
            if (res != "" && res[0].PKCod == CodEmbarque_ip){
                $("#btnCancelar_ip").trigger('click');
                swal("Cargar embarque, insertar producción", "¡Datos cargados correctamente!", "success")
                $('.contenido').load(`../capa_web/tablas/tablas_ingresarproduccion.php?cod_embarque=${CodEmbarque_ip}`);
            }
            else{
                swal("Cargar embarque, insertar racimos", "¡No existe el registro!", "error");
            }
        });
    });
