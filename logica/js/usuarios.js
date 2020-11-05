    //Administración de usuarios
    
    function changePassword(idUser) {
        console.log('changePassword', idUser)
        //asignar un modal para el cambio de password en el html
    }

    function changePrivileges(idUser, value) {
        let privileges = (value == 1 ? 'ESTANDAR' : 'ADMINISTRADOR');
        swal({
            title: 'Usuarios',
            text: `¿Desea cambiar los privilegios de este usuario a : ${privileges}?`,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, cambiar!',
            cancelButtonText: 'No, cancelar!'
        })
        .then(isConfirm => {
            if(isConfirm) {
                const op = new FormData();
                op.append('op', 'change_privileges_user');
                op.append('idUser', idUser);
                op.append('value', value);
                fetch('../logica/contenido.php', {
                    method: 'POST',
                    body: op
                })
                .then(response => response.text())
                .then(res => {
                    if (res == true) {
                        $('[href="#listarusuarios"]').trigger('click');
                        $.notify({
                            icon: 'fa fa-check',
                            message: 'Privilegios de usuario cambiados correctamente.',
                            title: '<strong>Usuarios: </strong>'
                        }, {
                            type: 'success'
                        });
                    } else {
                        console.error(res);
                    }
                });
            }
        });
    }

    function changeStatus(idUser, value) {
        let status = (value == 2 ? 'ACTIVO' : 'INACTIVO');
        swal({
            title: 'Usuarios',
            text: `¿Desea cambiar el estado de este usuario a : ${status}?`,
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, cambiar!',
            cancelButtonText: 'No, cancelar!'
        })
        .then(isConfirm => {
            if(isConfirm) {
                const op = new FormData();
                op.append('op', 'change_status_user');
                op.append('idUser', idUser);
                op.append('value', value);
                fetch('../logica/contenido.php', {
                    method: 'POST',
                    body: op
                })
                .then(response => response.text())
                .then(res => {
                    if (res == true) {
                        $('[href="#listarusuarios"]').trigger('click');
                        $.notify({
                            icon: 'fa fa-check',
                            message: 'Estado de usuario cambiado correctamente.',
                            title: '<strong>Usuarios: </strong>'
                        }, {
                            type: 'success'
                        });
                    } else {
                        console.error(res);
                    }
                });
            }
        });
    }
