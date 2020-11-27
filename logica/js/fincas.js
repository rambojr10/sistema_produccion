
// MOSTRAR RAZÓN SOCIAL POR FINCAS ------------------------------------------------------------------------
    
    $(document).on("click", "[href='#ver_empresa']", function() {
        let ibm = $(this).attr("ibm");
        $.post({
            url: '../logica/contenido.php',
            data: {op: 'mostrarempresa', ibm_e: ibm},
            cache: false,
            success: function(res) {
                let empresa = JSON.parse(res);
                $("#nom_empresa").text(empresa.nombre);
                $("#dir_empresa").text(empresa.dir);
                $("#tel_empresa").text(empresa.tel);
                $("#nit_empresa").text(empresa.nit);
            }
        });
    });

// LISTAR FINCAS ------------------------------------------------------------------------------------------
    
    function listar_fincas(withoutEffect = true) {
        $(".contenido").load("../capa_web/fincas.php");
        fetch('../logica/contenido.php?op=listarfincas')
        .then(response => response.text())
        .then(res => {
            const panelFincas = document.querySelector('#listarfincas');
            panelFincas.innerHTML = res;
            if (withoutEffect === true)
                $(".contenido").hide().show("blind", 1500);
        })
    }

    //Agrega el nombre al nuevo lote
    function nuevo_lote(ibmFinca) {
        fetch(`../logica/contenido.php?op=ultimo_lote&ibmFinca=${ibmFinca}`)
        .then(response => response.json())
        .then(res => {
            console.log(res.FKIbm_TblFincas);
            let loteInArray = String(res.Lote).split(' ');
            localStorage.setItem('newLote', ibmFinca);
            $('#newNameLote').html(`Lote ${parseInt(loteInArray[1])+1}`);
        });
    }

// AGREGAR NUEVA FINCA ------------------------------------------------------------------------------------
    
    function guardar_finca() {
        var ibm = $("[name='ibm_finca']").val();
        var nombre = $("[name='nombre_finca']").val();
        var neta = $("[name='neta_finca']").val();
        var bruta = $("[name='bruta_finca']").val();
        var empresa = $("#select_rs").val();
        //Me crea un arreglo con la cantidad de lotes que hay en el modal
        var lotes = new Array($("[valor='num_lote']").length);
        //Recorre cada elemento con el identificador num_lote, para crear los nombres de los lotes; si hay 3 lotes me crea lote1, lote2, lote3
        $("[valor='num_lote']").each(function(){
            for (let x = 1; x <= lotes.length; x++) {
                //verifica si el numero del lote concuerda con el numero del for, y crea el nombre del lote ej: Lote 1
                if(x == $(this).text()){
                    lotes[x] = new Array(3);
                    lotes[x][0] = "Lote " + x;
                    var num = $(this).text();
                    $("[ar='"+ $(this).text()+"']").each(function(){
                        lotes[num][1] = $(this).val();
                    });   
                    $("[ar2='"+ $(this).text()+"']").each(function(){
                        lotes[num][2] = $(this).val();
                    });   
                }                
            }
        });
        //Elimino el primer elemento del array ya que han pasado 84 años y aún no sé por qué da nulo
        lotes.splice(0,1);
        //alert(JSON.stringify(lotes));
        if (ibm != "" && nombre != "" && neta != "" && bruta != "" && empresa != 0 && lotes[0][0] != "" && lotes[0][1] != "") {
            var data = {ibm: ibm, nombre: nombre, neta: neta, bruta: bruta, empresa: empresa, lotes: lotes};
            $.get("../logica/contenido.php", {op: 'nuevafinca', data: data}, function(res){
                if(res == true)
                    swal("Registro", "Registro de datos exitoso", "success");
                else
                    swal("Registro", "Falló al intentar registrar los datos, por favor revise detenidamente", "error");
            });
        }else {
            swal("Datos", "Faltan campos por llenar...", "error");
        } 
    }

    $(document).on("click", "[href='#nuevafinca']", function(e) {
        e.preventDefault();
        guardar_finca();
    });

    //Guarda un nuevo lote
    $(document).on('click', '#btnGuardarNewLote', function() {
        let nameLote = $('#newNameLote').text();
        let areaNeta = $('#newAreaNeta').val();
        let areaBruta = $('#newAreaBruta').val();
        let ibmFinca = localStorage.getItem('newLote');
        const op = new FormData();
        op.append('op', 'guardar_nuevo_lote');
        op.append('nameLote', nameLote);
        op.append('areaNeta', areaNeta);
        op.append('areaBruta', areaBruta);
        op.append('ibmFinca', ibmFinca);
        fetch('../logica/contenido.php', {method: 'POST', body: op})
        .then(response => response.text())
        .then(res => {
            if (res == 1) {
                $('#cancelNewLote').trigger('click');
                swal('Fincas', `${nameLote} guardado correctamente.`, 'success');
                localStorage.removeItem('newLote');
                listar_fincas(false);
            } else {
                swal('Fincas', 'No se ha podido guardar el registro, por favor intente nuevamente.', 'error');
            }
        });
    });

// ELIMINAR FINCA ----------------------------------------------------------------------------------------
    
    $(document).on("click", "[href='#eliminar_finca']", function(){
        let ibm = "";
        $(this).parents("tr").find("td").each(function(){
            ibm = $(this).attr("dato");
            if (ibm === undefined) {
                ibm = "";
            }
            //alert(ibm);
        });
        swal({   
			title: "Está seguro?",   
			text: "¡Se eliminará permanentemente el registro!",   
			type: "warning",   
			showCancelButton: true,   
			confirmButtonText: "Si, eliminar!",
			cancelButtonText: "No, cancelar!",   
		}).then(function(isConfirm){
			if (isConfirm) {  
                $.get("../logica/contenido.php", {op: "eliminar", key: ibm, campo: "tblfincas.PKIbm", tabla: "tblfincas"}, function(res){
                    if (res == true) {
                        swal("Eliminación", "Registro eliminado satisfactoriamente.", "success");
                        $("#listarfincas").html("");
                        $.get("../logica/contenido.php", {op: "listarfincas"}, function(res){
                            $("#listarfincas").html(res);       
                        });
                    }else {
                        swal("Eliminación", "No se pudo eliminar el registro.", "error");
                    }
                });
            }
        });
    });

// COMPLEMENTOS ------------------------------------------------------------------------------------------

    //solicita en la capa lógica, los datos necesarios para cargar en el option del modal nueva finca 
    function cargar_razonsocial(){
        $("#select_rs").html("");
        $.get("../logica/contenido.php", {op: "select_rs"}, function(res){
            $("#select_rs").html(res);
        });
    }

    //limpia los campos del formulario de registro de fincas
    $(document).on("click", "[href='#frmfinca']", function(e){
        e.preventDefault();
        $("[name='ibm_finca']").val("");
        $("[name='nombre_finca']").val("");
        $("[name='neta_finca']").val("");
        $("[name='bruta_finca']").val("");
        cargar_razonsocial();
    });

    //agrega un nuevo formulario para digitar otro lote en el modal de nueva finca
    $(document).on("click", "[href='#nuevo_lote']", function(e) {
        e.preventDefault();
        //obtiene la cantidad de formularios de nuevo_lote agregados, para enviar ese dato a el archivo que retorna el método append
        let num = $("[valor='num_lote']").length;        
        $.get("../capa_web/formularios/form_lotes.php", {num: num}, function(res){
            $("#agg_lotes").append(res);
            $("#"+num).each(function(){
                $(this).hide().show(700);
            });
        });
    });

    //elimina un formulario para digitar otro lote en el modal de nueva finca
    $(document).on("click", "[href='#quitar_lote']", function(e) {
        e.preventDefault();
        let num = $("[valor='num_lote']").length;
        $("#"+num).each(function(){
            $(this).fadeOut(500, function(){
                $(this).remove();
            });
        });
    });