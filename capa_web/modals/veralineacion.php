
<div class="modal fade" id="modal-va" role="dialog" style="overflow-y: auto;">
    <div class="modal-dialog modals-default">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h1 class="text-center">
                    <i class="fa fa-dropbox"></i>
                </h1>
                <h2 class="text-center">Ver alineación</h2>
                <hr>
            </div>

            <div class="modal-body">
                <div class="panel panel-success">
                    <div class="panel-body">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Caja</th>
                                    <th>Cantidad</th>
                                </tr>
                            </thead>
                            <tbody id="veralineacion">
                            
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <div class="modal-footer">

            </div>

        </div>
    </div>
</div>

<!-- SELECT de.FKCodigo_TblCajasProduccion as Código, cp.Descripcion as Caja, de.Cantidad as Cantidad
FROM tbldet_tblembarque as de, tblcajasproduccion as cp
WHERE de.FKCodigo_TblCajasProduccion = cp.PKCodigo
AND de.FKIbm_TblFincas = '80074'
AND de.FKCod_TblEmbarque = 'EMB-202010' -->