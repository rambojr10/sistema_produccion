
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
        let hoy = new Date( (`${objectDate.getMonth()+1}/${objectDate.getDate()}/${objectDate.getFullYear()}`) );
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
                console.log(res);
            });
        }

        // carga las card del home admin
        cargarHome(hoy.getWeekNumber());
    });

/* Mostrar datos ================================================================================*/ 
    
    //Llama método en archivo finca.js para listar las fincas
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
            data_cajas();
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

    //
    function cargarHome(semanaActual) {
        fetch('../logica/contenido.php?op=datos_home')
        .then(response => response.json())
        .then(datos => {

            let component = '';

            // cardSemanaRegistrada
            const cardSemanaRegistrada = document.querySelector('#cardSemanaRegistrada')
            datos.cardSemanaRegistrada.forEach(element => {
                let semana = element.N_Semana ? element.N_Semana.split(" ") : null;
                component += `
                    <tr>
                        <td>${element.Nombre}</td>
                        <td class="text-right"><span class="btn-${semanaActual == (semana !== null ? semana[1] : '') ? 'success' : 'danger'}">${(semana !== null ? semana[1] : '')}</span></td>
                    </tr>
                `;
            });
            cardSemanaRegistrada.innerHTML = component += `<tr><td colspan="2"><span class="ui red label">Atrasado</span><span class="ui green label">Al día</span></td></tr>`;

            // cardEstimativo
            const cardEstimativo = document.querySelector('#cardEstimativo');
            component = `
                <thead>
                    <tr>
                        ${datos.cardEstimativo.tableHead}
                    </tr>
                </thead>
                <tbody>
                    <tr class='warning'>
                        ${datos.cardEstimativo.tableBody.premiun}
                    </tr>
                    <tr class='info'>
                        ${datos.cardEstimativo.tableBody.especial}
                    </tr>
                </tbody>
                <tfoot>
                    <tr class='danger'>
                        <th>Código:</th>
                        <th>${datos.cardEstimativo.codEmbarque}</th>
                    </tr>
                </tfoot>
            `;
            cardEstimativo.innerHTML = component;

            // Cards Rechazadas y Elaboradas
            const cardRechazadas = document.querySelector('#cardRechazadas');
            const cardElaboradas = document.querySelector('#cardElaboradas');
            let componentRechazadas = '';
            let componentElaboradas = '';
            datos.cardRechazadasAndElaboradas.forEach(element => {
                componentRechazadas += `
                    <tr>
                        <td>${element.Nombre}</td>
                        <td class="text-center">${element.N_Semana ? element.N_Semana : '-'}</td>
                        <td class="text-right"><span class="btn-${element.Total_CRechazadas > 0 ? 'danger' : 'success'}">${element.Total_CRechazadas ? element.Total_CRechazadas : ''}</span></td>
                    </tr>
                `;
                componentElaboradas += `
                    <tr>
                        <td>${element.Nombre}</td>
                        <td class="text-right">
                            <h4>${element.Total_CElaboradas ? element.Total_CElaboradas : 0}</h4>
                        </td>
                    </tr>
                `;
            });
            cardRechazadas.innerHTML = componentRechazadas;
            cardElaboradas.innerHTML = componentElaboradas;

            // Card Comparativa
            const cardComparativa = document.querySelector('#cardComparativa');
        });
    }
// COMPLEMENTOS --------------------------------------------------------------------------------------------------------
    
    //Valida campos de ingreso de sólo número
    $(document).on("input", ".valida", function () {
        this.value = this.value.replace(/[^0-9]/g,'');
    });

    // Loader
    window.onload = function () {
        $(".osc").fadeOut();
        $("#loader").fadeOut();
    }


   