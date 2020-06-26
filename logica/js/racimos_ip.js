    
    const cod_embarque = $("#cod_embarque_ip").text();
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
        cargar_tabla_racimos_ip(res[0].FKId_TblSemanas)
    });

// ----------------------------------------------------------------------------------------------------------
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
            $("[name='semana_racimos_ip']").val(res.semanas[2].semana);
            $("[name='from_racimos_ip']").val(res.semanas[2].fecha_inicio);
            $("[name='to_racimos_ip']").val(res.semanas[2].fecha_fin);
            $("#pnlPresente").addClass(renderizarEmbolse(res.semanas[1].cinta));
            $("#pnlPrematuro").addClass(renderizarEmbolse(res.semanas[2].cinta));
            var data = [
                {
                    descripcion:  `12 Semanas ${res.semanas[0].cinta}` ,
                    lunes: '0',
                    martes: '0',
                    miercoles: '0',
                    jueves: '0',
                    viernes: '0',
                    sabado: '0',
                    domingo: '0',
                    total: "=SUM(B1:H1)"
                },
                {
                    descripcion: `11 Semanas ${res.semanas[1].cinta}`,
                    lunes: '0',
                    martes: '0',
                    miercoles: '0',
                    jueves: '0',
                    viernes: '0',
                    sabado: '0',
                    domingo: '0',
                    total: "=SUM(B2:H2)"
                },
                {
                    descripcion: `10 Semanas ${res.semanas[2].cinta}`,
                    lunes: '0',
                    martes: '0',
                    miercoles: '0',
                    jueves: '0',
                    viernes: '0',
                    sabado: '0',
                    domingo: '0',
                    total: "=SUM(B3:H3)"
                },
                {
                    descripcion: `09 Semanas ${res.semanas[3].cinta}`,
                    lunes: '0',
                    martes: '0',
                    miercoles: '0',
                    jueves: '0',
                    viernes: '0',
                    sabado: '0',
                    domingo: '0',
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
                    lunes: '0',
                    martes: '0',
                    miercoles: '0',
                    jueves: '0',
                    viernes: '0',
                    sabado: '0',
                    domingo: '0',
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

        // Renderers here ---------------------------------------------------------------------------------------------------------

            // Colors renderes for td
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
                    case 'CAFE':
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
                    case 'CAFE':
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
        // ------------------------------------------------------------------------------------------------------------------------

            var tblRacimos = document.querySelector('#tblRacimos_ip');
            var tblSettings = {
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
                columns: [{
                        data: 'descripcion',
                        type: 'text',
                        editor: false,
                        readOnly: true,
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
            
            var hot = new Handsontable(tblRacimos, tblSettings);  
            
        });
    }

    
    /* columnSummary: [
        {
            destinationRow: 4,
            destinationColumn: 1,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 2,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 3,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 4,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 5,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 6,
            reservedRowsCoords: true,
            type: 'sum'
        },
        {
            destinationRow: 4,
            destinationColumn: 7,
            reservedRowsCoords: true,
            type: 'sum'
        }
    ], */