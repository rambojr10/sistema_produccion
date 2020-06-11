<div class="modal fade" id="modal-ve" role="dialog" style="overflow-y: auto;">
    <div class="modal-dialog modals-default">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <div class="header">
                    <h3>Elaboración Caja</h3>
                    <div>
                        <h4 class="text-muted">Codigo: <span class="ui blue circular label" id="codigo_ve"></span></h4>
                        <!-- <label for="fincas_ve" class="form-control">Finca: </label> -->
                        <select name="fincas_ve" class="form-control">
                            
                        </select>
                    </div>
                    <hr>
                </div>
                <div class="row">
                    <div class="col-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading text-center">
                                Filtros
                            </div>
                            <div class="panel-body">
                                <div class="toggle-select-act fm-cmp-mg">
                                    <div class="nk-toggle-switch" data-ts-color="red">
                                        <input id="cbsemanal" type="checkbox" hidden="hidden">
                                        <label for="cbsemanal" class="ts-helper"></label>
                                        <label for="cbsemanal" class="ts-label"> Semanal</label>
                                    </div>
                                </div>
                                <div class="toggle-select-act mg-t-10">
                                    <div class="nk-toggle-switch" data-ts-color="blue">
                                        <input id="cbanual" type="checkbox" hidden="hidden">
                                        <label for="cbanual" class="ts-helper"></label>
                                        <label for="cbanual" class="ts-label"> Anual</label>
                                    </div>
                                </div>
                                <div class="toggle-select-act mg-t-10">
                                    <div class="nk-toggle-switch" data-ts-color="green">
                                        <input id="cbhistorico" type="checkbox" hidden="hidden">
                                        <label for="cbhistorico" class="ts-helper"></label>
                                        <label for="cbhistorico" class="ts-label"> Histórico</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-6 col-sm-6 col-xs-12">
                        <div class="panel panel-info">
                            <div class="panel-heading text-center">
                                Complemento
                            </div>
                            <div class="panel-body" id="form_ve">
                                <!-- carga formulario de búsqueda de elaboración segun el checkbox -->
                            </div>
                            <div class="panel-footer">
                                <button class="btn btn-success btn-block" id="btnbuscar_ve">Buscar</button>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
                <div class="panel-group">
                    <table class="ui single line table">
                        <thead class="text-center">
                            <th id="nombre_caja">
                                
                            </th>
                        </thead>                        
                    </table>
                </div>
                <div class="bsc-tbl">
                    <table class="table table-condensed" id="resultado_ve">
                        
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <hr>
                <h5>Grupo Montesol</h5>
                <hr>
            </div>
        </div>
    </div>

</div>
