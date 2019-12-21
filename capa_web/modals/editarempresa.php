<!-- Modal editar empresa -->
<div class="modal fade" id="modal-ed" role="dialog">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="ui segment">
                    <form class="ui form">
                        <h4 class="ui dividing header">
                            Editar Razón Social
                        </h4>
                        <div class="field">
                            <div class="two fields">
                                <div class="field">
                                    <label for="nit">Nit</label>  
                                    <input type="text" name="nit_empresa" placeholder="Nit de la empresa">
                                </div>
                                <div class="field">
                                    <label for="nom">Nombre</label>   
                                    <input type="text" name="nom_empresa" placeholder="Nombre completo">
                                </div>
                            </div>
                        </div>
                        <div class="field">
                            <div class="fields">
                                <div class="twelve wide field">
                                    <label>Dirección</label>
                                    <input type="text" name="dir_empresa" placeholder="Direccion">
                                </div>
                                <div class="four wide field">
                                    <label>Teléfono</label>
                                    <input type="text" name="tel_empresa" placeholder="Teléfono">
                                </div>
                            </div>
                        </div>
                    </form>

                    <div class="modal-footer">
                        <button type="button" id="btnActualizar_empresa" class="btn btn-default" data-dismiss="modal">Actualizar</button>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
</div>