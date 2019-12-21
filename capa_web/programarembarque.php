<!-- ////////////////////////////////////////////////////////////////////////////// -->
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
        color:#000000;
        background-color:#f2fa07;
        border-radius:2px;
    }

</style>

<div class="container">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list">
                <div class="basic-tb-hd">
                    <h2>Programar Embarque</h2>
                    <hr>
                    <div class="row ui blue segment">
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-12">
                            <div class="form-inline text-center">
                                <div class="form-group">
                                    <div class="input-group">
                                        <div class="input-group-addon">Año</div>
                                        <input type="number" class="valida form-control" id="ano_pe">
                                    </div>
                                    <div class="input-group">
                                        <button class="ui blue button tiny waves-effect" id="btnBuscar_pe">
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
                                        <div class="input-group-addon">Semana</div>
                                        <select class="form-control" name="semanas_pe" id="semanas_pe">
                                        
                                        </select>
                                    </div>
                                    <div class="input-group">
                                        <div class="dropdown">
                                            <button class="ui blue button small waves-effect dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
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
    <div class="row" id="seleccion-pe" hidden>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="form-element-list mg-t-30">
                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                    <h2>Selección de cajas</h2>
                </div>
                <hr>
                <div class="row">
                    <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
                        <div class="panel panel-warning input-group">
                            <div class="input-group-addon">Cajas</div>
                            <select id="select-sc-pe" class="js-example-placeholder-multiple form-control" multiple="multiple">

                            </select>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-2">
                        <button class="btn btn-teal teal-icon-notika waves-effect" id="btnGuardar-sc">
                            <i class="fa fa-floppy-o" aria-hidden="true"></i>
                        </button>
                        <button class="btn btn-deeporange deeporange-icon-notika waves-effect" id="btnCancelar-sc">
                            <i class="notika-icon notika-close"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row" id="alineacion-pe" hidden>
        <div class="col-lg-12 col-md-12 col sm-12-col-xs-12">
            <div class="form-element-list mg-t-20">
                <div class="nk-int-mk sl-dp-mn sm-res-mg-t-10">
                    <h2>Alineación</h2>
                </div>
                <hr>
                <div class="datagrid">
                    <table class="display table-hover">
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
                                <!-- se usa como identificador la inicial de cada título de fila y las iniciales de la finca en la columna -->
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
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="paging">
                                       <strong class="ui label">EST. PREM:</strong>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                       <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="paging">
                                       <strong class="ui label mg-d-5">EST. M. ES:</strong>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                       <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                                <td>
                                    <div id="paging" class="text-center">
                                        <label class="ui green label">0</label>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                        <tbody id="data_cajas_pe">
                            <!-- <tr>
                                <td>1</td>
                                <td><span class="ui blue label">0101</span></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0"></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0" disabled></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0" disabled></center></td>
                                <td><center><input type="text" class="text-center" style="width:80px" value="0" disabled></center></td>
                            </tr> -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
