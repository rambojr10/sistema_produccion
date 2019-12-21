<?php 
    include_once '../capa_web/modals/editarempresa.php';
    include_once '../capa_web/modals/nuevaempresa.php';
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
										<i class="notika-icon notika-finance"></i>
									</div>
									<div class="breadcomb-ctn">
										<h2>Razones Sociales</h2>
										<p>Listado de empresas pertenecientes al <span class="bread-ntd">Grupo Montesol</span></p>
									</div>
								</div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                                <div class="breadcomb-report2">
                                    <button data-placement="left" data-toggle="modal" data-target="#modal-nv" class="btn btn-warning notika-btn-warning"><span>Agregar nueva empresa</span></i></button>
                                </div>
                            </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <div class="normal-table-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="normal-table-list">
                        <div class="basic-tb-hd">
                            <h2>Todas las empresas</h2>
                            <p>Las razones sociales son las empresas administradas por el Grupo Montesol</p>
                        </div>
                        <div class="bsc-tbl">
                            <table class="table table-condensed table-striped">
                                <thead>
                                    <tr>
                                        <th>Nit</th>
                                        <th>Razón Social</th>
                                        <th>Dirección</th>
                                        <th>Teléfono</th>
                                        <th>Opciones</th>
                                    </tr>
                                </thead>
                                <tbody id="listarempresas">
                                   
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>