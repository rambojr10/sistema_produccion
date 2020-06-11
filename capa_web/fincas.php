<?php 
    include_once '../capa_web/modals/nuevafinca.php';
    include_once '../capa_web/modals/listarlotes.php';
    include_once '../capa_web/modals/verempresa.php';
?>

    <!-- title area -->
    <div class="breadcomb-area">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="breadcomb-list">
						<div class="row">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="breadcomb-wp">
									<div class="breadcomb-icon">
										<i class="notika-icon notika-map"></i>
									</div>
									<div class="breadcomb-ctn">
										<h2>Fincas</h2>
										<p>Listado de fincas pertenecientes al <span class="bread-ntd">Grupo Montesol</span></p>
									</div>
								</div>
							</div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                                <div class="breadcomb-report2">
                                    <a href="#frmfinca" data-toggle="modal" data-target="#nuevafinca" class="btn btn-warning notika-btn-warning"><span>Agregar nueva finca</span></i></a>
                                </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
    </div>
    <!-- title area End -->

    <!-- container module -->
    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list">
                        <div class="basic-tb-hd">
                            <h2>Todas las fincas</h2>
                            <p>Cada finca pertenece a una razón social...</p>
                        </div>
                        <div class="bsc-tbl">
                            <table class="table table-condensed table-striped">
                                <thead>
                                    <tr>
                                        <th>IBM</th>
                                        <th>Nombre</th>
                                        <th>Área Neta</th>
                                        <th>Área Bruta</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody id="listarfincas">
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>
    <!-- container module End -->