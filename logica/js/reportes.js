
    const info = {};

    $(document).on('click', "[href='#verreporte']", function() {
        fetch('../logica/contenido.php?op=listarembarques')
        .then(response => response.json())
        .then(data => {
            Object.assign(info, data);
            cargarCmbs('tblEmbarques')
            $("#cmbCajas").select2();
        });
    });

    console.log(info)

    document.addEventListener('click', function(e) { 
        if (e.target.matches('#btnEmbarques')) { 
            activeClass('btnEmbarques');
            cargarCmbs('cmbFincas', 'cmbCajas', 'cmbTipoFruta', 'tblEmbarques');
        }
        if (e.target.matches('#btnSemanal')) { 
            activeClass('btnSemanal');
        }
        if (e.target.matches('#btnGeneral')) {
            activeClass('btnGeneral');
        }
        if (e.target.matches('#btnRechazos')) {
            activeClass('btnRechazos');
        }
        if (e.target.matches('#btnNacional')) {
            activeClass('btnNacional');
        }
    });

    $(document).on('click', '#btnGenerarReportes', function() {
        const options = {
            anho: $('#txtAnho').val(),
            from: $('#cmbDesde').val(),
            to: $('#cmbHasta').val(),
            tipoFruta: $('#cmbTipoFruta').val(),
            cajas: $('#cmbCajas').val()
        }
        const op = new FormData();
        op.append('op', 'generar_reportes');
        op.append('options', JSON.stringify(options));
        fetch('../logica/contenido.php', {method: 'POST', body: op})
        .then(response => response.text())
        .then(data => console.log(data))
    });

    function activeClass(idElement) {
        const elements = document.querySelectorAll('a.item');
        elements.forEach(item => {
            if (item.id === idElement)
                item.classList.add('active');
            else
                item.classList.remove('active');
        });
    }

    function cargarCmbs(...dynamicValues) {
        dynamicValues.forEach(item => {
            if (item.includes('tbl'))
                cargarDatosTabla(info[item], getColumns(item));
            else 
                document.getElementById(item).innerHTML = info[item];
        });
    }

    function cargarDatosTabla(data = null, columns = null) {
        console.log(data, columns)
        let objDataTable = {
            language: {
                "processing":       "Procesando...",
                "search":           "Buscar:",
                "lengthMenu":       "Ver _MENU_ elementos",
                "info":             "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "infoEmpty":        "Mostrando registros del 0 al 0 de un total de 0 registros",
                "infoFiltered":     "(filtrados de _MAX_ elementos en total)",
                "infoPostFix":      "",
                "loadingRecords":   "Cargando...",
                "zeroRecords":      "No se encontraron resultados",
                "emptyTable":       "Ningún dato disponible en esta tabla",
                "paginate": {
                    "first":      "Primero",
                    "previous":   "Último",
                    "next":       "Siguente",
                    "last":       "Anterior"
                },
                "aria": {
                    "sortAscending":  ": Activar para ordenar la columna de manera ascendente",
                    "sortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            },
            bDestroy: true
        }

        if (data) Object.assign(objDataTable, {data: data});
        if (columns) Object.assign(objDataTable, columns);
        $('#tblReportes').DataTable(objDataTable);

        console.log(objDataTable)
    }

    //definir las columnas segun el selector del option semanal, reportes, etc.
    // enviar el parámetro mediante una función y asignarlo

    function getColumns(title) {
        const columns = {
            'tblEmbarques': [
                { title: 'Código', data: 'PKCod'},
                { title: 'Semana', data: 'N_Semana'},
                { title: 'Fecha Inicio', data: 'Fecha_Inicio'},
                { title: 'Fecha Fin', data: 'Fecha_Fin'},
                { title: 'Año', data: 'Anho'},
            ],
            'tblSemanal': [
                { title: 'Id'},
                { title: 'Nombre'},
                { title: 'Fecha Inicio'},
                { title: 'Fecha Fin'},
                { title: 'Anho'},
            ],
            'tblGeneral': [],
            'tblRechazos': [],
            'tblNacional': [],
        }

        return {'columns': columns[title]}
    }