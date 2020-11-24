
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
                console.log(res);
            });
        }

        // carga las card del home admin
        if ($('#lblusuario').html() == 'ADMINISTRADOR')
            cargarHome(hoy.getWeekNumber());
        else
            cargarHomeUser(hoy);
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
            component = '';
            datos.cardComparativa.forEach(element => {
                if (element.length == 1) {
                    component += `
                        <tr>
                            <td>${element[0].Nombre}</td>
                            <td class="text-center">${element[0].N_Semana.split(' ')[1]}</td>
                            <td class="text-right">${element[0].Total_CElaboradas}<i class="notika-icon notika-right-arrow"></i></td>
                        </tr>
                    `;
                } else if (element.length == 2) {
                    let valor = parseInt(element[0].Total_CElaboradas) - parseInt(element[1].Total_CElaboradas);
                    let semanas = element[0].N_Semana.split(' '); 
                    semanas += element[1].N_Semana.split(' ');
                    component += `
                        <tr>
                            <td>${element[0].Nombre}</td>
                            <td class="text-center">${element[0].N_Semana.split(' ')[1]} - ${element[1].N_Semana.split(' ')[1]}</td>
                            <td class="text-right">${valor}<i class="notika-icon notika-${valor < 0 ? 'down' : 'up'}-arrow"></i></td>
                        </tr>
                    `;
                } else {
                    component += `
                        <tr>
                            <td>-</td>
                            <td class="text-center">-</td>
                            <td class="text-right">-</td>
                        </tr>
                    `;
                }
            });
            cardComparativa.innerHTML = component;
        });
    }

    //
    function cargarHomeUser(fechaActual) {
        const fecha = (objectDate) => {
            let hoy = `${objectDate.getFullYear()}-${objectDate.getMonth()+1}-${objectDate.getDate()}`;
            return hoy;
        }
        fetch(`../logica/contenido.php?op=datos_home_user&fecha_actual=${fecha(fechaActual)}`)
        .then(response => response.json())
        .then(datos => {

            //rowOne
            const lblTotalElaborado = document.getElementById('lblTotalElaborado');
            lblTotalElaborado.textContent = datos.rowOne.historico.totalElaborado;
            const lblTotalRechazadas = document.getElementById('lblTotalRechazadas');
            lblTotalRechazadas.textContent = datos.rowOne.historico.totalRechazadas;
            const lblTotalSemana = document.getElementById('lblTotalSemana');
            lblTotalSemana.textContent = datos.ultimaProduccion.Total_CElaboradas;

            //rowTwo
            function Porcentaje(...dynamicValues) {
                this.value = (dynamicValues[0]/dynamicValues[1])*100;
                return `${this.value.toFixed(2)}%`
            }
            const porcentaje = Porcentaje(datos.rowTwo.ultimaProgramacion.totalElaborado, datos.rowTwo.ultimaProgramacion.totalProgramado);
            const progressBar = document.getElementById('porcentajeElaborado');
            progressBar.setAttribute('data-progress', porcentaje);
            progressBar.setAttribute('style', `width: ${porcentaje}`);
            progressBar.children[0].textContent = porcentaje;

            //rowThree
            chartHomeUser(jQuery, datos.rowThree);

            function Rendimientos(semana, values, elements) {
                semana.textContent = values.N_Semana
                elements.forEach(element => {
                    let tag = document.querySelector(`#td-${element}`);
                    let simbolo = element == 'Area_Recorrida' ? '' : element == 'Cod_Embarque' ? '' : '%';
                    tag.textContent = values[element] !== null ? `${values[element]}${simbolo}` : 0;
                });
            }
            const lblUltimaSemanaRegistrada = document.querySelector('#ultimaSemanaRegistrada');
            Rendimientos(
                lblUltimaSemanaRegistrada, 
                datos.ultimaProduccion, 
                ['Ratio', 'Merma', 'Peso_Racimos', 'Area_Recorrida', 'Peso_Vastago', 'Cod_Embarque']
            );
            

            //rowFour
            const infoFincaContainer = document.querySelector('#infoFincaContainer');
            infoFincaContainer.children[0].textContent = datos.ultimaProduccion.PKIbm;
            infoFincaContainer.children[1].textContent = datos.ultimaProduccion.Nombre;
            infoFincaContainer.children[2].children[0].textContent = datos.ultimaProduccion.Area_Neta;
            infoFincaContainer.children[3].children[0].textContent = datos.ultimaProduccion.Area_Bruta;

            const objectSemanaActual = {
                infoSemanaSemana: document.getElementById('info-semana-semana'),
                inforSemanaInicio: document.getElementById('info-semana-inicio'),
                infoSemanaFin: document.getElementById('info-semana-fin'),
                cintasRenderer: document.querySelectorAll('.btn-block')
            };
            (function (selectores, datos) {
                let claseReturn = (element) => {
                    switch (element) {
                        case '1':
                            return 'embolseCoffee';
                        case '2':
                            return 'embolseBlack';
                        case '3':
                            return 'embolseOrange';
                        case '4':
                            return 'embolseGreen';
                        case '5':
                            return 'embolseYellow';
                        case '6':
                            return 'embolseWhite';
                        case '7':
                            return 'embolseBlue';
                        case '8':
                            return 'embolseGray';
                        case '9':
                            return 'embolsePurple';
                        case '10':
                            return 'embolseRed';
                        default:
                            break;
                    }
                }
                datos.cintas.forEach((elementOne, index) => {
                    selectores.cintasRenderer[index].className += ` ${claseReturn(elementOne.PKId)}`;
                });
                
            })(objectSemanaActual, datos.rowFour.ultimaSemanaInfo);

            function TablaAlineacion(datosTabla) {
                let value = '';
                datosTabla.forEach(element => {
                    let label = (tipoFruta) => {
                        switch (tipoFruta) {
                            case '1':
                                return 'yellow';
                            case '2':
                                return 'green';
                            case '3':
                                return 'gray';
                            case '4':
                                return 'gray';
                            case '5':
                                return 'gray';
                            case '6':
                                return 'blue';
                            default:
                                break;
                        }
                    } 
                    value += `
                        <tr>
                            <td><span class="ui ${label(element.tipoFruta)} label">${element.Codigo}</span></td>
                            <td>${element.Caja}</td>
                            <td class="text-right">${element.Cantidad}</td>
                        </tr>
                    `
                })
                return value;
            }
            const tblAlineacionHomeUser = document.querySelector('#tblAlineacionHomeUser');
            const lblInfoAlineacion = document.querySelector('#lblInfoAlineacion');
            lblInfoAlineacion.innerHTML = `Semana: ${datos.ultimaProduccion.N_Semana} <br> Código: ${datos.ultimaProduccion.Cod_Embarque}`;
            tblAlineacionHomeUser.innerHTML = TablaAlineacion(datos.rowFour.ultimaAlineacion);
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


   