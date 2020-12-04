<?php

    include_once '../../capa_web/modals/veralineacion.php';

    if (isset($_GET['cod_embarque'])) {
        $cod_embarque = $_GET['cod_embarque'];
    }
?>
    <style>
        hr {
            height: 3px;
            background: #1abc9c ;
            border: none;
            border-radius: 50px;
            outline: none;
            margin: .5em 6em .5em;
            position: relative;
        }
        input:disabled {
            opacity: .9 !important;
        }

    </style>

    <div class="container">

        <div class="ui segment animated bounceInRight">

            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <p>Código de embarque: <span class="badge" id="cod_embarque_ip"><?php echo $cod_embarque; ?></span></p>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div style="text-align: right;">
                        <button id="btnVerAlineacion" class="btn btn-default btn-icon-notika" data-tooltip="Ver alineación" data-position="top center" data-toggle="modal" data-target="#modal-va">
                            <i class="fa fa-th-large"></i>
                        </button>
                        <button id="btnGuardar_ip" class="btn btn-default btn-icon-notika" data-tooltip="Guardar" data-position="top center">
                            <i class="fa fa-save"></i>
                        </button>
                        <button id="btnEliminar_ip" class="btn btn-default btn-icon-notika" data-tooltip="Eliminar" data-position="top center">
                            <i class="fa fa-trash"></i>
                        </button>
                        <button id="btnVolver_ip" class="btn btn-default btn-icon-notika" data-tooltip="Inicio" data-position="top center">
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
                                <input type="text" name="semana_ip" value="Semana 0" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="from">Desde</label>
                                <input type="text" name="from_ip" value="00/00/0000" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="to">Hasta</label>
                                <input type="text" name="to_ip" value="00/00/0000" class="text-center" disabled>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- col 2 -->
                <div class="col-lg-6 col-md-6">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Embolse</h4>
                        <div class="three fields">
                            <div class="field">
                                <div class="panel" id="pnlPresente">
                                    <label style="padding-left: 5px;">Presente</label>
                                    <input type="text" class="form-control" value="0" id="txtPresente_ip">
                                </div>
                            </div>
                            <div class="field">
                                <div class="panel" id="pnlPrematuro">
                                    <label style="padding-left: 5px;">Prematuro</label>
                                    <input type="text" class="form-control" value="0" id="txtPrematuro_ip">
                                </div>
                            </div>
                            <div class="field">
                                <div class="panel">
                                    <label style="padding-left: 5px;">Total embolse</label>
                                    <input type="text" class="form-control" value="0" id="lblTotal_ip" disabled>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <h4 class="ui dividing header">Información de elaboración</h4>
                    <div class="ui horizontal divided list">
                        <div class="item">
                            <div class="content">
                                <div class="header">Cajas elaboradas</div>
                                <span id="lblCajasElaboradas">0</span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <div class="header">Cajas programadas</div>
                                <span id="lblCajasProgramadas">0</span>
                            </div>
                        </div>
                        <div class="item">
                            <div class="content">
                                <div class="header">Versus</div>
                                <span id="lblVersusCajas">0/0</span>
                            </div>
                        </div>
                        <div class="progress">
                            <div class="progress-bar wow fadeInLeft" id="lblPorcentajeCajas" data-progress="0%" style="width: 0%;" data-wow-duration="1.5s" data-wow-delay="1.2s"> <span style="color: black;">0%</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

    <!-- tblRacimos -->
    <div class="breadcomb-area" style="margin: 25px;">
        <blockquote>
            <p class="blockquote-nk">Tabla racimos</p>
        </blockquote>
        <div id="tblRacimos_ip"></div>
    </div>
    <!-- tblCajas -->
    <div class="breadcomb-area mg-t-10" style="margin: 25px;">
        <blockquote>
            <p class="blockquote-nk">Tabla cajas producción</p>
        </blockquote>
        <div id="tblCajas_ip"></div>
    </div>
    <!-- tblNacional -->
    <div class="breadcomb-area mg-t-10" style="margin: 25px;">
        <blockquote>
            <p class="blockquote-nk">Mercado nacional y cargue</p>
        </blockquote>
        <div id="tblNacional_ip"></div>
    </div>
    <hr>
    <!-- tblCargue -->
    <div class="breadcomb-area mg-t-10" style="margin: 25px;">
        <div id="tblCargue_ip"></div>
    </div>

    <script src="../logica/js/ingresarproduccion/tablas_ingresarproduccion.js"></script>

    