<div class="modal fade" id="modal-nc" role="dialog">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Nueva Caja de Producción</h2>
                <hr>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <form class="ui form" id="form_nuevacaja" method="post" enctype="multipart/form-data">
                    <div class="field">
                        <label>Código</label>
                        <input type="text" name="codigo_caja_nueva" placeholder="Identificador">
                    </div>
                    <div class="field">
                        <label>Descripción</label>
                        <input type="text" name="descripcion_caja_nueva" placeholder="Descripción del producto">
                    </div>
                    <div class="field">
                        <label>Factor de conversión</label>
                        <input type="text" name="factor_caja_nueva" placeholder="Ejemplo: 0.94">
                    </div>
                    <div class="field">
                        <label>Tipo Fruta</label>
                        <select class="form-control" name="tipofruta_caja_nueva">

                        </select>
                    </div>
                    <button class="ui positive button" type="submit" name="btnGuardar_caja">Agregar nuevo registro</button>
                </form>
            </div>
            <div class="modal-footer">
                <hr>
            </div>
        </div>
    </div>
</div>