
    //Asigna fecha y semana al inicio
    $(document).ready(function() {
        Date.prototype.getWeekNumber = function () {
            var d = new Date(+this);  //Creamos un nuevo Date con la fecha de "this".
            d.setHours(0, 0, 0, 0);   //Nos aseguramos de limpiar la hora.
            d.setDate(d.getDate() + 4 - (d.getDay() || 7)); // Recorremos los días para asegurarnos de estar "dentro de la semana"
            //Finalmente, calculamos redondeando y ajustando por la naturaleza de los números en JS:
            return Math.ceil((((d - new Date(d.getFullYear(), 0, 1)) / 8.64e7) + 1) / 7);
        };
        const objectDate = new Date();
        const hoy = new Date( (`${objectDate.getMonth()+1}/${objectDate.getDate()}/${objectDate.getFullYear()}`) );
        $("#lblsemana").text(hoy.getWeekNumber());
        $("#lblfecha").text(`${hoy.getDate()}/${hoy.getMonth()+1}/${hoy.getFullYear()}`);
        if (hoy.getWeekNumber() == '52') {
            const op = new FormData();
            op.append("op", "anhonuevo");
            op.append("anhonuevo", hoy.getFullYear());
            fetch('../logica/contenido.php', {
                method: 'POST',
                body: op
            })
            .then(response => {
                if (response.ok)
                    return response.text();
                else
                    throw "No se pueden cargar los datos";
            })
            .then(res => {
                if (res == 'Ok')
                    swal('Generador de semanas', `Las semanas se han generado correctamente, el nuevo año ${hoy.getFullYear()+1} ahora está disponible en la plataforma.`, 'success');
            });
        }

        // carga las card del home admin
        if ($('#lblusuario').html() == 'ADMINISTRADOR')
            cargarHome(hoy.getWeekNumber());
        else
            cargarHomeUser(hoy);
    });

/* Mostrar datos ================================================================================*/ 
    
    // Llama método en archivo finca.js para listar las fincas
    $(document).on("click", "[href='#listarfincas']", function(e){
        e.preventDefault();
        listar_fincas();
    });

    //Cargar vista producción
    $(document).on("click", "[href='#ingresarproduccion']", function(e){
        e.preventDefault();
        $(".contenido").load("../capa_web/ingresarproduccion.php");
        $(".contenido").hide().show("blind", 1500);
    });

    //Cargar módulo programar embarque
    $(document).on("click", "[href='#programarembarque']", function(e){
        e.preventDefault();
        $(".contenido").load("../capa_web/programarembarque.php");
    });
    
    //Mostrar empresas
    $(document).on("click", "[href='#listarempresas']", function(e){
        e.preventDefault();
        $(".contenido").load("../capa_web/empresas.php");
        //pertenece a empresas.js
        listarempresas();
    });

    //Carga vista cajas producción
    $(document).on("click", "[href='#cajasproduccion']", function(e){
        e.preventDefault();
        $(".contenido").load("../capa_web/cajasproduccion.php");
        const op = new FormData();
        op.append('op', 'cajasproduccion');
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok)
                return response.text()
            else
                throw "No se han cargado los datos..."
        })
        .then(res => {
            $("#cajasproduccion").html(res);
            data_cajas('tblcajasproduccion');
        });
    });

    // Carga vista usuarios
    $(document).on('click', "[href='#listarusuarios']", function(e) {
        e.preventDefault();
        $('.contenido').load('../capa_web/usuarios.php');
        fetch('../logica/contenido.php?op=listar_usuarios')
        .then(response => response.text())
        .then(res => {
            $('#containerUsuarios').html(res);
        });
        $(".contenido").hide().show("blind", 1500);
    });
  
    //Cargar módulo reportes
    $(document).on("click", "[href='#verreporte']", function(e){
        e.preventDefault();
        $(".contenido").load("../capa_web/reportes.php");
    });

// COMPLEMENTOS --------------------------------------------------------------------------------------------------------
    
    //Valida campos de ingreso de sólo número
    $(document).on("input", ".valida", function () {
        this.value = this.value.replace(/[^0-9]/g,'');
    });



   