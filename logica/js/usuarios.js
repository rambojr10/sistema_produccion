    //Administración de usuarios
    
    function changePassword(idUser) {
        swal({
            title: 'Users',
            text: 'Password uptade',
            type: 'warning',
            showCancelButton: true,
            input: 'password',
            cancelButtonText: 'Cancel',
            confirmButtonText: 'Update',
            reverseButtons: true
        })
        .then(inputValue => {
            if (inputValue.length > 4) {
                const op = new FormData();
                op.append('op', 'change_password');
                op.append('idUser', idUser);
                op.append('password', inputValue);
                fetch('../logica/contenido.php', {method: 'POST', body: op})
                .then(response => response.text())
                .then(res => {
                    if (res == true) {
                        $.notify({
                            message: 'Password update completed',
                            title: '<strong>Users: </strong>',
                            icon: 'fa fa-key',
                        }, {
                            type: 'success'
                        });
                    } else {
                        $.notify({
                            message: 'Password update failed',
                            title: '<strong>Users: </strong>',
                            icon: 'fa fa-key',
                        }, {
                            type: 'danger'
                        });
                    }
                })
            } else {
                $.notify({
                    message: 'Password update failed',
                    title: '<strong>Users: </strong>',
                    icon: 'fa fa-key',
                }, {
                    type: 'danger'
                });
            }
        })
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
