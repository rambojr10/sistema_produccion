
    const info = {};
    let api;

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
            activeClass('btnEmbarques');
            swithOptions('all');
            cargarDatosTabla(tabla, info[tabla]);
        }
        if (e.target.matches('#btnAllinone')) { 
            tabla = 'tblAllinone';
            activeClass('btnAllinone');
            swithOptions('none');
            cargarDatosTabla(tabla, info[tabla], true, 'case1');
        }
        if (e.target.matches('#btnRechazos')) {
            activeClass('btnRechazos');
            swithOptions('rechazos');
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
            finca: $('#cmbFincas').val().includes('...') ? null : $('#cmbFincas').val(),
            tipoFruta: $('#cmbTipoFruta').val().includes('...') ? null : document.getElementById('cmbTipoFruta').value,
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
            if (options.reportType === 'tblAllinone' && options.tipoFruta) cargarDatosTabla(options.reportType, data, false, 'case2');
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

    $(document).on('click', '#tblReportes tbody tr', function () {
        let data = api?.row(this).data();
        console.log(data);
    });

    function activeClass(idElement) {
        cleanFields();
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

    function cargarDatosTabla(nameOption, data = null, hasFooter = false, option = null) {
        let objDataTable = {
            "columnDefs": nameOption === 'tblAllinone' ? [{
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            }] : undefined,
            "ordering": false,
            columns: getColumns(nameOption, option),
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
            "scrollY": "400px",
            "scrollCollapse": true,
            "paging": false
        }

        data = objDataTable.columns.filter(v => v.data === 'Convertido') ? aggConvert(data) : data;

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
        api = $("#tblTemp").DataTable(objDataTable);

        if (footer) $('#tblTemp').append(footer());

        console.log(objDataTable)
    }

    function getColumns(title, option) {
        const columns = {
            'tblEmbarques': [
                { title: 'Código', data: 'PKCod'},
                { title: 'Semana', data: 'N_Semana'},
                { title: 'Fecha Inicio', data: 'Fecha_Inicio'},
                { title: 'Fecha Fin', data: 'Fecha_Fin'},
                { title: 'Año', data: 'Anho'},
            ],
            'tblAllinone': {
                'case1' : [
                    { title: 'Id', data: 'Id'},
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
                'case2' : [
                    { title: 'Id', data: 'Id'},
                    { title: 'Código', data: 'Cod_Embarque'},
                    { title: 'Nombre', data: 'Nombre'},
                    { title: 'Semana', data: 'N_Semana'},
                    { title: 'F.Conv', data: 'FactorConversion'},
                    { title: 'Cod. Caja', data: 'FKCodigo_TblCajasProduccion'},
                    { title: 'Cajas Prod.', data: 'N_CajasProducidas_Dia'},
                    { title: '20 Kilos', data: 'Convertido'},
                ]
            },
            'tblRechazos': [],
            'tblNacional': [],
        }

        return option ? columns[title][option] : columns[title];
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
            case 'rechazos':
                changeOp(false, ['txtAnho', 'cmbDesde', 'cmbHasta', 'cmbFincas']);
                changeOp(true, ['cmbTipoFruta', 'cmbCajas']);
                break;
        }
    }

    function setTfoot(data, option) {
        let result = {data: [], tfoot: ''};
        if (option === 'tblAllinone') {
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
        if (option === 'tblRechazos') {

        }
        if (option === 'tblNacional') {
            
        }
        return result;
    }

    function cleanFields() {
        let first = 'Seleccione...'
        $('#txtAnho').val('');
        $('#cmbDesde').val(first);
        $('#cmbHasta').val(first);
        $('#cmbFincas').val(first);
        $('#cmbTipoFruta').val(first);
        $("#cmbCajas option[value]").remove();
        cargarCmbs('cmbCajas');
    }

    function aggConvert(data) {
        let newData = [];
        data.forEach(e => {
            e.Convertido = parseFloat(e.FactorConversion) * parseInt(e.N_CajasProducidas_Dia);
            newData.push(e);
        });
        return newData;
    }

    function dayOf(v) {
        const days = ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
        return days[v];
    }