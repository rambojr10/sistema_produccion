<!-- Modal editar lote por id -->
<!-- <div class="ui tiny modal" role="dialog">
    <div class="header">
        Header
    </div>
    <div class="content">
        <p></p>
    </div>
    <div class="actions">
        <div class="ui approve button">Approve</div>
        <div class="ui button">Neutral</div>
        <div class="ui cancel button">Cancel</div>
    </div>
</div> -->

<div class="modal fade" id="editarlote" role="dialog">
    <<div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h2>Editar Lote</h2>
                <span class="label label-success" id="nom_l">Lote 1</span>
                <hr>
                <div>
                    <label for="area_neta">Area Neta</label>
                    <input class="form-control" type="text" name="area_neta" id="area_neta">
                    <label for="area_bruta">Area Bruta</label>
                    <input class="form-control" type="text" name="area_bruta" id="area_bruta">
                </div>
            </div>
            <br>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Actualizar</button>
            </div>
        </div>
    </div>
</div>