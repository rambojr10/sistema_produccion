
    var hot2;

    // Obtiene las cajas según el código de embarque y la finca
    const op = new FormData();
    op.append('op', 'cargar_cajas_ip');
    op.append('cod_embarque', 'EMB-20203');
    fetch('../logica/contenido.php', {
        method: 'POST',
        body: op
    })
    .then( response => {
        if (response.ok) {
            return response.json();
        } else {
            throw 'No es posible obtener los datos CC_IP';
        }
    })
    .then(res => {

        console.log(res);

        var tblCajas_data = [];

        // Asigna las cajas y datos a las filas
        res.forEach(function (element, index) {
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
            console.log(index);
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
            }, {
                caja: '% Merma',
            }, {
                caja: 'Peso Racimos',
            }, {
                caja: 'Area Recorrida',
            }, {
                caja: 'Peso Vástago',
            }
        ];
        filas.forEach(element => {
            tblCajas_data.push(element);
        });

        // Config for the last rows
        var length = tblCajas_data.length;

    // Renderers here ------------------------------------------------------------------------------
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

    // End renderers -------------------------------------------------------------------------------
        
        const tblCajas = document.querySelector('#tblCajas_ip');
        var tblSettings_cajas = {
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