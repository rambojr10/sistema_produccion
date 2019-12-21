<div class="modal fade" id="modal-nv" role="dialog">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form class="ui form" id="form_nuevaempresa" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <div class="ui segment">
                        <h4 class="ui dividing header">
                            Nueva Razón Social
                        </h4>
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label for="nit">Nit</label>  
                                    <input type="text" name="nit_empresa_nueva" placeholder="Nit de la empresa">
                                </div>
                                <div class="field">
                                    <label for="nom">Nombre</label>   
                                    <input type="text" name="nom_empresa_nueva" placeholder="Nombre completo">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="fields">
                                <div class="twelve wide field">
                                    <label>Dirección</label>
                                    <input type="text" name="dir_empresa_nueva" placeholder="Direccion">
                                </div>
                                <div class="four wide field">
                                    <label>Teléfono</label>
                                    <input type="text" name="tel_empresa_nueva" placeholder="Teléfono">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" id="btnGuardar_empresa" class="btn btn-default" data-dismiss="modal">Agregar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>