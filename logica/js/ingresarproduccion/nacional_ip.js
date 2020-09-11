    var hot3;
    var hot4;

    $(document).on('click', '#btnGuardar_nacional_ip', function() {
        console.log(hot3.getData());  // Tabla Nacional
        console.log(hot4.getData());  // Tabla Cargue
    });
    

    const cod_embarque = $("#cod_embarque_ip").text();

// Renderers Here ----------------------------------------------------------------------------------

    subTitleRenderer = function (instance, td, row, col, prop, value, cellProperties) {
        Handsontable.renderers.TextRenderer.apply(this, arguments);
        td.style.backgroundColor = '#f5f5f5';
        td.style.fontWeight = 'bold';
        td.style.fontSize = '12px';
    }

//  TABLAS -----------------------------------------------------------------------------------------------------------

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
            {row: 0, col: 0, renderer: subTitleRenderer},
            {row: 1, col: 0, renderer: subTitleRenderer},
            {row: 2, col: 0, renderer: subTitleRenderer},
            {row: 3, col: 0, renderer: subTitleRenderer},
            {row: 4, col: 0, renderer: subTitleRenderer},
            {row: 5, col: 0, renderer: subTitleRenderer},
            {row: 6, col: 0, renderer: subTitleRenderer}
        ]
    };
    
    let tblSettings_cargue = {
        licenseKey: 'non-commercial-and-evaluation',
        data: tblCargue_data,
        stretchH: 'all',
        className: 'htRight',
        formulas: true,
        colWidths: [30, 40, 25, 30, 28, 30, 30, 35, 35, 25, 25, 40],
        rowHeaders: false,
        contextMenu: false,
        manualRowResize: false,
        manualColumnResize: false,
        manualRowMove: false,
        colHeaders: [
            'Fecha Cargue', 'Cliente', 'Nro. Poma', 'Dedo Suelto', 
            'Cluster', 'Mano Entera', 'Especial', 'D.S Bolsa 20Kls', 
            'D.S Bolsa 25Kls', 'TOTAL', 'Placa', 'Conductor'
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
        cell: [
            {row: 5, col: 0, className: 'htCenter', type: 'text', readOnly: true},
            {row: 6, col: 0, className: 'htCenter', type: 'text', readOnly: true}
        ]
    }

    hot3 = new Handsontable(tblNacional, tblSettings_nacional);
    hot4 = new Handsontable(tblCargue, tblSettings_cargue);

   