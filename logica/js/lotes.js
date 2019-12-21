
// MOSTRAR LOTES -------------------------------------------------------------------------------------------
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
                    }
                });
            }
        });
    }

    //Busca el lote en la base de datos por el ID único para cargar los datos en el modal
    $(document).on("click", "[href='#editar_lote']", function(){
        id_lote = $(this).attr("id");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'buscarlote', id_lote: id_lote},
            cache: false,
            success: function(res) {
                var lote = JSON.parse(res);
                $("#nom_l").text(lote.lote);
            }
        });
    });

// Falta editar lote
