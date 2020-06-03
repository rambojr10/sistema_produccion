<?php 
    require_once '../datos/statements.php';

    /*$anhos = buscarregistro("tblsemanas", "N_Semana", "SEMANA 52");
    echo "<pre>";
    print_r($anhos);
    echo "</pre>";
    $ultimo_anho = end($anhos);
    echo "<pre>";
    print_r($ultimo_anho);
    echo "</pre>";
    $x = "2019";
    echo "ultimo_anho";
    echo "<br>";
    echo $x . "<br>";
    $verificar_anho = buscarregistro("tblregistrosemanas", "Anho_generado", $x);
    if (isset($verificar_anho[0])) {
        echo "No se creó";
        echo "<pre>";
	    print_r($verificar_anho);
	    echo "</pre>";
    } else {
        $bd = conectar();
        $datos = $bd->prepare("INSERT INTO tblregistrosemanas VALUES(null, :x)");
        $datos->bindParam(":x", $x, PDO::PARAM_INT);
        $datos->execute();
        echo "Todo Ok";
    }*/

    function buscar_ibmfinca_pe(nombre_finca){
        const op = new FormData();
        let codigo = "";
        op.append("op", "buscarfinca");
        op.append("nombre_finca", nombre_finca);
        fetch('../logica/contenido.php', {
            method: "POST",
            body: op
        })
        .then(response => {
            if (response.ok){
                return response.text();
            }else {
                throw "No se ha podido obtener los datos";
            }
        })
        .then(res => {
            codigo = res;
        })
        return codigo;
    }

?>