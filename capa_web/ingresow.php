<!doctype html>
<html class="no-js" lang="">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sistema Producción - Grupo MONTESOL</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/logo/icono.png">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/semantic/semantic.min.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/normalize.css">
    <!-- Notika icon CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/notika-custom-icon.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="../style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="../assets/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="../assets/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
  <form action="../logica/ingreso.php" method="POST">
    <div class="login-content">
      <!-- Login -->
      <div class="nk-block toggled" id="l-login">
        <div class="nk-form">
          <div>
            <!-- <center><a href="#"><img src="../assets/img/logo/logo2.png" alt="" /></a></center> -->
            <div class="ui teal huge label">
                Producción
            </div>
            <hr>
          </div>
          <div class="input-group">
            <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-support"></i></span>
            <div class="nk-int-st">
                <input type="text" class="form-control" placeholder="Usuario" name="usuario">
            </div>
          </div>
          <div class="input-group mg-t-15">
            <span class="input-group-addon nk-ic-st-pro"><i class="notika-icon notika-edit"></i></span>
            <div class="nk-int-st">
              <input type="password" class="form-control" placeholder="Contraseña" name="password">
            </div>
          </div>
          <!-- <a href="#ingresar" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow right-arrrow-ant"></i></a> -->
          <button type="submit" name="op" value="ingreso" class="btn btn-login btn-success btn-float"><i class="notika-icon notika-right-arrow right-arrow-ant"></i></button>
          <div>
            <br>
            <center><img src="../assets/img/log.jpg" /></center>
          </div>
        </div>
      </div>
    </div>
  </form>

    <!-- jquery
		============================================ -->
    <script src="../assets/js/vendor/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="../assets/js/plugins.js"></script>
</body>

</html>