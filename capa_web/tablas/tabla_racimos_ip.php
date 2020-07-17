<?php
    if (isset($_GET['cod'])) {
        $cod_embarque = $_GET['cod'];
    }
?>
    <!-- cinta de opciones -->
     <!-- Botones finales -->
     
     <!-- Insertar racimos -->
     <div class="container">

        <div class="ui segment animated bounceInRight">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <p>Código de embarque: <span class="badge" id="cod_embarque_ip"><?php echo $cod_embarque; ?></span></p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div style="text-align: right;">
                        <button id="btnGuardar_racimos_ip" class="btn btn-default btn-icon-notika" data-tooltip="Guardar" data-position="top center">
                            <i class="fa fa-save"></i>
                        </button>
                        <button id="#btnCajas_racimos_ip" class="btn btn-default btn-icon-notika" data-tooltip="Insertar cajas" data-position="top center">
                            <i class="fa fa-box"></i>
                        </button>
                        <button id="btnVolver_racimos_ip" class="btn btn-default btn-icon-notika" data-tooltip="Inicio" data-position="top center">
                            <i class="fa fa-home"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- col1 -->
                <div class="col-lg-6 col-md-6">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Información de envío</h4>
                        <div class="three fields text-center">
                            <div class="field">
                                <label for="semana">Semana</label>
                                <input type="text" name="semana_racimos_ip" value="Semana 1" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="from">Desde</label>
                                <input type="text" name="from_racimos_ip" value="12/06/2020" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="to">Hasta</label>
                                <input type="text" name="to_racimos_ip" value="18/06/2020" class="text-center" disabled>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- col 2 -->
                <div class="col-lg-6 col-md-6">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Embolse</h4>
                        <div class="two fields">
                            <div class="field">
                                <div class="panel" id="pnlPresente">
                                    <label style="padding-left: 5px;">Presente</label>
                                    <input type="text" class="form-control" value="3851">
                                </div>
                            </div>
                            <div class="field">
                                <div class="panel" id="pnlPrematuro">
                                    <label style="padding-left: 5px;">Prematuro</label>
                                    <input type="text" class="form-control" value="3851">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>

    </div>

    <div class="breadcomb-area">
        <div style="margin: 25px;">
            <div id="tblRacimos_ip"></div>
        </div>
    </div>

    <script src="../logica/js/racimos_ip.js"></script>

    