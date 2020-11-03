<?php
    session_start();
    if(isset($_SESSION['conectado'])){
        
    }else{
        header("Location:./ingreso.php");
    }
?>

<!doctype html>
<html class="no-js" lang="es">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sistema Producción - Grupo MONTESOL </title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/logo/icono.png">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/bootstrap/bootstrap.min.css">
    <!-- font awesome CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/owl.carousel.css">
    <link rel="stylesheet" href="../assets/css/owl.theme.css">
    <link rel="stylesheet" href="../assets/css/owl.transitions.css">
    <!-- meanmenu CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/meanmenu/meanmenu.min.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/notika-custom-icon.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/normalize.css">
    <!-- select2 CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/select2/select2.min.css">
	<!-- wave CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/wave/waves.min.css">
    <link rel="stylesheet" href="../assets/css/wave/button.css">
    <!-- dialog CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/dialog/sweetalert2.min.css">
    <link rel="stylesheet" href="../assets/css/dialog/dialog.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/main.css">
    <!-- Semantic CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/semantic/semantic.min.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="../style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/responsive.css">
     <!-- Data-Tables CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/jquery.dataTables.css">
    <!-- modernizr JS
		============================================ -->
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- Vue JS
		============================================ -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/vue@2.6.11"></script>

    <!-- Handsontable -->
    <link href="../assets/plugins/handsontable/handsontable.full.min.css" rel="stylesheet" media="screen">
    <link href="../assets/plugins/handsontable/pikaday/pikaday.css">

</head>

<body>
    <!-- Loader  -->
    <div class="osc"></div>
    <div class="loadingio-spinner-pulse-2aaif4t0mjx centerLoading" id="loader">
        <div class="ldio-biy5nta378e">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <!-- End loader -->

    <!-- Header -->
    <div class="header-top-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                    <div class="logo-area">
                        <a href="#"><img src="../assets/img/logo/logoe.png" alt="" /></a>
                    </div>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
                    <div class="header-top-menu">
                        <ul class="nav navbar-nav notika-top-nav">
                            <div class="row mg-t-20">
                                <button class="btn btn-success notika-btn-success waves-effect">
                                    USUARIO: <span class="badge" id="lblusuario"><?php echo ($_SESSION['conectado']->FKId_TblTipoUsuario==1) ? "ADMINISTRADOR" : $_SESSION['conectado']->Nombre ?></span>
                                </button>
                                <button class="btn btn-success notika-btn-success waves-effect">
                                    SEMANA: <span class="badge" id="lblsemana">00</span>
                                </button>
                                <button class="btn btn-success notika-btn-success waves-effect">
                                    FECHA: <span class="badge" id="lblfecha">00/00/00</span>
                                </button>
                                <a href="../logica/salir.php" class="btn btn-warning notika-btn-warning waves-effect">
                                    Salir
                                </a>
                            </div>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Header Top Area -->

    <!-- Main Menu area start-->
    <div class="main-menu-area mg-tb-40">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <ul class="nav nav-tabs notika-menu-wrap menu-it-icon-pro">
                        <li class="active"><a data-toggle="tab" href="#inicio"><i class="notika-icon notika-house"></i> Inicio</a>
                        </li>

                        <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) : ?> 
                        <li>
                            <a data-toggle="tab" href="#fincas"><i class="notika-icon notika-app"></i> Fincas</a>
                        </li>
                        <?php endif; ?>

                        <li>
                            <a data-toggle="tab" href="#produccion"><i class="notika-icon notika-edit"></i> Producción</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#reportes"><i class="notika-icon notika-bar-chart"></i> Reportes</a>
                        </li>
                        <li>
                            <a data-toggle="tab" href="#usuarios"><i class="notika-icon notika-social"></i> Usuarios</a>
                        </li>
                    </ul>
                    <div class="tab-content custom-menu-content">
                        <div id="inicio" class="tab-pane in active notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li>
                                    <a href="../index.php">Dashboard</a>
                                </li>
                            </ul>
                        </div>

                        <div id="fincas" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li>
                                    <a href="#listarfincas">Listar Fincas</a>
                                </li>
                                <li>
                                    <a href="#listarempresas">Razones Sociales</a>
                                </li>
                            </ul>
                        </div>

                        <div id="produccion" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li>
                                    <a href="#ingresarproduccion">Ingresar Producción</a>
                                </li>

                                <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) : ?> 
                                <li>
                                    <a href="#cajasproduccion">Cajas Producción</a>
                                </li>
                                <li>
                                    <a href="#programarembarque">Programar Embarque</a>
                                </li>
                                <?php endif; ?>

                            </ul>
                        </div>
                        <div id="reportes" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <li><a href="#">Ver Reporte Global</a>
                                </li>
                                <li><a href="#">Ver Reporte Semanal</a>
                                </li>

                                <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) : ?> 
                                <li><a href="#">Ver Reporte por Fincas</a>
                                </li>
                                <?php endif; ?>

                                <li><a href="#">Ver Reporte por Cajas</a>
                                </li>
                            </ul>
                        </div>
                        <div id="usuarios" class="tab-pane notika-tab-menu-bg animated flipInX">
                            <ul class="notika-main-menu-dropdown">
                                <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) : ?> 
                                <li><a href="#listarusuarios">Usuarios</a>
                                </li>
                                <?php endif; ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Main Menu area End-->

    <!-- Container initial-->
    <div class="contenido">

        <!-- section title -->
        <div class="breadcomb-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcomb-list">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <div class="breadcomb-wp">
                                        <div class="breadcomb-icon">
                                            <i class="notika-icon notika-house"></i>
                                        </div>
                                        <div class="breadcomb-ctn">
                                            <h2>Estadísticas</h2>
                                            <p>Sistema de Producción <span class="bread-ntd">Grupo Montesol</span></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-3">
                                    <div class="breadcomb-report">
                                        <button data-toggle="tooltip" data-placement="left" title="Descargar Reporte" class="btn"><i class="notika-icon notika-sent"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- section title End-->

        <!-- stadistics home-->
        <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) :?>
            <div class="visitor-sv-tm-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="visitor-sv-tm-int">
                                <div class="contact-hd mg-bt-ant-inner">
                                    <h2>Producción</h2>
                                    <p>Total produccion por fincas, histórico.</p>
                                </div>
                                <div class="visitor-sv-tm-ch">
                                    <div id="visit-server-time" class="flot-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mg-t-30">
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="visitor-sv-tm-int sm-res-mg-t-30">
                                <div class="contact-hd mg-bt-ant-inner server-sts-rgt">
                                    <h2>Semana registrada</h2>
                                    <p>Última semana registrada por cada fincas.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Finca</th>
                                                <th class="text-right">#Semana</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Álamos</td>
                                                <td class="text-right"><span class="btn-success">50</span></td>
                                            </tr>
                                            <tr>
                                                <td>Guaimaral</td>
                                                <td class="text-right"><span class="btn-danger">49</span></td>
                                            </tr>
                                            <tr>
                                                <td>Taiwán</td>
                                                <td class="text-right"><span class="btn-danger">49</span></td>
                                            </tr>
                                            <tr>
                                                <td>Kalamarí</td>
                                                <td class="text-right"><span class="btn-danger">48</span></td>
                                            </tr>
                                            <tr>
                                                <td>Zarzamora</td>
                                                <td class="text-right"><span class="btn-success">51</span></td>
                                            </tr>
                                            <tr>
                                                <td class="analysis-rd-mg">Candelaria</td>
                                                <td class="text-right analysis-rd-mg"><span class="btn-success">51</span></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <span class="ui red label">Atrasado</span><span class="ui green label">Al día</span>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                            <div class="visitor-sv-tm-int sm-res-mg-t-30 tb-res-mg-t-30 tb-res-ds-n dk-res-ds">
                                <div class="contact-hd mg-bt-ant-inner">
                                    <h2>Producción semanal</h2>
                                    <p>Comparativa con el total de producción de las fincas.</p>
                                </div>
                                <div class="visitor-st-ch visitor-ov-ct">
                                    <div id="visit-over-time" class="flot-chart"></div>
                                    <div class="flc-visits"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- statistics home End-->

            <!-- section of three cards -->
            <div class="search-engine-area mg-t-30">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="search-engine-int">
                                <div class="contact-hd search-hd-eg">
                                    <h2>Cajas Rechazadas</h2>
                                    <p>Total de cajas rechazadas por fincas durante la semana.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Finca</th>
                                                <th class="text-right">Cajas R - Semana</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Álamos</td>
                                                <td class="text-right"><span class="btn-danger">120</span></td>
                                            </tr>
                                            <tr>
                                                <td>Guaimaral</td>
                                                <td class="text-right"><span class="btn-success">0</span></td>
                                            </tr>
                                            <tr>
                                                <td>Taiwán</td>
                                                <td class="text-right"><span class="btn-danger">57</span></td>
                                            </tr>
                                            <tr>
                                                <td>Kalamarí</td>
                                                <td class="text-right"><span class="btn-danger">90</span></td>
                                            </tr>
                                            <tr>
                                                <td>Zarzamora</td>
                                                <td class="text-right"><span class="btn-danger">156</span></td>
                                            </tr>
                                            <tr>
                                                <td class="analysis-rd-mg">Candelaria</td>
                                                <td class="text-right analysis-rd-mg"><span class="btn-success">0</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="search-engine-int sm-res-mg-t-30 tb-res-mg-t-30 tb-res-mg-t-0">
                                <div class="contact-hd search-hd-eg">
                                    <h2>Comparativa de produccion</h2>
                                    <p>Diferencias entre el total de cajas elaboradas de la semana anterior.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Finca</th>
                                                <th class="text-right">Diferencia</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Álamos</td>
                                                <td class="text-right">1220 <i class="notika-icon notika-up-arrow"></i></td>
                                            </tr>
                                            <tr>
                                                <td>Guaimaral</td>
                                                <td class="text-right">132 <i class="notika-icon notika-down-arrow"></i></td>
                                            </tr>
                                            <tr>
                                                <td>Taiwán</td>
                                                <td class="text-right">350 <i class="notika-icon notika-up-arrow"></i></td>
                                            </tr>
                                            <tr>
                                                <td>Kalamarí</td>
                                                <td class="text-right">298 <i class="notika-icon notika-up-arrow"></i></td>
                                            </tr>
                                            <tr>
                                                <td>Zarzamora</td>
                                                <td class="text-right">828 <i class="notika-icon notika-down-arrow"></i></td>
                                            </tr>
                                            <tr>
                                                <td class="analysis-rd-mg">Candelaria</td>
                                                <td class="text-right analysis-rd-mg">212 <i class="notika-icon notika-up-arrow"></i></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="search-engine-int sm-res-mg-t-30 tb-res-mg-t-30 tb-res-ds-n dk-res-ds">
                                <div class="contact-hd search-hd-eg">
                                    <h2>Cajas Producidas</h2>
                                    <p>Total de cajas producidas por finca durante la semana.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Fincas</th>
                                                <th class="text-right">Cajas E - Semana</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Álamos</td>
                                                <td class="text-right">
                                                    <h4><span class="counter">10,563</span></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Guaimaral</td>
                                                <td class="text-right">
                                                    <h4><span class="counter">8,760</span></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Taiwán</td>
                                                <td class="text-right">
                                                    <h4><span class="counter">3,490</span></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Kalamarí</td>
                                                <td class="text-right">
                                                    <h4><span class="counter">9,789</span></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Zarzamora</td>
                                                <td class="text-right">
                                                    <h4><span class="counter">12,756</span></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="analysis-rd-mg">Candelaria</td>
                                                <td class="text-right analysis-rd-mg">
                                                    <h4><span class="counter">3,650</span></h4>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- section of three cards End -->
        <?php endif; ?>

    </div>
    <!-- Container initial End-->

    <!-- Start Footer area-->
    <div class="footer-copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2020. Todos los derechos reservados. <a href="http://bananerasmontesol.com.co">Grupo Montesol</a>.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer area-->

    
    <!-- jquery
		============================================ -->
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.js"><\/script>')</script>
    <script src="../assets/js/vendor/jquery-ui.js"></script>

    <!-- bootstrap JS
		============================================ -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <!-- <script src="../assets/js/wow.min.js"></script> -->

    <!-- owl.carousel JS
		============================================ -->
    <!-- <script src="../assets/js/owl.carousel.min.js"></script> -->
    <!-- scrollUp JS
		============================================ -->
    <script src="../assets/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="../assets/js/meanmenu/jquery.meanmenu.js"></script>
    <!-- counterup JS
		============================================ -->
    <script src="../assets/js/counterup/jquery.counterup.min.js"></script>
    <script src="../assets/js/counterup/waypoints.min.js"></script>
    <script src="../assets/js/counterup/counterup-active.js"></script>
   
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="../assets/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

     <!-- flot JS
		============================================ -->
    <script src="../assets/js/flot/jquery.flot.js"></script>
    <script src="../assets/js/flot/jquery.flot.resize.js"></script>
    <script src="../assets/js/flot/jquery.flot.time.js"></script>
    <script src="../assets/js/flot/jquery.flot.tooltip.min.js"></script>
    <script src="../assets/js/flot/analtic-flot-active.js"></script>
    
    <!-- Data Table JS
		============================================ -->
        <script src="../assets/js/data-table/jquery.dataTables.min.js"></script>

    <!-- plugins JS
		============================================ -->
    <script src="../assets/js/plugins.js"></script>

    <!-- main JS
		============================================ -->
    <script src="../assets/js/main.js"></script>

    <!-- Semantic JS
		============================================ -->
    <script src="../assets/js/semantic/semantic.min.js"></script>

    <!--  wave JS
		============================================ -->
    <script src="../assets/js/wave/waves.min.js"></script>
    <script src="../assets/js/wave/wave-active.js"></script>

    <!--  Dialog JS
		============================================ -->
    <script src="../assets/js/dialog/sweetalert2.min.js"></script>

    <!--  select2 JS
		============================================ -->
    <script src="../assets/js/select2/select2.min.js"></script> 
    
    <!--  Notify JS
		============================================ -->
    <script src="../assets/js/notification/notify.min.js"></script>

    <!--  Handsontable JS
        ============================================ -->
        <script src="../assets/plugins/handsontable/handsontable.full.min.js"></script>
        <script src="../assets/plugins/handsontable/moment/moment.js"></script>
        <script src="../assets/plugins/handsontable/pikaday/pikaday.js"></script>
        <!-- <script src="../assets/plugins/handsontable/hot-formula-parser/formula-parser.js"></script>
        <script src="../assets/plugins/ruleJs.all.full.min.js"></script>
        <script src="../assets/plugins/handsontable/formula.js"></script> -->

    <!-- Controlador de contenido, según menú 
        ============================================ -->
    <script src="../logica/js/contenido.js"></script>
    <script src="../logica/js/fincas.js"></script>
    <script src="../logica/js/empresas.js"></script>
    <script src="../logica/js/cajasproduccion.js"></script>
    <script src="../logica/js/lotes.js"></script>
    <script src="../logica/js/programarembarque.js"></script>
    <script src="../logica/js/ingresarproduccion/ingresarproduccion.js"></script>
    
</body>

</html>
