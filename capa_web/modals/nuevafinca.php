<!-- Modal nueva finca  -->
<div class="modal fade" id="nuevafinca" role="dialog">
    <div class="modal-dialog modal-large">
        <div class="modal-content">
            <div class="modal-header">
                <center><img src="../assets/img/log.jpg" width="150" height="150"/></center>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">
                <br>
                <hr>
                <div class="col-7">
                    <div class="widget-tabs-list">
                        <ul class="nav nav-tabs nav-justified">
                            <li class="active"><a data-toggle="tab" href="#menu0">Nueva Finca</a></li>
                            <li><a data-toggle="tab" href="#menu1">Razón Social</a></li>
                            <li><a data-toggle="tab" href="#menu2">Lotes</a></li>
                        </ul>
                        <div class="tab-content tab-custom-st">
                            <div id="menu0" class="tab-pane fade in active">
                                <div class="tab-ctn">
                                    <?php include_once("../capa_web/formularios/form_nuevafinca.php");?>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane fade">
                                <div class="tab-ctn">
                                    <?php include_once("../capa_web/formularios/form_empresa.php");?>
                                </div>
                            </div>
                            <div id="menu2" class="tab-pane fade">
                                <div class="tab-ctn">
                                    <div class="row">
                                        <div class="nk-int-mk sl-dp-mn">
                                            <h2 class="ui center aligned icon header">
                                                <div class="content">
                                                    Agregar Lotes
                                                    <div class="sub header">La nueva finca registrada debe tener por lo menos un lote asignado.</div>
                                                </div>
                                            </h2>
                                        </div>
                                        <br>
                                        <div class="panel panel-default" id="agg_lotes">
                                            <?php include_once("../capa_web/formularios/form_lotes.php");?>    
                                        </div>
                                        <div class="panel panel-tittle">
                                            <center>
                                                <a href="#quitar_lote" class="circular ui icon button red">
                                                    <i>-</i>
                                                </a>
                                                <a href="#nuevo_lote" class="circular ui icon button green">
                                                    <i>+</i>
                                                </a>
                                            </center>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br>
            </div>
            <div class="modal-footer">
                <!-- <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button> -->
                <a href="#nuevafinca" op="guardar" type="button" class="btn btn-success" data-dismiss="modal">Guardar</a>
            </div>
        </div>
    </div>
</div>