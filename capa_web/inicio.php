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

                        <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 1) : ?> 
                        <li>
                            <a data-toggle="tab" href="#usuarios"><i class="notika-icon notika-social"></i> Usuarios</a>
                        </li>
                        <?php endif; ?>
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

                    <!-- Flot -->
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="visitor-sv-tm-int">
                                <div class="contact-hd mg-bt-ant-inner">
                                    <h2>Producción</h2>
                                    <p>Total produccion por fincas, histórico.</p>
                                </div>
                                <div class="visit-server-time">
                                    <div id="chart-produccion-fincas" class="flot-chart"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row mg-t-30">

                        <!-- Card Semana Registrada -->
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="visitor-sv-tm-int sm-res-mg-t-30">
                                <div class="contact-hd mg-bt-ant-inner server-sts-rgt">
                                    <h2>Semana registrada</h2>
                                    <p>Última semana registrada por cada finca.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Finca</th>
                                                <th class="text-right">#Semana</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cardSemanaRegistrada">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Card Estimativo -->
                        <div class="col-lg-8 col-md-6 col-sm-6 col-xs-12">
                            <div class="visitor-sv-tm-int sm-res-mg-t-30 tb-res-mg-t-30" style="height: 420px; overflow: auto;">
                                <div class="contact-hd mg-bt-ant-inner">
                                    <h2>Estimativo</h2>
                                    <p>Muestra el último estimativo creado para cada finca.</p>
                                </div>
                                <div class="visitor-st-ch visitor-ov-ct">
                                    <table class="table table-condensed" id="cardEstimativo">
                                        
                                    </table>
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

                        <!-- Card Rechazadas -->
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
                                                <th class="text-center">Semana</th>
                                                <th class="text-right">Cantidad</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cardRechazadas">
                                                    
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Card Comparativa -->
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
                                                <th class="text-center">Semanas</th>
                                                <th class="text-right">Diferencia</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cardComparativa">
                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- Card Elaboradas -->
                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="search-engine-int sm-res-mg-t-30 tb-res-mg-t-30">
                                <div class="contact-hd search-hd-eg">
                                    <h2>Cajas Producidas</h2>
                                    <p>Total de cajas producidas por finca durante la semana.</p>
                                </div>
                                <div class="search-eg-table">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Fincas</th>
                                                <th class="text-right">Cajas Elaboradas</th>
                                            </tr>
                                        </thead>
                                        <tbody id="cardElaboradas">
                                            
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

        <?php if ($_SESSION['conectado']->FKId_TblTipoUsuario == 2) :?>
             <!-- Start Status area -->
            <div class="notika-status-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                                <div class="website-traffic-ctn">
                                    <h2 id="lblTotalElaborado">0</h2>
                                    <p>Total elaborado, histórico.</p>
                                </div>
                                <div class="sparkline-bar-stats1">12,11,10,9,8,7,6,5,4,3,2,1</div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30">
                                <div class="website-traffic-ctn">
                                    <h2 id="lblTotalRechazadas">0</h2>
                                    <p>Total rechazadas, histórico.</p>
                                </div>
                                <div class="sparkline-bar-stats2">1,2,3,4,5,6,6,5,4,3,2,1</div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
                            <div class="wb-traffic-inner notika-shadow sm-res-mg-t-30 tb-res-mg-t-30 dk-res-mg-t-30">
                                <div class="website-traffic-ctn">
                                    <h2 id="lblTotalSemana">0</h2>
                                    <p>Total última semana.</p>
                                </div>
                                <div class="sparkline-bar-stats3">1,2,3,4,5,6,7,8,9,10,11,12</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Status area-->

            <!-- Start % area -->
            <div class="notika-email-post-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-t-30">
                            <div class="ongoing-task-inner notika-shadow">
                                <div class="realtime-ctn">
                                    <div class="realtime-title ongoing-hd-wd">
                                        <h2>Alineación</h2>
                                        <p>Porcentaje de elaboración de la última alineación</p>
                                    </div>
                                </div>
                                <div class="skill-content-3 ongoing-tsk">
                                    <div class="skill">
                                        <div class="progress">
                                            <div class="lead-content">
                                                <p>HTML5 Validation Report</p>
                                            </div>
                                            <div class="progress-bar wow fadeInLeft" data-progress="95%" style="width: 95%;" data-wow-duration="1.5s" data-wow-delay="1.2s"> <span>95%</span>
                                            </div>
                                        </div>
                                        <div class="progress">
                                            <div class="lead-content">
                                                <p>Google Chrome Extension</p>
                                            </div>
                                            <div class="progress-bar" data-progress="85%" style="width: 85%;"><span>85%</span> </div>
                                        </div>
                                        <!-- <div class="progress">
                                            <div class="lead-content">
                                                <p>Social Internet Projects</p>
                                            </div>
                                            <div class="progress-bar wow fadeInLeft" data-progress="70%" style="width: 70%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>70%</span> </div>
                                        </div>
                                        <div class="progress">
                                            <div class="lead-content">
                                                <p>Bootstrap Admin</p>
                                            </div>
                                            <div class="progress-bar wow fadeInLeft" data-progress="60%" style="width: 60%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>60%</span> </div>
                                        </div>
                                        <div class="progress progress-bt">
                                            <div class="lead-content">
                                                <p>Youtube App</p>
                                            </div>
                                            <div class="progress-bar wow fadeInLeft" data-progress="50%" style="width: 50%;" data-wow-duration="1.5s" data-wow-delay="1.2s"><span>50%</span> </div>
                                        </div> -->
                                    </div>
                                    <!-- <div class="view-all-onging">
                                        <a href="#">View All Tasks</a>
                                    </div> -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End % area -->

            <!-- Start Sale Statistic area-->
            <div class="sale-statistic-area">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-9 col-md-8 col-sm-7 col-xs-12">
                            <div class="sale-statistic-inner notika-shadow mg-t-30">
                                <div class="curved-inner-pro">
                                    <div class="curved-ctn">
                                        <h2>Producción</h2>
                                        <p>Muestra la elaboración en la última semana registrada.</p>
                                    </div>
                                </div>
                                <div id="bar-chart" class="flot-chart bar-three bar-hm-three"></div>
                                <div class="flc-bar"></div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 col-sm-5 col-xs-12">
                            <div class="statistic-right-area notika-shadow mg-tb-30 sm-res-mg-t-0">
                                <div class="past-day-statis">
                                    <h2>Balance de masas</h2>
                                    <p>Datos de última semana registrada: <span class="text-muted">SEMANA 10</span></p>
                                </div>
                                <div>
                                    <table class="table table-light">
                                        <thead>
                                            <tr>
                                                <th>Concepto</th>
                                                <th class="text-right">Valor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Ratio</td>
                                                <td class="text-right">18.7</td>
                                            </tr>
                                            <tr>
                                                <td>Merma</td>
                                                <td class="text-right"></td>
                                            </tr>
                                            <tr>
                                                <td>Peso racimos</td>
                                                <td class="text-right"></td>
                                            </tr>
                                            <tr>
                                                <td>Area recorrida</td>
                                                <td class="text-right"></td>
                                            </tr>
                                            <tr>
                                                <td>Peso vastago</td>
                                                <td class="text-right"></td>
                                            </tr>
                                        </tbody>
                                        <tfoot style="height: 75px;">
                                            <tr>
                                                <th>Código</th>
                                                <th class="text-right">EMB-202051</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Sale Statistic area-->

            <!-- Start Email Statistic area-->
            <div class="notika-email-post-area">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="email-statis-inner notika-shadow">
                                <div class="email-ctn-round">
                                    <div class="email-rdn-hd">
                                        <h2>Elaboración semanal</h2>
                                    </div>
                                    <div class="email-statis-wrap">
                                        <div class="email-round-nock">
                                            <input type="text" class="knob" value="0" data-rel="100" data-linecap="round" data-width="130" data-bgcolor="#E4E4E4" data-fgcolor="#00c292" data-thickness=".10" data-readonly="true">
                                        </div>
                                        <div class="email-ctn-nock">
                                            <p>Total elaborado, semana actual.</p>
                                        </div>
                                    </div>
                                    <div class="email-round-gp">
                                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Sint aspernatur pariatur voluptates officiis praesentium, voluptatibus quaerat eaque odio maiores quis numquam cumque nihil assumenda amet quo officia sit minima animi.</p>
                                        <!-- <div class="email-round-pro">
                                            <div class="email-signle-gp">
                                                <input type="text" class="knob" value="0" data-rel="75" data-linecap="round" data-width="90" data-bgcolor="#E4E4E4" data-fgcolor="#00c292" data-thickness=".10" data-readonly="true" disabled>
                                            </div>
                                            <div class="email-ctn-nock">
                                                <p>Bounce Rate</p>
                                            </div>
                                        </div>
                                        <div class="email-round-pro">
                                            <div class="email-signle-gp">
                                                <input type="text" class="knob" value="0" data-rel="35" data-linecap="round" data-width="90" data-bgcolor="#E4E4E4" data-fgcolor="#00c292" data-thickness=".10" data-readonly="true" disabled>
                                            </div>
                                            <div class="email-ctn-nock">
                                                <p>Total Opened</p>
                                            </div>
                                        </div>
                                        <div class="email-round-pro sm-res-ds-n lg-res-mg-bl">
                                            <div class="email-signle-gp">
                                                <input type="text" class="knob" value="0" data-rel="45" data-linecap="round" data-width="90" data-bgcolor="#E4E4E4" data-fgcolor="#00c292" data-thickness=".10" data-readonly="true" disabled>
                                            </div>
                                            <div class="email-ctn-nock">
                                                <p>Total Ignored</p>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="recent-post-wrapper notika-shadow sm-res-mg-t-30 tb-res-ds-n dk-res-ds">
                                <div class="recent-post-ctn">
                                    <div class="recent-post-title">
                                        <h2>Alineación</h2>
                                    </div>
                                </div>
                                <div class="recent-post-items">
                                    <div class="recent-post-signle rct-pt-mg-wp">
                                        <a href="#">
                                            <div class="recent-post-flex">
                                                <div class="recent-post-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="recent-post-it-ctn">
                                                    <h2>Smith</h2>
                                                    <p>Nunc quis diam diamurabitur at dolor elementum, dictum turpis vel</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="recent-post-signle">
                                        <a href="#">
                                            <div class="recent-post-flex rct-pt-mg">
                                                <div class="recent-post-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="recent-post-it-ctn">
                                                    <h2>John Deo</h2>
                                                    <p>Nunc quis diam diamurabitur at dolor elementum, dictum turpis vel</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="recent-post-signle">
                                        <a href="#">
                                            <div class="recent-post-flex rct-pt-mg">
                                                <div class="recent-post-img">
                                                    <img src="img/post/4.jpg" alt="" />
                                                </div>
                                                <div class="recent-post-it-ctn">
                                                    <h2>Malika</h2>
                                                    <p>Nunc quis diam diamurabitur at dolor elementum, dictum turpis vel</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="recent-post-signle">
                                        <a href="#">
                                            <div class="recent-post-flex rct-pt-mg">
                                                <div class="recent-post-img">
                                                    <img src="img/post/2.jpg" alt="" />
                                                </div>
                                                <div class="recent-post-it-ctn">
                                                    <h2>Smith</h2>
                                                    <p>Nunc quis diam diamurabitur at dolor elementum, dictum turpis vel</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="recent-post-signle">
                                        <a href="#">
                                            <div class="recent-post-flex rct-pt-mg">
                                                <div class="recent-post-img">
                                                    <img src="img/post/1.jpg" alt="" />
                                                </div>
                                                <div class="recent-post-it-ctn">
                                                    <h2>John Deo</h2>
                                                    <p>Nunc quis diam diamurabitur at dolor elementum, dictum turpis vel</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="recent-post-signle">
                                        <a href="#">
                                            <div class="recent-post-flex rc-ps-vw">
                                                <div class="recent-post-line rct-pt-mg">
                                                    <p>View All</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-6 col-xs-12">
                            <div class="recent-items-wp notika-shadow sm-res-mg-t-30">
                                <div class="rc-it-ltd">
                                    <div class="recent-items-ctn">
                                        <div class="recent-items-title">
                                            <h2>Recent Items</h2>
                                        </div>
                                    </div>
                                    <div class="recent-items-inn">
                                        <table class="table table-inner table-vmiddle">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th style="width: 60px">Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="f-500 c-cyan">4555</td>
                                                    <td>Samsung Galaxy Mega</td>
                                                    <td class="f-500 c-cyan">$921</td>
                                                </tr>
                                                <tr>
                                                    <td class="f-500 c-cyan">4556</td>
                                                    <td>Huawei Ascend P6</td>
                                                    <td class="f-500 c-cyan">$240</td>
                                                </tr>
                                                <tr>
                                                    <td class="f-500 c-cyan">8778</td>
                                                    <td>HTC One M8</td>
                                                    <td class="f-500 c-cyan">$400</td>
                                                </tr>
                                                <tr>
                                                    <td class="f-500 c-cyan">5667</td>
                                                    <td>Samsung Galaxy Alpha</td>
                                                    <td class="f-500 c-cyan">$870</td>
                                                </tr>
                                                <tr>
                                                    <td class="f-500 c-cyan">7886</td>
                                                    <td>LG G3</td>
                                                    <td class="f-500 c-cyan">$790</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="recent-items-chart" class="flot-chart-items flot-chart vt-ct-it tb-rc-it-res"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Email Statistic area-->

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

    <!-- owl.carousel JS
		============================================ -->
    <!-- <script src="../assets/js/owl.carousel.min.js"></script> -->

    <!-- scrollUp JS
		============================================ -->
    <script src="../assets/js/jquery.scrollUp.min.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="../assets/js/meanmenu/jquery.meanmenu.js"></script>
   
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="../assets/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>

     <!-- flot JS
		============================================ -->
    <script src="../assets/js/flot/jquery.flot.js"></script>
    <script src="../assets/js/flot/jquery.flot.tooltip.min.js"></script>
    <script src="../assets/js/flot/analtic-flot-active.js"></script>
    <script src="../assets/js/flot/jquery.flot.orderBars.js"></script>
    <script src="../assets/js/flot/flot-active.js"></script>
    <!-- <script src="../assets/js/flot/jquery.flot.resize.js"></script> -->
    <!-- <script src="../assets/js/flot/jquery.flot.pie.js"></script> -->
    <!-- <script src="../assets/js/flot/jquery.flot.time.js"></script> -->
    <!-- <script src="../assets/js/flot/curvedLines.js"></script> -->
    
    <!-- knob JS
		============================================ -->
        <script src="../assets/js/knob/jquery.knob.js"></script>
        <script src="../assets/js/knob/jquery.appear.js"></script>
        <script src="../assets/js/knob/knob-active.js"></script>

    <!-- sparkline JS
		============================================ -->
        <script src="../assets/js/sparkline/jquery.sparkline.min.js"></script>
        <script src="../assets/js/sparkline/sparkline-active.js"></script>
    
    <!-- wow JS
		============================================ -->
        <script src="../assets/js/wow.min.js"></script>

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

    <!-- Controlador de contenido, según menú 
        ============================================ -->
    <script src="../logica/js/contenido.js"></script>
    <script src="../logica/js/fincas.js"></script>
    <script src="../logica/js/empresas.js"></script>
    <script src="../logica/js/cajasproduccion.js"></script>
    <script src="../logica/js/lotes.js"></script>
    <script src="../logica/js/programarembarque.js"></script>
    <script src="../logica/js/ingresarproduccion/ingresarproduccion.js"></script>
    <script src="../logica/js/usuarios.js"></script>
    
</body>

</html>
