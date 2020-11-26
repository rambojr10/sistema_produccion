
// VIEW HOME ---------------------------------------------------------------------------------------------------------------------------------
    
    //
    function cargarHome(semanaActual) {
        fetch('../logica/contenido.php?op=datos_home')
        .then(response => {
            if (response.ok)
                response.json();
            else
                throw "No es posible obtener los datos HOME";
        })
        .then(datos => {
            if (typeof datos === 'object') {
                //Loader
                $(".osc").fadeOut();
                $("#loader").fadeOut();
                
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
                            <td class="text-right"><span class="btn-${element.Total_CREchazadas > 0 ? 'danger' : 'success'}">${element.Total_CREchazadas ? element.Total_CREchazadas : ''}</span></td>
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
            } else {
                swal('Dashboard', 'No se ha podido cargar correctamente, es posible que no existan datos para tratar', 'error');
                //Loader
                $(".osc").fadeOut();
                $("#loader").fadeOut();
            }
        });
    }

    //
    function cargarHomeUser(fechaActual) {
        function fecha(objectDate) {
            let hoy = `${objectDate.getFullYear()}-${objectDate.getMonth() + 1}-${objectDate.getDate()}`;
            return hoy;
        }
        fetch(`../logica/contenido.php?op=datos_home_user&fecha_actual=${fecha(fechaActual)}`)
        .then(response => {
            if (response.ok) 
                response.json();
            else
                throw "No es posible obtener los datos HOME";
        })
        .then(datos => {
            if (typeof datos === 'object') {
                //Loader
                $('.osc').fadeOut();
                $('#loader').fadeOut();
            
                //rowOne
                const lblTotalElaborado = document.getElementById('lblTotalElaborado');
                lblTotalElaborado.textContent = datos.rowOne.historico.totalElaborado;
                const lblTotalRechazadas = document.getElementById('lblTotalRechazadas');
                lblTotalRechazadas.textContent = datos.rowOne.historico.totalRechazadas;
                const lblTotalSemana = document.getElementById('lblTotalSemana');
                lblTotalSemana.textContent = datos.ultimaProduccion.Total_CElaboradas;

                //rowTwo
                function Porcentaje(...dynamicValues) {
                    this.value = (dynamicValues[0] / dynamicValues[1]) * 100;
                    return `${this.value.toFixed(2)}%`;
                }
                const porcentaje = Porcentaje(datos.rowTwo.ultimaProgramacion.totalElaborado, datos.rowTwo.ultimaProgramacion.totalProgramado);
                const progressBar = document.getElementById('porcentajeElaborado');
                progressBar.setAttribute('data-progress', porcentaje);
                progressBar.setAttribute('style', `width: ${porcentaje}`);
                progressBar.children[0].textContent = porcentaje;

                //rowThree
                chartHomeUser(jQuery, datos.rowThree);

                function Rendimientos(semana, values, elements) {
                    semana.textContent = values.N_Semana;
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
                    };
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
                        };
                        value += `
                            <tr>
                                <td><span class="ui ${label(element.tipoFruta)} label">${element.Codigo}</span></td>
                                <td>${element.Caja}</td>
                                <td class="text-right">${element.Cantidad}</td>
                            </tr>
                        `;
                    });
                    return value;
                }
                const tblAlineacionHomeUser = document.querySelector('#tblAlineacionHomeUser');
                const lblInfoAlineacion = document.querySelector('#lblInfoAlineacion');
                lblInfoAlineacion.innerHTML = `Semana: ${datos.rowFour.ultimaSemanaInfo.semana.N_Semana} <br> Código: EMB-${datos.rowFour.ultimaSemanaInfo.semana.Anho}${datos.rowFour.ultimaSemanaInfo.semana.PKId}`;
                tblAlineacionHomeUser.innerHTML = TablaAlineacion(datos.rowFour.ultimaAlineacion);
            } else {
                swal('Dashboard', 'No se ha podido cargar correctamente, es posible que no existan datos para tratar', 'error');
                //Loader
                $(".osc").fadeOut();
                $("#loader").fadeOut();
            }
        });
    }

// --------------------------------------------------------------------------------------------------------------------------------------------