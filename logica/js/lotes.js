
    //Mostrar lotes por finca
    function ver_lotes(ibm) {
        $("#listarlotes").html("");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'listarlotes', ibm_l: ibm},
            cache: false,
            success: function(res) {
                $("#listarlotes").html(res);
                $.post({
                    url: '../logica/contenido.php',
                    data: {op: 'buscarfinca', ibm_f: ibm},
                    cache: false,
                    success: function(res) {
                        $("#finca_l").text(res + " - " + ibm);
                        $("#finca_l").data("ibm_finca-ll", ibm);
                    }
                });
            }
        });
    }

    //Busca el lote en la base de datos por el ID único para cargar los datos en el modal
    $(document).on("click", "[href='#editar_lote']", function(){
        let id_lote = $(this).attr("id");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'buscarlote', id_lote: id_lote},
            cache: false,
            success: function(res) {
                let lote = JSON.parse(res);
                $("#nom_lote-el").data("id_lote", id_lote);
                $("#nom_lote-el").text(lote.lote);
                $("#area_neta-el").val(lote.neta);
                $("#area_bruta-el").val(lote.bruta);
            }
        });
    });

    // Actualizar lote 
    $(document).on("click", "#btnActualizar-el", function() {
        let id_lote = $("#nom_lote-el").data("id_lote");
        let area_neta = $("#area_neta-el").val();
        let area_bruta = $("#area_bruta-el").val();
        const op = new FormData();
        op.append("op", "editarlote");
        op.append("id_lote", id_lote);
        op.append("area_neta", area_neta);
        op.append("area_bruta", area_bruta);
        fetch('../logica/contenido.php', {
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
            if (res == 1) {
                swal("Editar lote", "Acción realizada correctamente", "success");
                ver_lotes($("#finca_l").data("ibm_finca-ll"));
            } else {
                $.notify({
                    icon: "fa fa-times",
                    title: "<strong>Editar lote: </strong>",
                    message: "No se ha podido completar la acción"
                },{
                    type: "danger"
                });
            }
        })
    });

    //Eliminar lote
    $(document).on("click", "[href='#eliminar_lote']", function() {
        let idLote = $(this).attr("id");
        swal({
            title: "¿Está seguro?",
            text: "El lote se eliminará permanentemente",
            type: "question",
            showCancelButton: true,
            confirmButtonText: "Si, eliminar!",
            cancelButtonText: "No, cancelar!",
            reverseButtons: true
        })
        .then(isConfirm => {
            if (isConfirm) {
                const op = new FormData();
                op.append('op', 'eliminar');
                op.append('key', idLote);
                op.append('campo', 'PKId');
                op.append('tabla', 'TblLotes');
                fetch('../logica/contenido.php', {method: 'POST', body: op})
                .then(response => response.text())
                .then(res => {
                    console.log(res); 
                    if (res == 1) {
                        swal('Lotes', 'Registro eliminado correctamente.', 'success');
                        $('#exitModalListarLotes').trigger('click');
                        listar_fincas(false);
                    } else {
                        swal('Lotes', 'Ha ocurrido un error al eliminar el registro.', 'error');
                    }
                });
            }
        });
    });

    //cerrar modal lotes
    $(document).on("hidden.bs.modal", "#modal-ll", function () {
        listar_fincas(false);
    });
