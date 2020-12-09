
// -----------------------------------------------------------------------------
	$(document).on('click', '#btnBalanceMasas', () => {
		let datosTblCajas = hot2.getData();
		let datosTblNacional = hot3.getData();
		let racimosProcesados = hot1.getDataAtRow(9);
		let frutaPiso = hot2.getDataAtRow(hot2.countRows()-8);
		const balanceDeMasas = balanceDias(datosTblCajas, datosTblNacional, racimosProcesados, frutaPiso);
        console.log(balanceDeMasas)
        if (balanceDeMasas.length > 0) {
    		for (let x = 0; x < balanceDeMasas.length; x++) {
    			let element = balanceDeMasas[x];
                console.log(element)
    			if (typeof element === 'object') {
    				hot2.setDataAtCell(hot2.countRows()-7, x+2, element.ratio > 0 ? element.ratio : '', 'edit');
    				hot2.setDataAtCell(hot2.countRows()-6, x+2, element.merma > 0 ? element.merma : '', 'edit');
    				hot2.setDataAtCell(hot2.countRows()-5, x+2, element.pesoRacimos > 0 ? element.pesoRacimos : '', 'edit');
                    hot2.setDataAtCell(hot2.countRows()-3, x+2, element.vastago > 0 ? element.vastago : '', 'edit');
    			} else {
                    hot2.setDataAtCell(hot2.countRows()-7, x+2, '', 'edit');
                    hot2.setDataAtCell(hot2.countRows()-6, x+2, '', 'edit');
                    hot2.setDataAtCell(hot2.countRows()-5, x+2, '', 'edit');
                    hot2.setDataAtCell(hot2.countRows()-3, x+2, '', 'edit');
                }
    		}
        } else {
            for (let x = 3; x < 9; x++) {
                hot2.setDataAtCell(hot2.countRows()-7, x, '', 'edit');
                hot2.setDataAtCell(hot2.countRows()-6, x, '', 'edit');
                hot2.setDataAtCell(hot2.countRows()-5, x, '', 'edit');
                hot2.setDataAtCell(hot2.countRows()-3, x, '', 'edit');
            }
        }
	});

    function createObjectCajas(datos, dia) {
        const result = [];
        datos.forEach( (element, index) => {
            if(element[2] !== null) {
                let elementPush = {
                    cantidad: element[dia],
                    factor: element[2]
                }
                result[index] = elementPush;
            }
        });
        return result;
    }

    function createObjectNacional(datos, dia) {
        const result = [];
        datos.forEach( (element, index) => {
            let peso = 0;
            switch (index) {
                case 0:
                peso = 25;
                break;

                case 1:
                peso = 20;
                break;

                case 2:
                peso = 20;
                break;

                case 3:
                peso = 20;
                break;

                case 4:
                peso = 25;
                break;

                case 5:
                peso = 20;
                break;
            }
            if(element[0] !== 'TOTAL') {
                let elementPush = {
                    'cantidad': element[dia],
                    'peso': peso
                }
                result[index] = elementPush;
            }
        });
        return result;
    }

    function calcularKilos(cajas, nacional) {
        const result = {
            totalKilos: 0,
            total20Kilos: 0,
            totalKilosNacional: 0
        };
        cajas.forEach(element => {
            result.totalKilos += parseFloat( (element.cantidad * element.factor) * 18.69 );
            result.total20Kilos += parseFloat(element.cantidad * element.factor);
        });
        nacional.forEach(element => {
            result.totalKilosNacional += parseFloat(element.cantidad * element.peso);
        });
        return result;
    }

    function generarBalanceMasas(params, racimosProcesados, frutaPiso) {
        const result = {
            ratio: 0,
            merma: 0,
            pesoRacimos: 0,
            vastago: 0,
        }

        result.ratio = parseFloat(params.total20Kilos / racimosProcesados).toFixed(2);
        result.pesoRacimos = parseFloat(parseFloat(params.totalKilos + params.totalKilosNacional + frutaPiso)  / racimosProcesados).toFixed(2);
        result.merma = parseFloat((params.totalKilosNacional + frutaPiso) / (params.totalKilos + params.totalKilosNacional + frutaPiso) * 100).toFixed(2);
        result.vastago = parseFloat(result.pesoRacimos * 0.10).toFixed(2);

        return result;
    }

    function getObjectFinal (tblCajas, tblNacional) {
        const objectCajas = [];
        const objectNacional = [];
        for (let x = 3; x < 10; x++) {
           objectCajas.push(createObjectCajas(tblCajas, x));
           objectNacional.push(createObjectNacional(tblNacional, x-2));
        }
        return {cajas: objectCajas, nacional: objectNacional};
    }

    function getObjectKilos(tblCajas, tblNacional) {
        const objectFinal = getObjectFinal(tblCajas, tblNacional);
        const kilosFinal = [];
        for (let x = 0; x < 7; x++) {
            let kilos = calcularKilos(objectFinal.cajas[x], objectFinal.nacional[x])
            kilosFinal.push(kilos);
        }
        return kilosFinal;
    }

    function balanceDias(cajas, nacional, procesados, piso) {
        const objectKilos = getObjectKilos(cajas, nacional);
        const result = [];
        const racimosProcesados = procesados.slice(1,8);
        const frutaPiso = piso.slice(3,10);
        for(let x = 0; x < racimosProcesados.length; x++) {
            if (racimosProcesados[x] > 0 && objectKilos[x].totalKilos > 0) {
                result[x+1] = generarBalanceMasas(objectKilos[x], racimosProcesados[x], parseInt(frutaPiso[x]));
            }
        }
        return result;
    }

// ------------------------------------------------------------------------------