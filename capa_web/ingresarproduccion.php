<?php
    include_once '../capa_web/modals/cargarembarque_ip.php';
?>

    <div class="breadcomb-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="breadcomb-list">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                <div class="breadcomb-wp">
                                    <div class="breadcomb-icon">
                                        <i class="notika-icon notika-form"></i>
                                    </div>
                                    <div class="breadcomb-ctn">
                                        <h2>Registrar Producción</h2>
                                        <p>Sistema de Producción <span class="bread-ntd">Grupo Montesol</span></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Racimos -->
        <div class="panel panel-success text-center">
            <div class="panel-heading">
                <h4>Racimos</h4>
            </div>
            <div class="panel-body">
                <h5 class="card-title">Información de racimos</h5>
                <p class="card-text">Última semana registrada: <span class="label label-warning">31</span></p>
                <button type="button" id="btnModal_racimos_ip" class="btn btn-success notika-btn-success waves-effect" data-toggle="modal" data-target="#modal-racimos-ip">Ingresar</button>
            </div>
        </div>
        
        <!-- Cajas -->
        <div class="panel panel-primary text-center">
            <div class="panel-heading">
                <h4>Cajas Elaboradas</h4>
            </div>
            <div class="panel-body">
                <h5 class="card-title">Información de Cajas Elaboradas</h5>
                <p class="card-text">Última semana registrada: <span class="label label-warning">31</span></p>
                <button type="button" class="btn btn-primary notika-btn-primary waves-effect" id="btnIngresarCajas_ip" data-toggle="modal" data-target="#modal-cajas-ip">Ingresar</button>
            </div>
        </div>
        
        <!-- Mercado Nacional -->
        <div class="panel panel-danger text-center">
            <div class="panel-heading">
                <h4>Mercado Nacional</h4>
            </div>
            <div class="panel-body">
                <h5 class="card-title">Información de Mercado Nacional</h5>
                <p class="card-text">Última semana registrada: <span class="label label-warning">31</span></p>
                <button type="button" class="btn btn-danger notika-btn-danger waves-effect" id="btnIngresarNacional_ip" data-toggle="modal" data-target="#modal-nacional-ip">Ingresar</button>
            </div>
        </div>
    </div>