
    const info = {};

    $(document).on('click', "[href='#verreporte']", function() {
        fetch('../logica/contenido.php?op=listarembarques')
        .then(response => response.json())
        .then(data => {
            Object.assign(info, data);
            data_cajas('tblReportes');
        });
    });
    console.log(info)

    document.addEventListener('click', function(e) { 
        if (e.target.matches('#btnEmbarques')) { 
            activeClass('btnEmbarques');
            // const reportes = document.querySelector('[href="#verreporte"]');
        }
        if (e.target.matches('#btnSemanal')) { 
            activeClass('btnSemanal');
            $('#frmReportes').load('./formularios/form_reportes.php?frm=semanal', () => {
                cargarCmbs('cmbFincas', 'tblEmbarques', 'cmbCajas');
            });
            
        }
        if (e.target.matches('#btnGeneral')) {
            activeClass('btnGeneral');
            $('#frmReportes').load('./formularios/form_reportes.php?frm=general');
        }
        if (e.target.matches('#btnRechazos')) {
            activeClass('btnRechazos');
            $('#frmReportes').load('./formularios/form_reportes.php?frm=rechazos');
        }
        if (e.target.matches('#btnNacional')) {
            activeClass('btnNacional');
            $('#frmReportes').load('./formularios/form_reportes.php?frm=nacional');
        }
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
                cargarDatosTabla(info[item]);
            else 
                document.getElementById(item).innerHTML = info[item];
        });
    }

    function cargarDatosTabla(data) {
        $('#tblReportes').DataTable({
            data: data,
            columns: [
                { data: 'PKCod' },
                { data: 'N_Semana' },
                { data: 'Fecha_Inicio' },
                { data: 'Fecha_Fin' },
                { data: 'Anho' }
            ],
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
        });
    }