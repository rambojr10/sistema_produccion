<div class="modal fade" id="modal-ec" role="dialog">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Editar Caja</h2>
                <hr>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="ui form">
                    <div class="field">
                        <label>Código</label>
                        <input type="text" name="codigo_caja" placeholder="Identificador">
                    </div>
                    <div class="field">
                        <label>Descripción</label>
                        <input type="text" name="descripcion_caja" placeholder="Descripción del producto">
                    </div>
                    <div class="field">
                        <label>Factor de conversión</label>
                        <input type="text" name="factor_caja" placeholder="Ejemplo: 0.94">
                    </div>
                    <div class="field">
                        <label>Tipo Fruta</label>
                        <select class="form-control" name="tipofruta_caja" id="tipofruta_caja">
                            
                        </select>
                    </div>
                    <button class="ui primary button" type="button" name="btnActualizar_caja">Actualizar</button>
                </form>
            </div>
            <div class="modal-footer">
                <hr>
            </div>
        </div>
    </div>
</div>