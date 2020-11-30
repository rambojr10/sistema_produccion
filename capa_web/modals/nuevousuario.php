    
    <div class="modal" id="modal-nu" role="dialog">
        <div class="modal-dialog modals-default">
            <div class="modal-content">
                <div class="modal-header">
                    <h2>Nuevo usuario</h2>
                    <hr>
                    <button type="button" class="close" data-dismiss="modal" id="cancelNewUser">&times;</button>
                </div>
                <div class="modal-body">
                    <form class="ui form">
                        <div class="field">
                            <label>Asignar a finca</label>
                            <select id="cmbFincasUser-nu" class="dropdown">

                            </select>
                        </div>
                        <div class="field">
                            <label>Usuario</label>
                            <input type="text" id="txtUser-nu">
                        </div>
                        <div class="field">
                            <label>Contraseña</label>
                            <input type="password" id="txtPassword-nu">
                        </div>
                        <div class="field">
                            <div class="ui toggle checkbox">
                                <input type="checkbox" name="gift" tabindex="0" class="hidden" id="isAdministrator" style="opacity: .7;">
                                <label>Administrador?</label>
                            </div>
                        </div>
                        <button class="fluid ui inverted green button" type="button" id="btnCreateUser-nu">Agregar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('select.dropdown').dropdown();
        $('.ui.checkbox').checkbox();
    </script>