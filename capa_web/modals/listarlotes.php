

<!-- Modal lotes  -->
<div class="modal fade" id="modal-ll" role="dialog" style="overflow-y: auto;">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <h2>Información de Lotes</h2>
                <span class="ui red tag label" id="finca_l"></span>
                <hr>
                <div class="bsc-tbl">
                    <table class="ui red table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Área_Neta</th>
                                <th>Área_Bruta</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody id="listarlotes">

                        </tbody>
                    </table>
                </div>  
            </div>
            <div class="modal-footer">
                <hr>
            </div>
        </div>
    </div>
</div>

<?php
    include_once './modals/editarlote.php';
?>