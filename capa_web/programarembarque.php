
<!-- Tabla alineación ////////////////////////////////////////////////////////////////////////////// -->
<style>
    .datagrid table { 
		border-collapse: collapse; 
		text-align: left; 
		width: 100%; 
	} 
	.datagrid {
		font: normal 12px/150% Arial, Helvetica, sans-serif; 
		background: #fff; 
		overflow: hidden; 
		border: 1px solid #006699; 
		-webkit-border-radius: 3px; 
		-moz-border-radius: 3px; 
		border-radius: 3px; 
        overflow: auto;
	}
	.datagrid table td, .datagrid table th { 
		padding: 3px 10px; 
	}
	.datagrid table thead th {
		background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
		background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );
		filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
		background-color:#006699; 
		color:#FFFFFF; 
		font-size: 15px; 
		font-weight: bold; 
		border-left: 1px solid #0070A8; 
	} 
	.datagrid table thead th:first-child { 
		border: none; 
	}
	.datagrid table tbody td { 
		color: #00557F; 
		border-left: 1px solid #E1EEF4;
		font-size: 12px;
		font-weight: normal; 
	}
	.datagrid table tbody .alt td { 
		background: #E1EEf4; 
		color: #00557F; 
	}
	.datagrid table tbody td:first-child { 
		border-left: none; 
	}
	.datagrid table tbody tr:last-child td { 
		border-bottom: none;
	}
    .datagrid table tfoot td div { 
        border-top: 1px solid #006699;
        background: #E1EEF4;
    } 
    .datagrid table tfoot td { 
        padding: 0; font-size: 12px 
    } 
    .datagrid table tfoot td div{ 
        padding: 2px; 
    }.datagrid table tfoot td ul { 
        margin: 0; 
        padding:0; 
        list-style: none; 
        text-align: right; 
    }.datagrid table tfoot  li { 
        display: inline; 
    }.datagrid table tfoot li a { 
        text-decoration: none; 
        display: inline-block;  
        padding: 2px 8px; 
        margin: 1px;
        color: #FFFFFF;
        border: 1px solid #006699;
        -webkit-border-radius: 3px; 
        -moz-border-radius: 3px; 
        border-radius: 3px; 
        background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #006699), color-stop(1, #00557F) );
        background:-moz-linear-gradient( center top, #006699 5%, #00557F 100% );
        filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#006699', endColorstr='#00557F');
        background-color:#006699; 
    }
    .datagrid table tfoot ul.active, .datagrid table tfoot ul a:hover { 
        text-decoration: none;
        border-color: #006699; 
        color: #FFFFFF; 
        background: none; 
        background-color:#00557F;
    }
    div.dhtmlx_window_active, div.dhx_modal_cover_dv { 
        position: fixed !important; 
    }
    .titulo{
        color: #000000;
        background-color: #f2fa07;
        border-radius: 2px;
    }
    
    input {
        border-width: 1px;
    }

</style>

<!-- Contenedor principal -->
<div class="container">

    <!-- Programar embarque -->
    <div class="row animated bounceInLeft">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list">
                <div class="basic-tb-hd">
                    <h2>Programar Embarque</h2>
                    <hr>
                    <div class="row">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <div class="form-inline text-center">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-primary">Año</div>
                                        <input type="number" class="valida form-control" id="anho_pe">
                                    </div>
                                    <div class="input-group">
                                        <button class="btn btn-default notika-btn-default waves-effect" id="btnBuscar_pe">
                                            <i class="notika-icon notika-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-12">
                            <form class="form-inline text-center">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon bg-primary">Semana</div>
                                        <select class="ui dropdown" name="semanas_pe" id="semanas_pe">
                                        
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <div class="dropdown">
                                            <button class="btn btn-default notika-btn-default small waves-effect dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Selección de Cajas
                                                <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <li><a href="#seleccionar_pe">Seleccionar</a></li>
                                                <li><a href="#semana_anterior_pe">Semana anterior</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Selección de cajas -->
    <div class="row" id="seleccion-pe" hidden>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list mg-t-20">
                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                    <h2>Selección de cajas</h2>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                        <div class="ui raised segment input-group">
                            <div class="input-group-addon bg-primary">Cajas</div>
                            <select id="select-sc-pe" class="js-example-placeholder-multiple form-control" multiple="multiple">

                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2 mg-t-15 text-center">
                        <button class="btn btn-teal teal-icon-notika waves-effect" id="btnGuardar-sc">
                            <i class="fa fa-chevron-right" aria-hidden="true"></i>
                        </button>
                        <button class="btn btn-gray gray-icon-notika waves-effect" id="btnCancelar-sc">
                            <i class="fa fa-close"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Alineación -->
    <div class="row" id="alineacion-pe" hidden>
        <div class="col-lg-12 col-md-12 col sm-12-col-xs-12">
            <div class="form-element-list mg-t-20">
                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                    <h3>Alineación</h3>
                    <h2>Código: <span class="ui green label" id="cod_embarque-pe"></span></h2>
                    <p class="text-muted" id="descripcion_embarque-pe">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                </div>
                <hr>
                <div class="datagrid">
                    <table class="display table-hover" id="tblAlineacion-pe">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>CÓDIGO</th>
                                <th class="text-center">ZARZAMORA</th>
                                <th class="text-center">GUAIMARAL</th>
                                <th class="text-center">TAIWÁN</th>
                                <th class="text-center">CANDELARIA</th>
                                <th class="text-center">ÁLAMOS</th>
                                <th class="text-center">KALAMARÍ</th>
                                <th class="text-center"><span class="titulo">CAJAS</span></th>
                                <th class="text-center"><span class="titulo">PRE.20 KLS</span></th>
                                <th class="text-center"><span class="titulo">M.E.20 KLS</span></th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <td colspan="2">
                                    <div id="paging">
                                       <strong class="ui label">Total:</strong>
                                    </div>
                                </td>
                                <!-- id_xx se usa como identificador la inicial de cada título de fila y las iniciales de la finca en la columna -->
                                <td>
                                    <div id="paging" class="text-center">
                                       <label class="ui green label" id="t_zz">0</label> 
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_gm">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_tw">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_cn">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_al">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_kl">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_cj">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_pm">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label" id="t_me">0</label>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody id="data_cajas_pe">
                           
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Estimativo -->
    <div class="row" id="estimativo-pe" hidden>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ui center aligned segment">
            <div class="form-element-list mg-t-10">
                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                    <h3>Estimativo</h3>
                </div>
                <hr>
                <div class="ui mini form">
                    <div class="fields">
                        <div class="field text-center">
                            <label>ZARZAMORA</label>
                            <input type="number" class="valida premiun" id="premiun_zz" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_zz" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>GUAIMARAL</label>
                            <input type="number" class="valida premiun" id="premiun_gm" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_gm" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>TAIWÁN</label>
                            <input type="number" class="valida premiun" id="premiun_tw" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_tw" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>CANDELARIA</label>
                            <input type="number" class="valida premiun" id="premiun_cn" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_cn" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>ÁLAMOS</label>
                            <input type="number" class="valida premiun" id="premiun_al" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_al" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>KALAMARÍ</label>
                            <input type="number" class="valida premiun" id="premiun_kl" placeholder="Premiun">
                            <hr>
                            <input type="number" class="valida especial" id="especial_kl" placeholder="Especial">
                        </div>
                        <div class="field text-center">
                            <label>TOTAL</label>
                            <div class="website-traffic-ctn">
                                <h2><span class="counter" id="t_premiun">0</span></h2>
                                <br>
                                <h2><span class="counter" id="t_especial">0</span></h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Botones finales -->
    <div class="row" id="opciones-pe" hidden>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list mg-t-10">
                <div class="form-inline text-center">
                    <button id="btnGuardar-pe" class="btn btn-default btn-icon-notika" data-tooltip="Guardar" data-position="top center">
                        <i class="fa fa-save"></i>
                    </button>
                    <button id="btnEliminar-pe" class="btn btn-default btn-icon-notika" data-tooltip="Eliminar" data-position="top center">
                        <i class="fa fa-trash"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    $("#semanas_pe").dropdown();
</script>
