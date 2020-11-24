
// MOSTRAR EMPRESAS --------------------------------------------------------------------------------------
    //en funcion porque debe llamarse al momento de actualizar 
    function listarempresas() {
        fetch('../logica/contenido.php?op=listarempresas')
        .then(response => response.text())
        .then(res => {
            $("#listarempresas").html(res);
            $(".contenido").hide().show("blind", 1500);
        });
    }

    //Muestra los datos de la empresa en el modal cargado 
    $(document).on("click", "[href='#editar_empresa']", function() {
        let nit = $(this).attr("nit");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'editarempresa', nit: nit},
            cache: false,
            success: function(res) {
                let empresa = JSON.parse(res);
                $("[name='nit_empresa']").val(empresa.nit);
                $("[name='nit_empresa']").prop('disabled', true);
                $("[name='nom_empresa']").val(empresa.nom);
                $("[name='dir_empresa']").val(empresa.dir);
                $("[name='tel_empresa']").val(empresa.tel);
            }
        });
    });

// GUARDAR Y ACTUALIZAR EMPRESA ----------------------------------------------------------------------------- 
    function empresa_ga(op) {
        let empresa = '';
        if (op == "actualizarempresa") {
            empresa = {
                nit: $("[name='nit_empresa']").val(),
                nom: $("[name='nom_empresa']").val(),
                dir: $("[name='dir_empresa']").val(),
                tel: $("[name='tel_empresa']").val()
            };
        } else if(op == "guardarempresa") {
            empresa = {
                nit: $("[name='nit_empresa_nueva']").val(),
                nom: $("[name='nom_empresa_nueva']").val(),
                dir: $("[name='dir_empresa_nueva']").val(),
                tel: $("[name='tel_empresa_nueva']").val()
            };
        }
        $.post({
            url: '../logica/contenido.php',
            data: {op: op, empresa: empresa},
            cache: false,
            success: function(res) {
                if (res == true) {
                    if(op == "actualizarempresa")
                        swal("Actualización", "Datos actualizados satisfactoriamente.", "success");
                    else if(op == "guardarempresa")
                        swal("Nueva Empresa", "Datos guardados correctamente.", "success");
                    listarempresas();
                }else {
                    if (op == "actualizarempresa")
                        swal("Actualización", "Error al actualizar los datos.", "error");
                    else if(op == "guardarempresa")
                        swal("Nueva Empresa", "Error al agregar nuevos datos.", "error");
                }
            }
        });
    }

    $(document).on("click", "#btnActualizar_empresa", function(){
        empresa_ga("actualizarempresa");
    });
    $(document).on("sumbit", "#form_nuevaempresa", function(e){
        e.preventDefault();
        empresa_ga("guardarempresa");
    });

// ELIMINAR EMPRESA ----------------------------------------------------------------------------------------
    function eliminarempresa(nit) {
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
                    data: {op: 'eliminarempresa', key: nit, campo: 'tblempresas.PKNit', tabla: 'tblempresas'},
                    cache: false,
                    success: function (res) {
                        if (res == true) {
                            swal("Eliminación", "Registro eliminado correctamente.", "success");
                            listarempresas();
                        } else {
                            swal("Eliminación", "Error al intentar eliminar el registro.", "error");
                        }
                    }
                });
            }
        });
    }