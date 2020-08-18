<?php 
    if (isset($_GET['cod_embarque'])) {
        $cod_embarque = $_GET['cod_embarque'];
    }
?>
    <div class="container">
        <div class="ui segment">

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <p class="mg-t-5">Codigo de embarque: <span class="badge" id="codEmbarque_cajas_ip"><?php echo $cod_embarque;?></span></p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div style="text-align: right;">
                        <button id="btnGuardar_cajas_ip" class="btn btn-default btn-icon-notika" data-tooltip="Guardar" data-position="top center">
                            <i class="fa fa-save"></i>
                        </button>
                        <button id="btnInicio_cajas_ip" class="btn btn-default btn-icon-notika" data-tooltip="Inicio" data-position="top center">
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
                                <input type="text" id="semana_cajas_ip" value="Semana 1" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="from">Desde</label>
                                <input type="text" id="from_cajas_ip" value="12/06/2020" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="to">Hasta</label>
                                <input type="text" id="to_cajas_ip" value="18/06/2020" class="text-center" disabled>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="breadcomb-area" style="margin: 25px;">
        <div id="tblCajas_ip"></div>
    </div>

    <script src="../logica/js/cajas_ip.js"></script>