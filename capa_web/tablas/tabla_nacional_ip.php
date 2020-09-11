<?php 
    if (isset($_GET['cod_embarque'])) {
        $cod_embarque = $_GET['cod_embarque'];
    }
?>
    <!-- Insertar mercado nacional -->
    <div class="container">

        <div class="ui segment">

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <p>Código de embarque: <span class="badge" id="codEmbarque_nacional_ip"><?php echo $cod_embarque; ?></span></p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div style="text-align: right;">
                        <button id="btnGuardar_nacional_ip" class="btn btn-default btn-icon-notika" data-tooltip="Guardar" data-position="top center">
                            <i class="fa fa-save"></i>
                        </button>
                        <button id="btnVolver_nacional_ip" class="btn btn-default btn-icon-notika" data-tooltip="Inicio" data-position="top center">
                            <i class="fa fa-home"></i>
                        </button>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Información de envío</h4>
                        <div class="three fields text-center">
                            <div class="field">
                                <label for="semana">Semana</label>
                                <input type="text" id="semana_nacional_ip" value="Semana 1" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="from">Desde</label>
                                <input type="text" id="from_nacional_ip" value="00/00/0000" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="to">Hasta</label>
                                <input type="text" id="to_nacional_ip" value="00/00/0000" class="text-center" disabled>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <!-- Nacional -->
    <div class="breadcomb-area">
        <div style="margin: 25px;">
            <div id="tblNacional_ip"></div>
        </div>
    </div>

    <!-- Cargue -->
    <div class="breadcomb-area mg-t-10">
        <div style="margin: 25px;">
            <div id="tblCargue_ip"></div>
        </div>
    </div>

    <script src="../logica/js/ingresarproduccion/nacional_ip.js"></script>
    