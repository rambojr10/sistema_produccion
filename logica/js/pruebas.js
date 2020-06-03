 	var codigo1;
    const buscar_ibmfinca_pe_async2 = async (nombre_finca) => {
        var codigo;
        try {
            const response = await fetch(`../logica/contenido.php?op=buscarfinca&nombre_finca=${nombre_finca}`);
            const res = await response.text();
            codigo1 = res;
        } catch (error) {
            console.log(error);
        }
        return codigo;
    }

    buscar_ibmfinca_pe_async2("zarzamora");
