// Variables globales -----------------------------------------------------------------------------------------------------------
    var hot1; // tblRacimos
    var hot2; // tblCajas
    var hot3; // tblNacional 
    var hot4; // tblCargue
    const cod_embarque = $("#cod_embarque_ip").text();

// Renderers Here ----------------------------------------------------------------------------------------------------------------------------------------
        
    coffeeRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#79422d';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };

    blackRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = 'black';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };

    orangeRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#da930c';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };
    
    greenRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#197054';
        td.style.fontWeight = 'normal';
        td.style.color = '#fff';
    };

    yellowRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = 'yellow';
        td.style.fontWeight = 'normal';
        td.style.color = '#000'
    };

    whiteRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = 'white';
        td.style.color = '#545454';
        td.style.fontWeight = 'normal';
    };
    
    blueRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#1683bd';
        td.style.fontWeight = 'normal';
        td.style.color = '#fff';
    };

    grayRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = 'gray';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };

    purpleRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#9a2be2';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };

    redRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = 'red';
        td.style.color = 'white';
        td.style.fontWeight = 'normal';
    };

    titleRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#ccc';
        td.style.fontWeight = 'bold';
    }

    boldRenderer = function(instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.fontWeight = 'bold';
        td.style.textAlign = 'center';
        td.style.color = "black";
    }

    // Recibe las cintas y semanas para clasificarlas según el color y así renderizarlas en los td
    function renderizarCintas(cinta) {
        switch (cinta) {
            case 'CAFÉ':
                return coffeeRenderer;
                break;
            case 'NEGRA':
                return blackRenderer;
                break;
            case 'NARANJA':
                return orangeRenderer;
                break;
            case 'VERDE':
                return greenRenderer;
                break;
            case 'AMARILLA':
                return yellowRenderer;
                break;
            case 'BLANCA':
                return whiteRenderer;
                break;
            case 'AZUL':
                return blueRenderer;
                break;
            case 'GRIS':
                return grayRenderer;
                break;
            case 'MORADA':
                return purpleRenderer;
                break;
            case 'ROJA':
                return redRenderer;
                break;
            default:
                break;
        }
    }

    // recibe el embolse y renderiza la clase al panel
    function renderizarEmbolse(cinta) {
        switch (cinta) {
            case 'CAFÉ':
                return "embolseCoffee";
                break;
            case 'NEGRA':
                return "embolseBlack";
                break;
            case 'NARANJA':
                return "embolseOrange";
                break;
            case 'VERDE':
                return "embolseGreen";
                break;
            case 'AMARILLA':
                return "embolseYellow";
                break;
            case 'BLANCA':
                return "embolseWhite";
                break;
            case 'AZUL':
                return "embolseBlue";
                break;
            case 'GRIS':
                return "embolseGray";
                break;
            case 'MORADA':
                return "embolsePurple";
                break;
            case 'ROJA':
                return "embolseRed";
                break;
            default:
                break;
        }
    }

    subtitleRenderer = function (instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.fontWeight = 'bold';
        td.style.fontSize = '11px';
    }

    compRenderer = function (instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#f5f5f5';
        td.style.fontSize = '12px';
        td.style.fontWeight = '400';
    }

    subTitleRenderer2 = function (instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#f5f5f5';
        td.style.fontWeight = 'bold';
        td.style.fontSize = '12px';
    }

// End renderers ---------------------------------------------------------------------------------------------------------------------------------------------

// Cinta de opciones ------------------------------------------------------------------------------------------------------------

    //Guardar datos de las tablas 
    $(document).on('click', '#btnGuardar_ip', async () => {
        let idSemana = $("#cod_embarque_ip").data('idSemana_ip');
        const objectSemana = await getStatus(idSemana);
        if (objectSemana.status === 'edit' || objectSemana.privileges === '1') {
            swal({
                title: "¡Guardar producción!",
                text: "¿Desea guardar los datos de producción?",
                type: "info",
                showCancelButton: true,
                confirmButtonText: "Si, guardar!",
                cancelButtonText: "No, cancelar!"
            }).then(function(isConfirm) {
                if(isConfirm){
                    let jsonProduccion = {
                        cod_embarque: cod_embarque,
                        embolse: {
                            id_semana: $("#cod_embarque_ip").data('idSemana_ip'),
                            id_cinta: $("#cod_embarque_ip").data('idCinta_ip'),
                            presente: $("#txtPresente_ip").val(),
                            prematuro: $("#txtPrematuro_ip").val()
                        },
                        tblRacimos: hot1.getData(),
                        tblCajas: hot2.getData(),
                        tblNacional: hot3.getData(),
                        tblCargue: hot4.getData()
                    };
                    // Loader
                    $(".osc").fadeIn();
                    $("#loader").fadeIn();
                    const op = new FormData();
                    op.append('op', 'guardarProduccion');
                    op.append('datosProduccionGuardar', JSON.stringify(jsonProduccion));
                    fetch('../logica/contenido.php', {
                        method: 'POST',
                        body: op
                    })
                    .then(response => {
                        if (response.ok)
                            return response.text();
                        else
                            throw "No se ha podido guardar los datos correctamente IP";
                    })
                    .then(res => {
                        $(".osc").fadeOut();
                        $("#loader").fadeOut();
                        if (res == 20) { // response 20 is a code for save data
                            $.notify({
                                icon: 'fa fa-check-circle',
                                message: 'Datos <strong>GUARDADOS</strong> correctamente.',
                                title: '<strong>Producción: </strong>'
                            }, {
                                type: 'success'
                            });
                        } else if (res == 21) { //response 21 is a code for update data
                            $.notify({
                                icon: 'fa fa-info-circle',
                                message: 'Datos <strong>ACTUALIZADOS</strong> correctamente.',
                                title: '<strong>Producción: </strong>'
                            }, {
                                type: 'info'
                            });
                        } else if (res == 22) { //response 22 is a error code for limit of elaboration
                            setTimeout(func => {swal('Guardar producción', '¡Los datos superan el límite de elaboración!', 'error')}, 1000);
                        } else {
                            $.notify({
                                icon: 'fa fa-times-circle',
                                message: 'Ha ocurrido un error, verifica los datos.',
                                title: '<strong>Producción: </strong>'
                            }, {
                                type: 'danger'
                            });
                        }
                    });
                }
            });
        } else {
            swal('Ingresar producción', 'Fecha límite de modificación superada', 'error');
        }
    });
    
    //Elimina los datos de una producción
    $(document).on('click', '#btnEliminar_ip', async () => {
        let idSemana = $('#cod_embarque_ip').data('idSemana_ip');
        const objectSemana = await getStatus(idSemana);
        if (objectSemana.status === 'edit' || objectSemana.privileges === '1') {
            swal({
                title: '¡Eliminar producción!',
                text: '¿Desea eliminar los datos?, no podrá recuperarlos más tarde.',
                type: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Estoy seguro!',
                cancelButtonText: 'No, cancelar!'
            }).then((isConfirm) => {
                if (isConfirm) {
                    //Loader
                    $('.osc').fadeIn();
                    $('#loader').fadeIn();

                    const op = new FormData();
                    op.append('op', 'eliminarproduccion');
                    op.append('codEmbarque', cod_embarque);
                    fetch('../logica/contenido.php', {
                        method: 'POST',
                        body: op
                    })
                    .then(response => {
                        if (response.ok)
                            return response.text()
                        else
                            throw "No es posible realizar esta acción"
                    })
                    .then(res => {
                        if (res == true) {
                            //Loader
                            $('.osc').fadeOut();
                            $('#loader').fadeOut();
                            $.notify({
                                icon: 'fa fa-check',
                                message: 'Datos <strong>ELIMINADOS</strong> correctamente.',
                                title: '<strong>Producción: </strong>'
                            }, {
                                type: 'warning'
                            });
                            $("a[href='#ingresarproduccion']").trigger('click');
                        } else if (res == false) {
                            // Loader
                            $('.osc').fadeOut();
                            $('#loader').fadeOut();
                            $.notify({
                                icon: 'fa fa-times',
                                message: 'Acción inválida.',
                                title: '<strong>Producción: </strong>'
                            }, {
                                type: 'danger'
                            });
                        }
                    });
                }
            })
        } else {
            swal('Ingresar producción', 'Fecha límite de modificación superada', 'error');
        }
    });

    //Ver alineación: || muestra el modal desde el evento del botón || - sólo es informativo
    $(document).on('click', '#btnVerAlineacion', function() {
        const op = new FormData();
        op.append('op', 'ver_alineacion');
        op.append('codEmbarque', cod_embarque);
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) 
                return response.text()
            else
                throw "No se ha podido cargar los datos VA"
        })
        .then(res => {
            $('#veralineacion').html(res);
        });
    });

    //Inicio 
    $(document).on('click', '#btnVolver_ip', () => {
        window.location.href = 'index.php';
    });

    // Script de carga de tablas & verifica si existen datos previos para cargalos
    const op = new FormData();
    op.append("op", "codEmbarque_verificar");
    op.append("key", cod_embarque);
    op.append("campo", "PKCod");
    op.append("tabla", "tblembarque");
    fetch('../logica/contenido.php', {
        method: 'POST',
        body: op
    })
    .then(response => {
        if (response.ok)
            return response.json();
        else
            throw "No se ha podido cargar los datos IP";
    })
    .then(res => {
        if (res[0].PKCod == cod_embarque) {
            $("#cod_embarque_ip").data('idSemana_ip', res[0].FKId_TblSemanas);
            fetch(`../logica/contenido.php?op=cargar_produccion_ip&cod_embarque=${cod_embarque}`)
            .then(response => {
                if (response.ok) 
                    return response.json()
                else
                    throw 'No se ha podido cargar los datos'
            })
            .then(datosProduccion => {
                if (datosProduccion.result == false) {
                    cargar_tabla_racimos_ip(res[0].FKId_TblSemanas, false);
                    cargar_tabla_cajas_ip(false);
                    cargar_tabla_nacional_ip(false, false);
                    cargar_info_elaboracion_ip(false);
                } else {
                    $("#txtPresente_ip").val(datosProduccion.embolse.presente);
                    $("#txtPrematuro_ip").val(datosProduccion.embolse.prematuro);
                    $('#lblTotal_ip').val(calculateTotalEmbolse());
                    cargar_tabla_racimos_ip(res[0].FKId_TblSemanas, datosProduccion.tblRacimos);
                    cargar_tabla_cajas_ip(datosProduccion.tblCajas);
                    cargar_tabla_nacional_ip(datosProduccion.tblNacional, datosProduccion.tblCargue, datosProduccion.tblCajasPlataforma);
                    cargar_info_elaboracion_ip(datosProduccion.infoElaboracion);
                }
            });
        } else {
            console.log('undefined');
        }
    });

// Tabla racimos ----------------------------------------------------------------------------------------------------------

    function cargar_tabla_racimos_ip(id_semana, existsTblRacimos) {
        const op = new FormData();
        op.append("op", "cargardatos_racimos_ip");
        op.append("id_semana", id_semana);
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok)
                return response.json();
            else
                throw "No se ha podido cargar los datos IP";
        })
        .then(res => {
            //Guarda el id de la cinta para guardar los datos de los racimos en la tabla tblDet_tblDet_tblRacimos_tblDias
            $("#cod_embarque_ip").data("idCinta_ip", res.semana.FKId_TblCintas)

            $("[name='semana_ip']").val(res.semana.N_Semana);
            $("[name='from_ip']").val(res.semana.Fecha_Inicio);
            $("[name='to_ip']").val(res.semana.Fecha_Fin);
            $("#pnlPresente").addClass(renderizarEmbolse(res.cintas[1].Descripcion));
            $("#pnlPrematuro").addClass(renderizarEmbolse(res.cintas[2].Descripcion));
           
            let tblRacimos_data = [
                {
                    descripcion:  `12 Semanas ${res.cintas[0].Descripcion}` ,
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][0],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][0],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][0],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][0],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][0],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][0],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][0],
                    total: "=SUM(B1:H1)"
                }, {
                    descripcion: `11 Semanas ${res.cintas[1].Descripcion}`,
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][1],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][1],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][1],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][1],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][1],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][1],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][1],
                    total: "=SUM(B2:H2)"
                }, {
                    descripcion: `10 Semanas ${res.cintas[2].Descripcion}`,
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][2],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][2],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][2],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][2],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][2],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][2],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][2],
                    total: "=SUM(B3:H3)"
                }, {
                    descripcion: `09 Semanas ${res.cintas[3].Descripcion}`,
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][3],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][3],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][3],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][3],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][3],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][3],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][3],
                    total: "=SUM(B4:H4)"
                }, {
                    descripcion: "TOTAL",
                    lunes: "=SUM(B1:B4)",
                    martes: "=SUM(C1:C4)",
                    miercoles: "=SUM(D1:D4)",
                    jueves: "=SUM(E1:E4)",
                    viernes: "=SUM(F1:F4)",
                    sabado: "=SUM(G1:G4)",
                    domingo: "=SUM(H1:H4)",
                    total: "=SUM(I1:I4)"
                }, {
                    descripcion: "Total Personas Embarque",
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][5],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][5],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][5],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][5],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][5],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][5],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][5],
                    total: "=SUM(B6:H6)"
                }, {
                    descripcion: "Trabajadores otras fincas",
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][6],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][6],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][6],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][6],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][6],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][6],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][6],
                    total: "=SUM(B7:H7)"
                }, {
                    descripcion: "RACIMOS"
                }, {
                    descripcion: "Rechazados",
                    lunes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[0][4],
                    martes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[1][4],
                    miercoles: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[2][4],
                    jueves: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[3][4],
                    viernes: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[4][4],
                    sabado: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[5][4],
                    domingo: (typeof existsTblRacimos) == 'boolean' ? '' : existsTblRacimos[6][4],
                    total: "=SUM(B9:H9)"
                }, {
                    descripcion: "Procesados",
                    lunes: '=SUM(B5;-B9)',
                    martes: '=SUM(C5;-C9)',
                    miercoles: '=SUM(D5;-D9)',
                    jueves: '=SUM(E5;-E9)',
                    viernes: '=SUM(F5;-F9)',
                    sabado: '=SUM(G5;-G9)',
                    domingo: '=SUM(H5;-H9)',
                    total: "=SUM(B10:H10)"
                }
            ];

            const tblRacimos = document.querySelector('#tblRacimos_ip');
            let tblSettings_racimos = {
                licenseKey: 'non-commercial-and-evaluation',
                data: tblRacimos_data,
                className: 'htCenter',
                cell: [
                    {row: 0, col: 0, renderer: renderizarCintas(res.cintas[0].Descripcion) },
                    {row: 1, col: 0, renderer: renderizarCintas(res.cintas[1].Descripcion) },
                    {row: 2, col: 0, renderer: renderizarCintas(res.cintas[2].Descripcion) },
                    {row: 3, col: 0, renderer: renderizarCintas(res.cintas[3].Descripcion) },
                    {row: 4, col: 0, renderer: titleRenderer},
                    {row: 7, col: 0, renderer: titleRenderer},
                    // ReadOnly
                    {row: 4, col: 1, readOnly: true}, 
                    {row: 4, col: 2, readOnly: true}, 
                    {row: 4, col: 3, readOnly: true}, 
                    {row: 4, col: 4, readOnly: true}, 
                    {row: 4, col: 5, readOnly: true}, 
                    {row: 4, col: 6, readOnly: true}, 
                    {row: 4, col: 7, readOnly: true},
                    {row: 4, col: 8, renderer: boldRenderer},
                    {row: 9, col: 1, readOnly: true},
                    {row: 9, col: 2, readOnly: true},
                    {row: 9, col: 3, readOnly: true},
                    {row: 9, col: 4, readOnly: true},
                    {row: 9, col: 5, readOnly: true},
                    {row: 9, col: 6, readOnly: true},
                    {row: 9, col: 7, readOnly: true},
                    {row: 9, col: 8, renderer: boldRenderer},
                ],
                columns: [
                    {
                        data: 'descripcion',
                        type: 'text',
                        editor: false,
                        readOnly: true
                    }, {
                        data: 'lunes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'martes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'miercoles',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'jueves',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'viernes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'sabado',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'domingo',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    }, {
                        data: 'total',
                        type: 'numeric',
                        readOnly: true
                    }
                ],
                mergeCells: [
                    {row: 7, col: 0, rowspan: 1, colspan: 9}
                ],
                formulas: true,
                stretchH: 'all',
                maxRows: 10, 
                manualRowResize: false,
                manualColumnResize: false,
                rowHeaders: false,
                colHeaders: function(col) {
                    switch (col) {
                        case 0:
                            return "<span class='label label-primary'>Descripción</span>"
                        case 1:
                            return "<span class='label label-primary'>Lunes</span>"
                        case 2:
                            return "<span class='label label-primary'>Martes</span>"
                        case 3:
                            return "<span class='label label-primary'>Miércoles</span>"
                        case 4:
                            return "<span class='label label-primary'>Jueves</span>"
                        case 5:
                            return "<span class='label label-primary'>Viernes</span>"
                        case 6:
                            return "<span class='label label-primary'>Sábado</span>"
                        case 7:
                            return "<span class='label label-primary'>Domingo</span>"
                        case 8:
                            return "<span class='label label-primary'>TOTAL</span>"
                    }
                },
                manualRowMove: false,
                manualColumnMove: false,
                contextMenu: false,
                filters: false,
                dropdownMenu: false
            };
            
            hot1 = new Handsontable(tblRacimos, tblSettings_racimos);  
            
        });
    }

// Tabla cajas ------------------------------------------------------------------------------------------------

    // Obtiene las cajas según el código de embarque y la finca
    function cargar_tabla_cajas_ip(existsTblCajas) {
        const op = new FormData();
        op.append('op', 'cargar_cajas_ip');
        op.append('cod_embarque', cod_embarque);
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then( response => {
            if (response.ok)
                return response.json();
            else
                throw 'No es posible obtener los datos CC_IP';
        })
        .then(res => {

            var tblCajas_data = [];

            // Asigna las cajas y datos a las filas
            res.cajas.forEach(function (element, index) {
                let item = {
                    caja: element.Descripcion,
                    codigo: element.FKCodigo_TblCajasProduccion,
                    factor: element.FactorConversion,
                    lunes: (existsTblCajas != false ? existsTblCajas[0][index] : ''),
                    martes: (existsTblCajas != false ? existsTblCajas[1][index] : ''),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2][index] : ''),
                    jueves: (existsTblCajas != false ? existsTblCajas[3][index] : ''),
                    viernes: (existsTblCajas != false ? existsTblCajas[4][index] : ''),
                    sabado: (existsTblCajas != false ? existsTblCajas[5][index] : ''),
                    domingo: (existsTblCajas != false ? existsTblCajas[6][index] : ''),
                    total: `=SUM(D${index+1}:J${index+1})`,
                    conversion: `=C${index+1}*K${index+1}`
                }
                tblCajas_data.push(item);
            });

            // Asigna las últimas filas a la tabla
            let filas = [
                { 
                    caja: 'CAJAS ELABORADAS',
                    codigo: null,
                    factor: null,
                    lunes: `=SUM(D1:D${tblCajas_data.length})`,
                    martes: `=SUM(E1:E${tblCajas_data.length})`,
                    miercoles: `=SUM(F1:F${tblCajas_data.length})`,
                    jueves: `=SUM(G1:G${tblCajas_data.length})`,
                    viernes: `=SUM(H1:H${tblCajas_data.length})`,
                    sabado: `=SUM(I1:I${tblCajas_data.length})`,
                    domingo: `=SUM(J1:J${tblCajas_data.length})`,
                    total: `=SUM(K1:K${tblCajas_data.length})`,
                    conversion: `=SUM(L1:L${tblCajas_data.length})`
                }, {
                    caja: 'CAJAS RECHAZADAS',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? existsTblCajas[0].cajasRechazadas : 0),
                    martes: (existsTblCajas != false ? existsTblCajas[1].cajasRechazadas : 0),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2].cajasRechazadas : 0),
                    jueves: (existsTblCajas != false ? existsTblCajas[3].cajasRechazadas : 0),
                    viernes: (existsTblCajas != false ? existsTblCajas[4].cajasRechazadas : 0),
                    sabado: (existsTblCajas != false ? existsTblCajas[5].cajasRechazadas : 0),
                    domingo: (existsTblCajas != false ? existsTblCajas[6].cajasRechazadas : 0),
                    total: `=SUM(D${tblCajas_data.length+2}:J${tblCajas_data.length+2})`,
                    conversion: `=K${tblCajas_data.length+2}`
                }, {
                    caja: 'CAJAS EXPORTADAS',
                    codigo: null,
                    factor: null,
                    lunes: `=D${tblCajas_data.length+1}-D${tblCajas_data.length+2}`,
                    martes: `=E${tblCajas_data.length+1}-E${tblCajas_data.length+2}`,
                    miercoles: `=F${tblCajas_data.length+1}-F${tblCajas_data.length+2}`,
                    jueves: `=G${tblCajas_data.length+1}-G${tblCajas_data.length+2}`,
                    viernes: `=H${tblCajas_data.length+1}-H${tblCajas_data.length+2}`,
                    sabado: `=I${tblCajas_data.length+1}-I${tblCajas_data.length+2}`,
                    domingo: `=J${tblCajas_data.length+1}-J${tblCajas_data.length+2}`,
                    total: `=K${tblCajas_data.length+1}-K${tblCajas_data.length+2}`,
                    conversion: `=L${tblCajas_data.length+1}-L${tblCajas_data.length+2}`
                }, {
                    caja: 'Fruta Piso',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? existsTblCajas[0].frutaPiso : ''),
                    martes: (existsTblCajas != false ? existsTblCajas[1].frutaPiso : ''),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2].frutaPiso : ''),
                    jueves: (existsTblCajas != false ? existsTblCajas[3].frutaPiso : ''),
                    viernes: (existsTblCajas != false ? existsTblCajas[4].frutaPiso : ''),
                    sabado: (existsTblCajas != false ? existsTblCajas[5].frutaPiso : ''),
                    domingo: (existsTblCajas != false ? existsTblCajas[6].frutaPiso : ''),
                    total: `=SUM(D${tblCajas_data.length+4}:J${tblCajas_data.length+4})`,
                    conversion: null
                }, {
                    caja: 'Ratio 1a. / 2a.',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? (existsTblCajas[0].ratio == 0 ? '' : existsTblCajas[0].ratio) : ''),
                    martes: (existsTblCajas != false ? (existsTblCajas[1].ratio == 0 ? '' : existsTblCajas[1].ratio) : ''),
                    miercoles: (existsTblCajas != false ? (existsTblCajas[2].ratio == 0 ? '' : existsTblCajas[2].ratio) : ''),
                    jueves: (existsTblCajas != false ? (existsTblCajas[3].ratio == 0 ? '' : existsTblCajas[3].ratio) : ''),
                    viernes: (existsTblCajas != false ? (existsTblCajas[4].ratio == 0 ? '' : existsTblCajas[4].ratio) : ''),
                    sabado: (existsTblCajas != false ? (existsTblCajas[5].ratio == 0 ? '' : existsTblCajas[5].ratio) : ''),
                    domingo: (existsTblCajas != false ? (existsTblCajas[6].ratio == 0 ? '' : existsTblCajas[6].ratio) : ''),
                    total: null,
                    conversion: null
                }, {
                    caja: '% Merma',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? (existsTblCajas[0].merma == 0 ? null : existsTblCajas[0].merma) : null),
                    martes: (existsTblCajas != false ? (existsTblCajas[1].merma == 0 ? null : existsTblCajas[1].merma) : null),
                    miercoles: (existsTblCajas != false ? (existsTblCajas[2].merma == 0 ? null : existsTblCajas[2].merma) : null),
                    jueves: (existsTblCajas != false ? (existsTblCajas[3].merma == 0 ? null : existsTblCajas[3].merma) : null),
                    viernes: (existsTblCajas != false ? (existsTblCajas[4].merma == 0 ? null : existsTblCajas[4].merma) : null),
                    sabado: (existsTblCajas != false ? (existsTblCajas[5].merma == 0 ? null : existsTblCajas[5].merma) : null),
                    domingo: (existsTblCajas != false ? (existsTblCajas[6].merma == 0 ? null : existsTblCajas[6].merma) : null),
                    total: null,
                    conversion: null
                }, {
                    caja: 'Peso Racimos',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? (existsTblCajas[0].pesoRacimos == 0 ? null : existsTblCajas[0].pesoRacimos) : null),
                    martes: (existsTblCajas != false ? (existsTblCajas[1].pesoRacimos == 0 ? null : existsTblCajas[1].pesoRacimos) : null),
                    miercoles: (existsTblCajas != false ? (existsTblCajas[2].pesoRacimos == 0 ? null : existsTblCajas[2].pesoRacimos) : null),
                    jueves: (existsTblCajas != false ? (existsTblCajas[3].pesoRacimos == 0 ? null : existsTblCajas[3].pesoRacimos) : null),
                    viernes: (existsTblCajas != false ? (existsTblCajas[4].pesoRacimos == 0 ? null : existsTblCajas[4].pesoRacimos) : null),
                    sabado: (existsTblCajas != false ? (existsTblCajas[5].pesoRacimos == 0 ? null : existsTblCajas[5].pesoRacimos) : null),
                    domingo: (existsTblCajas != false ? (existsTblCajas[6].pesoRacimos == 0 ? null : existsTblCajas[6].pesoRacimos) : null),
                    total: null,
                }, {
                    caja: 'Area Recorrida',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? existsTblCajas[0].areaRecorrida : ''),
                    martes: (existsTblCajas != false ? existsTblCajas[1].areaRecorrida : ''),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2].areaRecorrida : ''),
                    jueves: (existsTblCajas != false ? existsTblCajas[3].areaRecorrida : ''),
                    viernes: (existsTblCajas != false ? existsTblCajas[4].areaRecorrida : ''),
                    sabado: (existsTblCajas != false ? existsTblCajas[5].areaRecorrida : ''),
                    domingo: (existsTblCajas != false ? existsTblCajas[6].areaRecorrida : ''),
                    total: `=ROUND(SUM(D${tblCajas_data.length+8}:J${tblCajas_data.length+8}), 2)`,
                    conversion: null
                }, {
                    caja: 'Peso Vástago',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? (existsTblCajas[0].pesoVastago == 0 ? null : existsTblCajas[0].pesoVastago) : null),
                    martes: (existsTblCajas != false ? (existsTblCajas[1].pesoVastago == 0 ? null : existsTblCajas[1].pesoVastago) : null),
                    miercoles: (existsTblCajas != false ? (existsTblCajas[2].pesoVastago == 0 ? null : existsTblCajas[2].pesoVastago) : null),
                    jueves: (existsTblCajas != false ? (existsTblCajas[3].pesoVastago == 0 ? null : existsTblCajas[3].pesoVastago) : null),
                    viernes: (existsTblCajas != false ? (existsTblCajas[4].pesoVastago == 0 ? null : existsTblCajas[4].pesoVastago) : null),
                    sabado: (existsTblCajas != false ? (existsTblCajas[5].pesoVastago == 0 ? null : existsTblCajas[5].pesoVastago) : null),
                    domingo: (existsTblCajas != false ? (existsTblCajas[6].pesoVastago == 0 ? null : existsTblCajas[6].pesoVastago) : null),
                    total: null,
                    conversion: null
                }, {
                    caja: 'Lotes CORTADOS',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? existsTblCajas[0].lotesCortados : ''),
                    martes: (existsTblCajas != false ? existsTblCajas[1].lotesCortados : ''),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2].lotesCortados : ''),
                    jueves: (existsTblCajas != false ? existsTblCajas[3].lotesCortados : ''),
                    viernes: (existsTblCajas != false ? existsTblCajas[4].lotesCortados : ''),
                    sabado: (existsTblCajas != false ? existsTblCajas[5].lotesCortados : ''),
                    domingo: (existsTblCajas != false ? existsTblCajas[6].lotesCortados : ''),
                    total: null,
                    conversion: null
                }, {
                    caja: 'Lotes INICIADOS',
                    codigo: null,
                    factor: null,
                    lunes: (existsTblCajas != false ? existsTblCajas[0].lotesIniciados : ''),
                    martes: (existsTblCajas != false ? existsTblCajas[1].lotesIniciados : ''),
                    miercoles: (existsTblCajas != false ? existsTblCajas[2].lotesIniciados : ''),
                    jueves: (existsTblCajas != false ? existsTblCajas[3].lotesIniciados : ''),
                    viernes: (existsTblCajas != false ? existsTblCajas[4].lotesIniciados : ''),
                    sabado: (existsTblCajas != false ? existsTblCajas[5].lotesIniciados : ''),
                    domingo: (existsTblCajas != false ? existsTblCajas[6].lotesIniciados : ''),
                    total: null,
                    conversion: null
                }
            ];
            filas.forEach(element => {
                tblCajas_data.push(element);
            });

            // Config for the last rows
            var length = tblCajas_data.length;

            const tblCajas = document.querySelector('#tblCajas_ip');
            let tblSettings_cajas = {
                licenseKey: 'non-commercial-and-evaluation',
                data: tblCajas_data,
                stretchH: 'all',
                formulas: true,
                rowHeaders: false,
                contextMenu: false,
                maxRows: length,
                manualRowResize: false,
                manualColumnResize: false,
                manualRowMove: false,
                filters: false,
                dropdownMenu: false,
                className: 'htRight',
                colHeaders: function (col) {
                    switch (col) {
                        case 0:
                            return "<span class='label label-primary'>Caja producción</span>"
                        case 1:
                            return "<span class='label label-primary'>Código</span>"
                        case 2:
                            return "<span class='label label-success'>F.Conv</span>"
                        case 3:
                            return "<span class='label label-primary'>Lúnes</span>"
                        case 4:
                            return "<span class='label label-primary'>Martes</span>"
                        case 5:
                            return "<span class='label label-primary'>Miércoles</span>"
                        case 6:
                            return "<span class='label label-primary'>Jueves</span>"
                        case 7:
                            return "<span class='label label-primary'>Viernes</span>"
                        case 8:
                            return "<span class='label label-primary'>Sábado</span>"
                        case 9:
                            return "<span class='label label-primary'>Domingo</span>"
                        case 10:
                            return "<span class='label label-success'>Total</span>"
                        case 11:
                            return "<span class='label label-success'>Conv</span>"
                    }
                },
                columns: [
                    {
                        data: 'caja', 
                        type: 'text',
                        className: 'htLeft',
                        editor: false,
                        readOnly: true
                    },
                    {
                        data: 'codigo',
                        type: 'text',
                        editor: false,
                        readOnly: true
                    },
                    {
                        data: 'factor',
                        type: 'numeric',
                        editor: false,
                        readOnly: true,
                        numericFormat: {
                            pattern: '0,0'
                        }
                    },
                    {
                        data: 'lunes',
                        type: 'numeric'
                    },
                    {
                        data: 'martes',
                        type: 'numeric'
                    },
                    {
                        data: 'miercoles',
                        type: 'numeric'
                    },
                    {
                        data: 'jueves',
                        type: 'numeric'
                    },
                    {
                        data: 'viernes',
                        type: 'numeric'
                    },
                    {
                        data: 'sabado',
                        type: 'numeric'
                    },
                    {
                        data: 'domingo',
                        type: 'numeric'
                    },
                    {
                        data: 'total',
                        type: 'numeric',
                        readOnly: true
                    },
                    {
                        data: 'conversion',
                        type: 'numeric',
                        readOnly: true,
                        numericFormat: {
                            pattern: '0,0'
                        }
                    }
                ],
                colWidths: [120, 30, 30],
                cell: [
                    {row: (length-11), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                    {row: (length-10), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                    {row: (length-9), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                    {row: (length-8), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-7), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-6), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-5), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-4), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-3), col: 0, renderer: compRenderer, className: 'htCenter'},
                    {row: (length-2), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                    {row: (length-1), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                    // ReadOnly
                    {row: (length-11), col: 3, readOnly: true},
                    {row: (length-11), col: 4, readOnly: true},
                    {row: (length-11), col: 5, readOnly: true},
                    {row: (length-11), col: 6, readOnly: true},
                    {row: (length-11), col: 7, readOnly: true},
                    {row: (length-11), col: 8, readOnly: true},
                    {row: (length-11), col: 9, readOnly: true},
                    {row: (length-9), col: 3, readOnly: true},
                    {row: (length-9), col: 4, readOnly: true},
                    {row: (length-9), col: 5, readOnly: true},
                    {row: (length-9), col: 6, readOnly: true},
                    {row: (length-9), col: 7, readOnly: true},
                    {row: (length-9), col: 8, readOnly: true},
                    {row: (length-9), col: 9, readOnly: true},
                    {row: (length-7), col: 3, readOnly: true},
                    {row: (length-7), col: 4, readOnly: true},
                    {row: (length-7), col: 5, readOnly: true},
                    {row: (length-7), col: 6, readOnly: true},
                    {row: (length-7), col: 7, readOnly: true},
                    {row: (length-7), col: 8, readOnly: true},
                    {row: (length-7), col: 9, readOnly: true},
                    {row: (length-6), col: 3, readOnly: true},
                    {row: (length-6), col: 4, readOnly: true},
                    {row: (length-6), col: 5, readOnly: true},
                    {row: (length-6), col: 6, readOnly: true},
                    {row: (length-6), col: 7, readOnly: true},
                    {row: (length-6), col: 8, readOnly: true},
                    {row: (length-6), col: 9, readOnly: true},
                    {row: (length-5), col: 3, readOnly: true},
                    {row: (length-5), col: 4, readOnly: true},
                    {row: (length-5), col: 5, readOnly: true},
                    {row: (length-5), col: 6, readOnly: true},
                    {row: (length-5), col: 7, readOnly: true},
                    {row: (length-5), col: 8, readOnly: true},
                    {row: (length-5), col: 9, readOnly: true},
                    {row: (length-3), col: 3, readOnly: true},
                    {row: (length-3), col: 4, readOnly: true},
                    {row: (length-3), col: 5, readOnly: true},
                    {row: (length-3), col: 6, readOnly: true},
                    {row: (length-3), col: 7, readOnly: true},
                    {row: (length-3), col: 8, readOnly: true},
                    {row: (length-3), col: 9, readOnly: true},
                    // Custom cells
                    {row: (length-2), col: 3, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 4, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 5, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 6, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 7, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 8, type: 'text', className: 'htCenter'},
                    {row: (length-2), col: 9, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 3, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 4, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 5, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 6, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 7, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 8, type: 'text', className: 'htCenter'},
                    {row: (length-1), col: 9, type: 'text', className: 'htCenter'},
                ],
                mergeCells: [
                    {row: (length-11), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-10), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-9), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-8), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-7), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-6), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-5), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-4), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-3), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-2), col: 0, rowspan: 1, colspan: 3},
                    {row: (length-1), col: 0, rowspan: 1, colspan: 3},
                    // 
                    {row: (length-8), col: 11, rowspan: 8, colspan: 1},
                    {row: (length-2), col: 10, rowspan: 2, colspan: 1}
                ]
            };
            hot2 = new Handsontable(tblCajas, tblSettings_cajas);

            function averageFunction(values) {
                let average = 0;
                let sum = 0;
                let countElements = 0;
                for (let x = 0; x < values.length; x++) {
                    let valor = parseFloat(values[x]);
                    if (valor > 0) {
                        sum += valor;
                        countElements++;
                    }
                }
                average = sum > 0 ? sum/countElements : 0;
                return average.toFixed(2);
            }

            function getDataForTotals(row_index) { 
                let row = hot2.getDataAtRow(row_index);
                return row.slice(3,10);
            }
          
            let row;
            function getDataForTotals(row_index) { 
                row = hot2.getDataAtRow(row_index);
                return row.slice(3,10);
            }
            
            hot2.setDataAtCell(length-7, 10, averageFunction(getDataForTotals(length-7)), 'runningMyCalc');
            hot2.setDataAtCell(length-6, 10, averageFunction(getDataForTotals(length-6)), 'runningMyCalc');
            hot2.setDataAtCell(length-5, 10, averageFunction(getDataForTotals(length-5)), 'runningMyCalc');
            hot2.setDataAtCell(length-3, 10, averageFunction(getDataForTotals(length-3)), 'runningMyCalc');
            
            hot2.addHook('afterChange', function(changes, source) {
                if (source !== 'runningMyCalc') {
                    let rowChanged = changes[0][0];
                    if (rowChanged === length-7) {
                        hot2.setDataAtCell(length-7, 10, averageFunction(getDataForTotals(length-7)), 'runningMyCalc');
                    } else if (rowChanged === length-6) {
                        hot2.setDataAtCell(length-6, 10, averageFunction(getDataForTotals(length-6)), 'runningMyCalc');
                    } else if (rowChanged === length-5) {
                        hot2.setDataAtCell(length-5, 10, averageFunction(getDataForTotals(length-5)), 'runningMyCalc');
                    } else if (rowChanged === length-3) {
                        hot2.setDataAtCell(length-3, 10, averageFunction(getDataForTotals(length-3)), 'runningMyCalc');
                    } 
                } 
            })
        });
    }

// Tabla nacional + cargue --------------------------------------------------------------------------------------
    function cargar_tabla_nacional_ip(existsTblNacional, existsTblCargue, existsTblCajasPlataforma = false) {
        let tblNacional_data = [
            {
                descripcion: 'Dedo suelto cartón',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[0] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[0] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[0] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[0] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[0] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[0] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[0] : '',
                total: '=SUM(B1:H1)'
            }, {
                descripcion: 'Cluster cartón',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[1] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[1] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[1] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[1] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[1] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[1] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[1] : '',
                total: '=SUM(B2:H2)'
            }, {
                descripcion: 'Mano entera',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[2] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[2] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[2] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[2] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[2] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[2] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[2] : '',
                total: '=SUM(B3:H3)'
            }, {
                descripcion: 'Dedo suelto en bolsa de 20Kls',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[3] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[3] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[3] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[3] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[3] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[3] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[3] : '',
                total: '=SUM(B4:H4)'
            }, {
                descripcion: 'Fruta de piso bolsa de 25Kls',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[4] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[4] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[4] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[4] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[4] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[4] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[4] : '',
                total: '=SUM(B5:H5)'
            }, {
                descripcion: 'Canastas sucias',
                lunes: existsTblNacional != false ? existsTblNacional.lunes[5] : '',
                martes: existsTblNacional != false ? existsTblNacional.martes[5] : '',
                miercoles: existsTblNacional != false ? existsTblNacional.miercoles[5] : '',
                jueves: existsTblNacional != false ? existsTblNacional.jueves[5] : '',
                viernes: existsTblNacional != false ? existsTblNacional.viernes[5] : '',
                sabado: existsTblNacional != false ? existsTblNacional.sabado[5] : '',
                domingo: existsTblNacional != false ? existsTblNacional.domingo[5] : '',
                total: '=SUM(B6:H6)'
            }, {
                descripcion: "TOTAL",
                lunes: "=SUM(B1:B6)",
                martes: "=SUM(C1:C6)",
                miercoles: "=SUM(D1:D6)",
                jueves: "=SUM(E1:E6)",
                viernes: "=SUM(F1:F6)",
                sabado: "=SUM(G1:G6)",
                domingo: "=SUM(H1:H6)",
                total: "=SUM(I1:I6)"
            }
        ];

        let tblCargue_data = [
            {   
                fechaCargue: '',
                cliente: '', 
                poma: '',
                dedoSuelto: '',
                cluster: '',
                manoEntera: '',
                especial: '',
                dedoSueltoBolsa20: '',
                dedoSueltoBolsa25: '',
                total: '=SUM(D1:I1)', 
                placa: null,
                conductor: null
            }, {
                dedoSuelto: '',
                cluster: '',
                manoEntera: '',
                especial: '',
                dedoSueltoBolsa20: '',
                dedoSueltoBolsa25: '',
                total: '=SUM(D2:I2)'
            }, {
                dedoSuelto: '',
                cluster: '',
                manoEntera: '',
                especial: '',
                dedoSueltoBolsa20: '',
                dedoSueltoBolsa25: '',
                total: '=SUM(D3:I3)'
            }, {
                dedoSuelto: '',
                cluster: '',
                manoEntera: '',
                especial: '',
                dedoSueltoBolsa20: '',
                dedoSueltoBolsa25: '',
                total: '=SUM(D4:I4)'
            }, {
                dedoSuelto: '',
                cluster: '',
                manoEntera: '',
                especial: '',
                dedoSueltoBolsa20: '',
                dedoSueltoBolsa25: '',
                total: '=SUM(D5:I5)'
            }, {
                fechaCargue: "TOTAL CARGUE DE CAJAS",
                dedoSuelto: "=SUM(D1:D5)",
                cluster: "=SUM(E1:E5)",
                manoEntera: "=SUM(F1:F5)",
                especial: "=SUM(G1:G5)",
                dedoSueltoBolsa20: "=SUM(H1:H5)",
                dedoSueltoBolsa25: "=SUM(I1:I5)",
                total: "=SUM(J1:J5)",
            }, {
                fechaCargue: "CAJAS EN PLATAFORMA",
                dedoSuelto: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.DedoSuelto == null ? '' : existsTblCajasPlataforma.DedoSuelto) : ''}`,
                cluster: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Cluster == null ? '' : existsTblCajasPlataforma.Cluster) : ''}`,
                manoEntera: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.ManoEntera == null ? '' : existsTblCajasPlataforma.ManoEntera) : ''}`,
                especial: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Especial == null ? '' : existsTblCajasPlataforma.Especial) : ''}`,
                dedoSueltoBolsa20: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Bolsa20Kilos == null ? '' : existsTblCajasPlataforma.Bolsa20Kilos) : ''}`,
                dedoSueltoBolsa25: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Bolsa25Kilos == null ? '' : existsTblCajasPlataforma.Bolsa25Kilos) : ''}`,
                total: "=SUM(D7:I7)"
            }
        ];

        let tblCargue_IfExists = [];
        let filasComplemento = [
            {
                fechaCargue: "TOTAL CARGUE DE CAJAS",
                dedoSuelto: "=SUM(D1:D5)",
                cluster: "=SUM(E1:E5)",
                manoEntera: "=SUM(F1:F5)",
                especial: "=SUM(G1:G5)",
                dedoSueltoBolsa20: "=SUM(H1:H5)",
                dedoSueltoBolsa25: "=SUM(I1:I5)",
                total: "=SUM(J1:J5)",
            }, {
                fechaCargue: "CAJAS EN PLATAFORMA",
                dedoSuelto: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.DedoSuelto == null ? '' : existsTblCajasPlataforma.DedoSuelto) : ''}`,
                cluster: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Cluster == null ? '' : existsTblCajasPlataforma.Cluster) : ''}`,
                manoEntera: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.ManoEntera == null ? '' : existsTblCajasPlataforma.ManoEntera) : ''}`,
                especial: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Especial == null ? '' : existsTblCajasPlataforma.Especial) : ''}`,
                dedoSueltoBolsa20: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Bolsa20Kilos == null ? '' : existsTblCajasPlataforma.Bolsa20Kilos) : ''}`,
                dedoSueltoBolsa25: `${existsTblCajasPlataforma !== false ? (existsTblCajasPlataforma.Bolsa25Kilos == null ? '' : existsTblCajasPlataforma.Bolsa25Kilos) : ''}`,
                total: "=SUM(D7:I7)"
            }
        ];
        if (existsTblCargue !== false ) {
            existsTblCargue.forEach( function(element, index) {
                let object = {
                    fechaCargue: element.Fecha_Cargue,
                    cliente: element.Cliente, 
                    poma: element.N_Poma,
                    dedoSuelto: element.DedoSuelto,
                    cluster: element.Cluster,
                    manoEntera: element.ManoEntera,
                    especial: element.Especial,
                    dedoSueltoBolsa20: element.Bolsa20Kilos,
                    dedoSueltoBolsa25: element.Bolsa25Kilos,
                    total: `=SUM(D${index+1}:I${index+1})`, 
                    placa: element.Placa_Vehiculo,
                    conductor: element.Conductor
                }
                tblCargue_IfExists.push(object); 
            })
            if (tblCargue_IfExists.length < 6) {
                for( var x = tblCargue_IfExists.length; x < 5; x++ ) {
                    let object = {
                        fechaCargue: '',
                        cliente: '', 
                        poma: '',
                        dedoSuelto: '',
                        cluster: '',
                        manoEntera: '',
                        especial: '',
                        dedoSueltoBolsa20: '',
                        dedoSueltoBolsa25: '',
                        total: `=SUM(D${x+1}:I${x+1})`, 
                        placa: null,
                        conductor: null
                    }
                    tblCargue_IfExists.push(object);
                }
                tblCargue_IfExists.push(filasComplemento[0]);
                tblCargue_IfExists.push(filasComplemento[1]);
            } else {
                tblCargue_IfExists.push(filasComplemento[0]);
                tblCargue_IfExists.push(filasComplemento[1]);
            }
        }

        const tblNacional = document.querySelector('#tblNacional_ip');
        const tblCargue = document.querySelector('#tblCargue_ip');

        let tblSettings_nacional = {
            licenseKey: 'non-commercial-and-evaluation',
            data: tblNacional_data,
            stretchH: 'all',
            formulas: true,
            rowHeaders: false,
            contextMenu: false,
            manualRowResize: false,
            manualColumnResize: false,
            manualRowMove: false,
            filters: false,
            dropdownMenu: false, 
            className: 'htRight',
            colHeaders: function (col) {
                switch (col) {
                    case 0: 
                        return "<span class='label label-primary'>Descripción</span>"
                    case 1:
                        return "<span class='label label-success'>Lúnes</span>"
                    case 2:
                        return "<span class='label label-success'>Martes</span>"
                    case 3:
                        return "<span class='label label-success'>Miércoles</span>"
                    case 4:
                        return "<span class='label label-success'>Jueves</span>"
                    case 5:
                        return "<span class='label label-success'>Viernes</span>"
                    case 6:
                        return "<span class='label label-success'>Sábado</span>"
                    case 7:
                        return "<span class='label label-success'>Domingo</span>"
                    case 8:
                        return "<span class='label label-primary'>Total</span>"
                }
            },
            columns: [
                {
                    data: 'descripcion',
                    type: 'text',
                    className: 'htCenter',
                    editor: false
                }, {
                    data: 'lunes',
                    type: 'numeric'
                }, {
                    data: 'martes',
                    type: 'numeric'
                }, {
                    data: 'miercoles',
                    type: 'numeric'
                }, {
                    data: 'jueves',
                    type: 'numeric'
                }, {
                    data: 'viernes',
                    type: 'numeric'
                }, {
                    data: 'sabado',
                    type: 'numeric'
                }, {
                    data: 'domingo',
                    type: 'numeric'
                }, {
                    data: 'total',
                    readOnly: true,
                    editor: false
                }
            ],
            cell: [
                {row: 6, col: 1, readOnly: true},
                {row: 6, col: 2, readOnly: true},
                {row: 6, col: 3, readOnly: true},
                {row: 6, col: 4, readOnly: true},
                {row: 6, col: 5, readOnly: true},
                {row: 6, col: 6, readOnly: true},
                {row: 6, col: 7, readOnly: true},
                {row: 0, col: 0, renderer: subTitleRenderer2},
                {row: 1, col: 0, renderer: subTitleRenderer2},
                {row: 2, col: 0, renderer: subTitleRenderer2},
                {row: 3, col: 0, renderer: subTitleRenderer2},
                {row: 4, col: 0, renderer: subTitleRenderer2},
                {row: 5, col: 0, renderer: subTitleRenderer2},
                {row: 6, col: 0, renderer: subTitleRenderer2}
            ]
        };

        let tblSettings_cargue = {
            licenseKey: 'non-commercial-and-evaluation',
            data: (tblCargue_IfExists[0] != undefined ? tblCargue_IfExists : tblCargue_data),
            className: 'htCenter',
            cell: [
                {row: 5, col: 0, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 3, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 4, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 5, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 6, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 7, className: 'htCenter', type: 'text', readOnly: true},
                {row: 5, col: 8, className: 'htCenter', type: 'text', readOnly: true},
                {row: 6, col: 0, className: 'htCenter', type: 'text', readOnly: true},
            ],
            columns: [
                {
                    data: 'fechaCargue',
                    type: 'date',
                    dateFormat: 'YYYY/MM/DD',
                    correctFormat: true
                }, {
                    data: 'cliente',
                    type: 'text',
                }, {
                    data: 'poma',
                    type: 'numeric'
                }, {
                    data: 'dedoSuelto',
                    type: 'numeric'
                },{
                    data: 'cluster',
                    type: 'numeric'
                }, {
                    data: 'manoEntera',
                    type: 'numeric'
                }, {
                    data: 'especial',
                    type: 'numeric'
                }, {
                    data: 'dedoSueltoBolsa20',
                    type: 'numeric'
                }, {
                    data: 'dedoSueltoBolsa25',
                    type: 'numeric'
                }, {
                    data: 'total',
                    type: 'numeric',
                    readOnly: true
                }, {
                    data: 'placa',
                    type: 'text'
                }, {
                    data: 'conductor',
                    type: 'text'
                }
            ],
            mergeCells: [
                {row: 5, col: 0, rowspan: 1, colspan: 3},
                {row: 6, col: 0, rowspan: 1, colspan: 3},
                {row: 5, col: 10, rowspan: 2, colspan: 2}
            ],
            formulas: true,
            stretchH: 'all',
            manualRowResize: false,
            manualColumnResize: false,
            rowHeaders: false,
            colHeaders: [
                'Fecha Cargue', 'Cliente', 'Nro. Poma', 'Dedo Suelto', 
                'Cluster', 'Mano Entera', 'Especial', 'D.S Bolsa 20Kls', 
                'D.S Bolsa 25Kls', 'TOTAL', 'Placa', 'Conductor'
            ],
            colWidths: [30, 40, 25, 30, 28, 30, 30, 35, 35, 25, 25, 40],
            manualRowMove: false,
            manualColumnMove: false,
            contextMenu: false,
            filters: false,
            dropdownMenu: false
        }

        hot3 = new Handsontable(tblNacional, tblSettings_nacional);
        hot4 = new Handsontable(tblCargue, tblSettings_cargue);
    }

// COMPLEMENTOS --------------------------------------------------------------------------------------------------
    
    //
    async function getStatus(idSemana) {
        const objectDate = new Date();
        const hoy = new Date( (`${objectDate.getMonth()+1}/${objectDate.getDate()}/${objectDate.getFullYear()}`) );
        const fechaActual = `${hoy.getFullYear()}-${hoy.getMonth()+1}-${hoy.getDate()}`;
        const op = new FormData();
        op.append('op', 'buscar_semana_verificar');
        op.append('idSemana', idSemana);
        const peticion = await fetch('../logica/contenido.php', {method: 'POST', body: op});
        const response = await peticion.json();
        let result = {
            'status': Date.parse(response.Semana.Fecha_Fin) > Date.parse(fechaActual) ? 'edit' : 'noEdit',
            'privileges': response.Privileges
        }
        return result;
    }

    //
    function calculateTotalEmbolse() {
        let presente = $('#txtPresente_ip').val();
        let prematuro = $('#txtPrematuro_ip').val();
        let total = parseInt(presente ? presente : 0) + parseInt(prematuro ? prematuro : 0);
        return total;
    }
    $(document).on('input', '#txtPresente_ip', () => {
        $('#lblTotal_ip').val(calculateTotalEmbolse());
    });
    $(document).on('input', '#txtPrematuro_ip', () => {
        $('#lblTotal_ip').val(calculateTotalEmbolse());
    });

    // 
    function cargar_info_elaboracion_ip(params) {
        if (params !== false) {
            const porcentaje = function (num1, num2) {
                this.value = (num1 / num2) * 100;
                return `${this.value.toFixed(2)}%`;
            }
            document.querySelector('#lblCajasElaboradas').textContent = params.totalElaborado;
            document.querySelector('#lblCajasProgramadas').textContent = params.totalProgramado;
            document.querySelector('#lblVersusCajas').textContent = `${params.totalElaborado}/${params.totalProgramado}`;
            const progressBar = document.querySelector('#lblPorcentajeCajas');
            const porcentajeResult = porcentaje(params.totalElaborado, params.totalProgramado);
            progressBar.setAttribute('data-progress', porcentajeResult);
            progressBar.setAttribute('style', `width: ${porcentajeResult}`);
            progressBar.children[0].textContent = porcentajeResult;
        } else {
            fetch(`../logica/contenido.php?op=buscar_cajas_programadas&codEmbarque=${cod_embarque}`)
            .then(response => response.json())
            .then(datos => {
                document.querySelector('#lblCajasProgramadas').textContent = datos.Total;
                document.querySelector('#lblVersusCajas').textContent = `0/${datos.Total}`;
            });
        }
    }