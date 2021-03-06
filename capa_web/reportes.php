    
    <style>
        table thead th {
            text-align: center !important;
        }
        table tbody tr:hover {
            background-color: gray;
            cursor: pointer;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="invoice-wrap">
                    <h2>Reportes <i class="fa fa-inbox"></i></h2>
                    
                    <div class="invoice-hds-pro">
                        <hr>
                        <div class="ui pointing blue four item menu" id="menuItems">
                            <a class="item" id="btnEmbarques">
                                Embarques
                            </a>
                            <a class="item" id="btnAllinone">
                                All in one
                            </a>
                            <a class="item" id="btnRechazos">
                                Rechazos
                            </a>
                            <a class="item" id="btnNacional">
                                Mercado nacional
                            </a>    
                        </div>
                    </div>

                    <!-- Forms -->
                    <div class="ui segment" style="padding-bottom: 0;">
                        <form class="ui form">
                            <div class="field">
                                <div class="three fields">
                                    <div class="field">
                                        <div class="ui labeled mini input">
                                            <div class="ui label">Año</div>
                                            <input type="text" id="txtAnho" name="txtAnho" class="valida">
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui labeled mini input">
                                            <div class="ui label">Desde</div>
                                            <select name="cmbDesde" id="cmbDesde">
                                                <option>Seleccione...</option>
                                                <?php include './formularios/semanas.php'; ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="field">
                                        <div class="ui labeled mini input">
                                            <div class="ui label">Hasta</div>
                                            <select name="cmbHasta" id="cmbHasta">
                                                <option>Seleccione...</option>
                                                <?php include './formularios/semanas.php'; ?>
                                            </select>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="two fields">
                                <div class="field">
                                    <div class="ui labeled mini input">
                                        <div class="ui label">Fincas</div>
                                        <select name="cmbFincas" id="cmbFincas">

                                        </select>
                                    </div>
                                </div>
                                <div class="field">
                                    <div class="ui labeled mini input">
                                        <div class="ui label">Tipo fruta</div>
                                        <select name="cmbTipoFruta" id="cmbTipoFruta">

                                        </select>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div class="ui labeled input-group input-group-sm mg-b-15">
                            <div class="input-group-addon" style="font-weight: 700; font-size: 11px;">Cajas</div>
                            <select id="cmbCajas" class="js-example-placeholder-multiple form-control" multiple="multiple">
                                
                            </select>
                        </div>
                    </div>
                    
                    <div class="mg-b-15">
                        <button id="btnGenerarReportes" class="btn btn-default">
                            <i class="fa fa-clone"></i>
                            Generar reportes
                        </button>
                    </div>                        
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="invoice-wrap mg-t-15">
            <h4>Information</h4>
            <div class="table-responsive" id="tblReportes" style="font-size: 11.5px; margin-bottom: 10px;">
            
            </div>

            <!-- Mini cards -->
            <div class="row mg-b-15">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="invoice-hs">
                        <span>Invoice#</span>
                        <h2>456656</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="invoice-hs date-inv sm-res-mg-t-30 tb-res-mg-t-30 tb-res-mg-t-0">
                        <span>Date</span>
                        <h2>20/03/2018</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="invoice-hs wt-inv sm-res-mg-t-30 tb-res-mg-t-30 tb-res-mg-t-0">
                        <span>Whatever</span>
                        <h2>472-000</h2>
                    </div>
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                    <div class="invoice-hs gdt-inv sm-res-mg-t-30 tb-res-mg-t-30 tb-res-mg-t-0">
                        <span>Grand Total</span>
                        <h2>$25,980</h2>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>Detalle</h3>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-light">
                                    <thead class="thead-light">
                                        <tr>
                                            <th>Description</th>
                                            <th>RT</th>
                                            <th>MR</th>
                                            <th>PR</th>
                                            <th>AR</th>
                                            <th>PV</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Total</th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-success">
                        <div class="panel-heading">
                            <h3>Cantidades</h3>
                        </div>
                        <div class="panel-body">
                        
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

   