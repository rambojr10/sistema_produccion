
    const info = {};

    $(document).on('click', "[href='#verreporte']", function() {
        fetch('../logica/contenido.php?op=listarembarques')
        .then(response => response.json())
        .then(data => {
            Object.assign(info, data);
            cargarCmbs('cmbFincas', 'cmbTipoFruta', 'cmbCajas');
            $("#cmbCajas").select2();
        });
    });

    console.log(info)

    document.addEventListener('click', function(e) { 
        let tabla = '';
        if (e.target.matches('#btnEmbarques')) { 
            tabla = 'tblEmbarques';
            activeClass(tabla);
            swithOptions('all');
            cargarDatosTabla(tabla, info[tabla], false);
        }
        if (e.target.matches('#btnSemanal')) { 
            tabla = 'tblSemanal';
            activeClass('btnSemanal');
            swithOptions('none');
            cargarDatosTabla(tabla, info[tabla], true);
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
            reportType: document.querySelector('a.item.active').id.replace('btn', 'tbl'),
            anho: $('#txtAnho').val() !== '' ? $('#txtAnho').val() : null,
            from: $('#cmbDesde').val().includes('SEMANA') ? $('#cmbDesde').val() : null,
            to: $('#cmbHasta').val().includes('SEMANA') ? $('#cmbHasta').val() : null,
            finca: $('#cmbFincas').val() !== '' ? $('#cmbFincas').val() : null,
            tipoFruta: $('#cmbTipoFruta').val() !== '' ? $('#cmbTipoFruta').val() : null,
            cajas: typeof $('#cmbCajas').val() === 'object' ? $('#cmbCajas').val() : null
        }
        console.log(options)
        const op = new FormData();
        op.append('op', 'generar_reportes');
        op.append('options', JSON.stringify(options));
        fetch('../logica/contenido.php', {method: 'POST', body: op})
        .then(response => response.json())
        .then(data => {
            console.log(data)
            //cargarDatosTabla(options.reportType, data, true);
        });
    });

    $(document).on('change', '#cmbTipoFruta', function() {
        let value = $(this).val();
        if (parseInt(value)) {
            fetch(`../logica/contenido.php?op=cajas_tipofruta&id=${value}`)
            .then(response => response.text())
            .then(data => {
                $('#cmbCajas').html(data);
            })
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
            document.getElementById(item).innerHTML = info[item];
        });
    }

    function cargarDatosTabla(nameOption, data = null, hasFooter = false) {
        let objDataTable = {
            columns: getColumns(nameOption),
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
            bDestroy: true,
        }

        let footer = false;
        if (data && hasFooter) {
            let resultTfoot = setTfoot(data, nameOption);
            Object.assign(objDataTable, {data: resultTfoot.data});
            footer = resultTfoot.tfoot;
        } else if (data) {
            Object.assign(objDataTable, {data: data});
        }
        
        const tbl = document.querySelector('#tblReportes');
        if (tbl.children[0]) tbl.removeChild(tbl.children[0]);
        tbl.style.textAlign = hasFooter ? 'center' : 'left';
        const table = document.createElement('table');
        table.id = 'tblTemp';

        tbl.appendChild(table);
        $('#tblTemp').DataTable(objDataTable);
        if (footer) $('#tblTemp').append(footer());

        console.log(objDataTable)
    }

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
                { title: 'Código', data: 'Cod_Embarque'},
                { title: 'Nombre', data: 'Nombre'},
                { title: 'Semana', data: 'N_Semana'},
                { title: 'Fecha In.', data: 'Fecha_Inicio'},
                { title: 'Fecha Fi.', data: 'Fecha_Fin'},
                { title: 'Año', data: 'Anho'},
                { title: 'RT', data: 'Ratio'},
                { title: 'MM', data: 'Merma'},
                { title: 'PR', data: 'Peso_Racimos'},
                { title: 'AR', data: 'Area_Recorrida'},
                { title: 'FP', data: 'Fruta_Piso'},
                { title: 'Cajas Ela.', data: 'Total_CElaboradas'},
                { title: 'Cajas Rec.', data: 'Total_CREchazadas'},
                { title: 'Cajas Exp.', data: 'Total_CExportadas'},
            ],
            'tblGeneral': [],
            'tblRechazos': [],
            'tblNacional': [],
        }

        return columns[title];
    }

    function swithOptions(param) {
        const changeOp = (value, array) => {
            if (value) {
                array.forEach(item => {
                    document.getElementById(item).setAttribute('disabled', value);
                });
            } else {
                array.forEach(item => {
                    document.getElementById(item).removeAttribute('disabled');
                });
            }
        }
        switch (param) {
            case 'all':
                changeOp(true, ['txtAnho', 'cmbDesde', 'cmbHasta', 'cmbFincas', 'cmbTipoFruta', 'cmbCajas']);
                break;
            case 'none':
                changeOp(false, ['txtAnho', 'cmbDesde', 'cmbHasta', 'cmbFincas', 'cmbTipoFruta', 'cmbCajas']);
                break;
        }
    }

    function setTfoot(data, option) {
        let result = {data: [], tfoot: ''};
        if (option === 'tblSemanal') {
            this.ratio = 0;
            this.merma = 0;
            this.pesoRacimos = 0;
            this.areaRecorrida = 0;
            this.frutaPiso = 0;
            this.totalElaboradas = 0;
            this.totalExportadas = 0;
            this.totalRechazadas = 0;
            this.countRatio = 0;
            this.countMerma = 0;
            this.countPesoRacimos = 0;
            this.countAreaRecorrida = 0;
            this.countFrutaPiso = 0;
            data.forEach(item => {
                if (item.Ratio) {
                    item.Ratio = parseFloat(item.Ratio).toFixed(2);
                    this.ratio += parseFloat(item.Ratio);
                    this.countRatio++;
                }
                if (item.Merma) {
                    item.Merma = parseFloat(item.Merma).toFixed(2);
                    this.merma += parseFloat(item.Merma);
                    this.countMerma++;
                }
                if (item.Peso_Racimos) {
                    item.Peso_Racimos = parseFloat(item.Peso_Racimos).toFixed(2);
                    this.pesoRacimos += parseFloat(item.Peso_Racimos);
                    this.countPesoRacimos++;
                }
                if (item.Area_Recorrida) {
                    item.Area_Recorrida = parseFloat(item.Area_Recorrida).toFixed(1);
                    this.areaRecorrida += parseFloat(item.Area_Recorrida);
                    this.countAreaRecorrida++;
                }
                if (item.Fruta_Piso) {
                    item.Fruta_Piso = parseFloat(item.Fruta_Piso).toFixed(2);
                    this.frutaPiso += parseFloat(item.Fruta_Piso);
                    this.countFrutaPiso++;
                }
                if (item.Total_CElaboradas) {
                    this.totalElaboradas += parseInt(item.Total_CElaboradas);
                }
                if (item.Total_CREchazadas) {
                    this.totalRechazadas += parseInt(item.Total_CREchazadas);
                }
                if (item.Total_CExportadas) {
                    this.totalExportadas += parseInt(item.Total_CExportadas);
                }
                // --------------------------------------------
                result.data.push(item);
            });
            const tfoot = _ => {
                let tagFoot = document.createElement('tfoot');
                tagFoot.innerHTML = `
                    <tr>
                        <th>TOTAL</th>
                        <td colspan="5"></td>
                        <td>${this.ratio}</td>
                        <td>${this.merma}</td>
                        <td>${this.pesoRacimos}</td>
                        <td>${this.areaRecorrida}</td>
                        <td>${this.frutaPiso}</td>
                        <td>${this.totalElaboradas}</td>
                        <td>${this.totalRechazadas}</td>
                        <td>${this.totalExportadas}</td>
                    </tr>
                    <tr>
                        <th>PROMEDIO</th>
                        <td colspan="5"></td>
                        <td>${(this.ratio/this.countRatio).toFixed(1)}</td>
                        <td>${(this.merma/this.countMerma).toFixed(1)}</td>
                        <td>${(this.pesoRacimos/this.countPesoRacimos).toFixed(1)}</td>
                        <td>${(this.areaRecorrida/this.countAreaRecorrida).toFixed(1)}</td>
                        <td>${(this.frutaPiso/this.countFrutaPiso).toFixed(1)}</td>
                        <td colspan="3"></td>  
                    </tr>
                `;
                return tagFoot;
            }
            result.tfoot = tfoot;
        }
        return result;
    }
