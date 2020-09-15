// Variables globales -----------------------------------------------------------------------------------------------------------
    var hot1; // tblRacimos
    var hot2; // tblCajas
    var hot3; // tblNacional
    var hot4; // tblCargue
    const cod_embarque = $("#cod_embarque_ip").text();
    

    // Renderers Here ----------------------------------------------------------------------------------
        
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

    // End renderers -----------------------------------------------------------------------------------

// Cinta de opciones ------------------------------------------------------------------------------------------------------------

    $(document).on('click', '#btnGuardar_ip', function () {
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
                    console.log(res);
                });
            }
        });
    });

    // Script de carga de tablas
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
        if (response.ok) {
            return response.json();
        }
        else {
            throw "No se ha podido cargar los datos IP";
        }
    })
    .then(res => {
        console.log(res);
        cargar_tabla_racimos_ip(res[0].FKId_TblSemanas);
        $("#cod_embarque_ip").data("idSemana_ip", res[0].FKId_TblSemanas);
    });

// Tabla racimos ----------------------------------------------------------------------------------------------------------

    function cargar_tabla_racimos_ip(id_semana) {
        const op = new FormData();
        op.append("op", "cargardatos_racimos_ip");
        op.append("id_semana", id_semana);
        fetch('../logica/contenido.php', {
            method: 'POST',
            body: op
        })
        .then(response => {
            if (response.ok) {
                return response.json();
            }
            else {
                throw "No se ha podido cargar los datos IP";
            }
        })
        .then(res => {
            
            //Guarda el id de la cinta para guardar los datos de los racimos en la tabla tblDet_tblDet_tblRacimos_tblDias
            $("#cod_embarque_ip").data("idCinta_ip", res.semanas[2].id_cinta)

            $("[name='semana_ip']").val(res.semanas[2].semana);
            $("[name='from_ip']").val(res.semanas[2].fecha_inicio);
            $("[name='to_ip']").val(res.semanas[2].fecha_fin);
            $("#pnlPresente").addClass(renderizarEmbolse(res.semanas[1].cinta));
            $("#pnlPrematuro").addClass(renderizarEmbolse(res.semanas[2].cinta));
            let data = [
                {
                    descripcion:  `12 Semanas ${res.semanas[0].cinta}` ,
                    lunes: 0,
                    martes: 0,
                    miercoles: 0,
                    jueves: 0,
                    viernes: 0,
                    sabado: 0,
                    domingo: 0,
                    total: "=SUM(B1:H1)"
                },
                {
                    descripcion: `11 Semanas ${res.semanas[1].cinta}`,
                    lunes: 0,
                    martes: 0,
                    miercoles: 0,
                    jueves: 0,
                    viernes: 0,
                    sabado: 0,
                    domingo: 0,
                    total: "=SUM(B2:H2)"
                },
                {
                    descripcion: `10 Semanas ${res.semanas[2].cinta}`,
                    lunes: 0,
                    martes: 0,
                    miercoles: 0,
                    jueves: 0,
                    viernes: 0,
                    sabado: 0,
                    domingo: 0,
                    total: "=SUM(B3:H3)"
                },
                {
                    descripcion: `09 Semanas ${res.semanas[3].cinta}`,
                    lunes: 0,
                    martes: 0,
                    miercoles: 0,
                    jueves: 0,
                    viernes: 0,
                    sabado: 0,
                    domingo: 0,
                    total: "=SUM(B4:H4)"
                },
                {
                    descripcion: "TOTAL",
                    lunes: "=SUM(B1:B4)",
                    martes: "=SUM(C1:C4)",
                    miercoles: "=SUM(D1:D4)",
                    jueves: "=SUM(E1:E4)",
                    viernes: "=SUM(F1:F4)",
                    sabado: "=SUM(G1:G4)",
                    domingo: "=SUM(H1:H4)",
                    total: "=SUM(I1:I4)"
                },
                {
                    descripcion: "Total Personas Embarque",
                    total: "=SUM(B6:H6)"
                },
                {
                    descripcion: "Trabajadores otras fincas",
                    total: "=SUM(B7:H7)"
                },
                {
                    descripcion: "RACIMOS"
                },
                {
                    descripcion: "Rechazados",
                    lunes: 0,
                    martes: 0,
                    miercoles: 0,
                    jueves: 0,
                    viernes: 0,
                    sabado: 0,
                    domingo: 0,
                    total: "=SUM(B9:H9)"
                },
                {
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
                data: data,
                className: 'htCenter',
                cell: [
                    {row: 0, col: 0, renderer: renderizarCintas(res.semanas[0].cinta) },
                    {row: 1, col: 0, renderer: renderizarCintas(res.semanas[1].cinta) },
                    {row: 2, col: 0, renderer: renderizarCintas(res.semanas[2].cinta) },
                    {row: 3, col: 0, renderer: renderizarCintas(res.semanas[3].cinta) },
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
                    },
                    {
                        data: 'lunes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'martes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'miercoles',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'jueves',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'viernes',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'sabado',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
                        data: 'domingo',
                        type: 'numeric',
                        max: '7',
                        className: 'htRigth'
                    },
                    {
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
    // const cod_embarque2 = $("#codEmbarque_cajas_ip").text();
    const op2 = new FormData();
    op2.append('op', 'cargar_cajas_ip');
    op2.append('cod_embarque', cod_embarque);
    fetch('../logica/contenido.php', {
        method: 'POST',
        body: op2
    })
    .then( response => {
        if (response.ok) {
            return response.json();
        } else {
            throw 'No es posible obtener los datos CC_IP';
        }
    })
    .then(res => {

        var tblCajas_data = [];

        // Asigna las cajas y datos a las filas
        res.cajas.forEach(function (element, index) {
            let item = {
                caja: element.Descripcion,
                codigo: element.FKCodigo_TblCajasProduccion,
                factor: element.FactorConversion,
                lunes: '',
                martes: '',
                miercoles: '',
                jueves: '',
                viernes: '',
                sabado: '',
                domingo: '',
                total: `=SUM(D${index+1}:J${index+1})`,
                conversion: `=C${index+1}*K${index+1}`
            }
            tblCajas_data.push(item);
        });

        // Asigna las últimas filas a la tabla
        let filas = [
            { 
                caja: 'CAJAS ELABORADAS',
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
                lunes: '0',
                martes: '0',
                miercoles: '0',
                jueves: '0',
                viernes: '0',
                sabado: '0',
                domingo: '0',
                total: `=SUM(D${tblCajas_data.length+2}:J${tblCajas_data.length+2})`,
                conversion: `=K${tblCajas_data.length+2}`
            }, {
                caja: 'CAJAS EXPORTADAS',
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
                caja: 'Ratio 1a. / 2a.',
                total: `=ROUND(AVERAGE(D${tblCajas_data.length+4}:J${tblCajas_data.length+4}), 2)`,
            }, {
                caja: '% Merma',
                total: `=ROUND(AVERAGE(D${tblCajas_data.length+5}:J${tblCajas_data.length+5}), 2)`,
            }, {
                caja: 'Peso Racimos',
                total: `=ROUND(AVERAGE(D${tblCajas_data.length+6}:J${tblCajas_data.length+6}), 2)`,
            }, {
                caja: 'Area Recorrida',
                total: `=SUM(D${tblCajas_data.length+7}:J${tblCajas_data.length+7})`,
            }, {
                caja: 'Peso Vástago',
                total: `=ROUND(AVERAGE(D${tblCajas_data.length+8}:J${tblCajas_data.length+8}), 2)`,
            },
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
            // maxRows: .length
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
                {row: (length-8), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                {row: (length-7), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                {row: (length-6), col: 0, renderer: subtitleRenderer, className: 'htCenter'},
                {row: (length-5), col: 0, renderer: compRenderer, className: 'htCenter'},
                {row: (length-4), col: 0, renderer: compRenderer, className: 'htCenter'},
                {row: (length-3), col: 0, renderer: compRenderer, className: 'htCenter'},
                {row: (length-2), col: 0, renderer: compRenderer, className: 'htCenter'},
                {row: (length-1), col: 0, renderer: compRenderer, className: 'htCenter'},
                // ReadOnly
                {row: (length-8), col: 3, readOnly: true},
                {row: (length-8), col: 4, readOnly: true},
                {row: (length-8), col: 5, readOnly: true},
                {row: (length-8), col: 6, readOnly: true},
                {row: (length-8), col: 7, readOnly: true},
                {row: (length-8), col: 8, readOnly: true},
                {row: (length-8), col: 9, readOnly: true},
                {row: (length-6), col: 3, readOnly: true},
                {row: (length-6), col: 4, readOnly: true},
                {row: (length-6), col: 5, readOnly: true},
                {row: (length-6), col: 6, readOnly: true},
                {row: (length-6), col: 7, readOnly: true},
                {row: (length-6), col: 8, readOnly: true},
                {row: (length-6), col: 9, readOnly: true},
            ],
            mergeCells: [
                {row: (length-8), col: 0, rowspan: 1, colspan: 3},
                {row: (length-7), col: 0, rowspan: 1, colspan: 3},
                {row: (length-6), col: 0, rowspan: 1, colspan: 3},
                {row: (length-5), col: 0, rowspan: 1, colspan: 3},
                {row: (length-4), col: 0, rowspan: 1, colspan: 3},
                {row: (length-3), col: 0, rowspan: 1, colspan: 3},
                {row: (length-2), col: 0, rowspan: 1, colspan: 3},
                {row: (length-1), col: 0, rowspan: 1, colspan: 3},
            ],
        };

        hot2 = new Handsontable(tblCajas, tblSettings_cajas);
        
    });

// Tabla nacional + cargue --------------------------------------------------------------------------------------

    let tblNacional_data = [
        {
            descripcion: 'Dedo suelto cartón',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
            total: '=SUM(B1:H1)'
        }, {
            descripcion: 'Cluster cartón',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
            total: '=SUM(B2:H2)'
        }, {
            descripcion: 'Mano entera',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
            total: '=SUM(B3:H3)'
        }, {
            descripcion: 'Dedo suelto en bolsa de 20Kls',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
            total: '=SUM(B4:H4)'
        }, {
            descripcion: 'Fruta de piso bolsa de 25Kls',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
            total: '=SUM(B5:H5)'
        }, {
            descripcion: 'Canastas sucias',
            lunes: '',
            martes: '',
            miercoles: '',
            jueves: '',
            viernes: '',
            sabado: '',
            domingo: '',
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
            dedoSuelto: 0,
            cluster: 0,
            manoEntera: 0,
            especial: 0,
            dedoSueltoBolsa20: 0,
            dedoSueltoBolsa25: 0,
        }, {
            dedoSuelto: 0,
            cluster: 0,
            manoEntera: 0,
            especial: 0,
            dedoSueltoBolsa20: 0,
            dedoSueltoBolsa25: 0,
        }, {
            dedoSuelto: 0,
            cluster: 0,
            manoEntera: 0,
            especial: 0,
            dedoSueltoBolsa20: 0,
            dedoSueltoBolsa25: 0,
        }, {
            dedoSuelto: 0,
            cluster: 0,
            manoEntera: 0,
            especial: 0,
            dedoSueltoBolsa20: 0,
            dedoSueltoBolsa25: 0,
        }, {
            dedoSuelto: 0,
            cluster: 0,
            manoEntera: 0,
            especial: 0,
            dedoSueltoBolsa20: 0,
            dedoSueltoBolsa25: 0,
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
            total: "=SUM(D7:I7)"
        }
    ];

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
        data: tblCargue_data,
        className: 'htCenter',
        cell: [
            {row: 5, col: 0, className: 'htCenter', type: 'text', readOnly: true},
            {row: 6, col: 0, className: 'htCenter', type: 'text', readOnly: true}
        ],
        columns: [
            {
                data: 'fechaCargue',
                type: 'date',
                dateFormat: 'YYYY/MM/DD',
                correctFormat: true
            }, {
                data: 'cliente'
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
                type: 'numeric'
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
