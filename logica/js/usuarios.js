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

    function deleteUser(idUser) {
        swal({
            title: 'Usuarios',
            text: '¿Desea eliminar este usuario?',
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, eliminar!',
            cancelButtonText: 'No, cancelar!',
            reverseButtons: true
        })
        .then(isConfirm => {
            if (isConfirm) {
                const op = new FormData();
                op.append('op', 'eliminar');
                op.append('key', idUser);
                op.append('campo', 'PKId');
                op.append('tabla', 'tblusuarios');
                fetch('../logica/contenido.php', {method: 'POST', body: op})
                .then(response => response.text())
                .then(res => {
                    if (res == true) {
                        $('[href="#listarusuarios"]').trigger('click');
                        $.notify({
                            title: '<strong>Users: </strong>',
                            icon: 'fa fa-check',
                            message: 'Usuario eliminado correctamente'
                        }, {
                            type: 'success'
                        });
                    } else {
                        $.notify({
                            title: '<strong>Users: </strong>',
                            icon: 'fa fa-times',
                            message: 'No se ha podido eliminar el usuario'
                        }, {
                            type: 'danger'
                        });
                    }
                });
            }
        })
        
    }

    $(document).on('click', '#btnCreateUser-nu', () => {
        let assignFinca = $('#cmbFincasUser-nu').val() !== 0 ? $('#cmbFincasUser-nu').val() : null;
        let userName = $('#txtUser-nu').val();
        let password = $('#txtPassword-nu').val();
        let isAdministrator = $('#isAdministrator').is(':checked') ? 1 : 2;
        
        const op = new FormData();
        op.append('op', 'create_user');
        op.append('assignFinca', assignFinca);
        op.append('userName', userName);
        op.append('password', password);
        op.append('isAdministrator', isAdministrator);
        fetch('../logica/contenido.php', {method: 'POST', body: op})
        .then(response => response.text())
        .then(res => {
            if (res == true) {
                $('#cancelNewUser').trigger('click');
                $('[href="#listarusuarios"]').trigger('click');
                $.notify({
                    title: '<strong>Users: </strong>',
                    icon: 'fa fa-check',
                    message: 'Nuevo usuario agregado'
                }, {
                    type: 'success'
                });
            } else {
                swal('Users', 'No se ha podido crear el usuario.', 'error');
            }
        });
    });

    $(document).on('click', '[data-target="#modal-nu"]', () => {
        $('#isAdministrator').attr('disabled', true);
        $('#isAdministrator').prop('checked', true);

        fetch('../logica/contenido.php?op=listar_fincas_option')
        .then(response => response.json())
        .then(res => {
            let options = '<option value=0>NO ASIGNAR<option>';
            res.forEach(element => {
                options += `<option value="${element.PKIbm}">${element.Nombre}</option>`
            });
            $('#cmbFincasUser-nu').html(options);
        });
    });

    $(document).on('change', '#cmbFincasUser-nu', () => {
        let selected = $('#cmbFincasUser-nu').val();
        if (selected != 0) {
            $('#isAdministrator').prop('checked', false);
        } else {
            $('#isAdministrator').prop('checked', true);
        }
    });
