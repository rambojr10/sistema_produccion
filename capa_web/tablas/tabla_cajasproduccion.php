<?php 
    require_once '../../datos/statements.php';

    if (isset($_GET['op']) && $_GET['op'] == 'cajasproduccion') {
        $cajas = cajasproduccion();
        foreach ($cajas as $c) {
            echo "<tr>
                    <td>"
                        . $c->PKCodigo . 
                    "</td>
                    <td>"
                        . $c->Descripcion . 
                    "</td>
                    <td>"
                        . $c->FactorConversion .
                    "</td>
                    <td>"
                        . $c->TipoFruta .
                    "<td>
                        <a href='#editar_caja' codigo='$c->PKCodigo' class='notika-icon notika-edit' title='Editar' data-toggle='modal' data-target='#modal-ec'></a> - 
                        <a href='#ver_elaboracion' codigo='$c->PKCodigo' class='notika-icon notika-menus' title='Ver Elaboración' data-toggle='modal' data-target='#modal-ve'></a> - 
                        <a href='#eliminar_caja' class='notika-icon notika-trash' title='Eliminar' onclick=eliminarcaja($c->PKCodigo)></a>
                    </td>
                </tr>";
        }
    }
?>
<script type="text/javascript">
    $("#tblcajasproduccion").DataTable({
        language: {
            "processing":       "Procesando...",
            "search":           "Buscar:",
            "lengthMenu":       "Ver _MENU_ elementos",
            "info":             "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty":        "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered":     "(filtrados de _MAX_ elementos en total)",
            "infoPostFix":      "",
            "loadingRecords":   "Cargando...",
            "zeroRecords":      "No se encontraron resultados",
            "emptyTable":       "Ningún dato disponible en esta tabla",
            "paginate": {
                "first":      "Primero",
                "previous":   "Último",
                "next":       "Siguente",
                "last":       "Anterior"
            },
            "aria": {
                "sortAscending":  ": Activar para ordenar la columna de manera ascendente",
                "sortDescending": ": Activar para ordenar la columna de manera descendente"
            }
        }
    });
</script>