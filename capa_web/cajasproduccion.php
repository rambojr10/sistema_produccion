<?php
    include_once '../capa_web/modals/nuevacaja.php';
    include_once '../capa_web/modals/editarcaja.php';
    include_once '../capa_web/modals/ver_elaboracion.php';
?>
<!-- Data Table area Start-->
<!-- <style>
    #data-table-basic {
    padding: 20px 0px;
    }
    .dataTables_wrapper .dataTables_info, .dataTables_wrapper .dataTables_paginate{
        padding-top:0px;
    }
    #data-table-basic_filter label, #data-table-basic_length label{
        margin-bottom: 0px;
    }
</style> -->
<div class="data-table-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="data-table-list">
                    <div class="basic-tb-hd">
                        <h2>Cajas Producción</h2>
                        <p>Lista de códigos cajas producción con su respectivo factor de conversión.</p>
                        <div class="breadcomb-report2">
                            <hr>
                            <button data-toggle="modal" id="modal_nuevacaja" data-target="#modal-nc" class="btn btn-warning notika-btn-warning"><span>Agregar nueva caja de producción</span></i></button>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table id="tblcajasproduccion" class="table">
                            <thead>
                                <tr>
                                    <th>Código</th>
                                    <th>Descripción</th>
                                    <th>Factor Conversión</th>
                                    <th>Tipo Fruta</th>
                                    <th>Opciones</th>
                                </tr>
                            </thead>
                            <tbody id="cajasproduccion">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
