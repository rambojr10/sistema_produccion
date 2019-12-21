<?php
    //obtiene la cantidad de lotes que hay hasta el momento y aumenta uno para asignar al nombre
    if (isset($_GET["num"])) {
        $num = $_GET["num"] + 1;
    }else{
        $num = 1;
    }
    echo "
        <div class='panel-body' id='".$num."'>
            <div class='form-group'>
                <div>
                    <h2 style='color:#0ebf3c'>Lote <span class='badge' valor='num_lote'>".$num."</span></h2>
                </div>
                <div class='row'>
                    <div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>
                        <div class='nk-int-st'>
                            <input type='text' ar='".$num."' id='area_neta' class='form-control' placeholder='Área_Neta'>
                        </div>
                    </div>
                    <div class='col-lg-6 col-md-6 col-sm-12 col-xs-12'>
                        <div class='nk-int-st'>
                            <input type='text' ar2='".$num."' name='area_bruta' class='form-control' placeholder='Área_Bruta'>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    ";
?>

<!-- <div class="panel-body">
    <div class="form-group">
        <div>
            <h2 style="color:#0ebf3c">Lote <span class="badge" id="num_lote">1</span></h2>
        </div>
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="nk-int-st">
                    <input type="number" class="form-control" placeholder="Área_Neta">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                <div class="nk-int-st">
                    <input type="number" class="form-control" placeholder="Área_Bruta">
                </div>
            </div>
        </div>
    </div>
</div> -->