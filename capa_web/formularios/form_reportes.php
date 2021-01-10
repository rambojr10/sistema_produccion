    <!-- FrmSemanal -->
    <?php if (isset($_GET['frm']) and $_GET['frm'] === 'semanal') : ?>
        <form class="ui form" >
            <div class="field">
                <div class="three fields">
                    <div class="field">
                        <div class="ui labeled mini input">
                            <div class="ui label">Año</div>
                            <input type="text" id="txtAnho" name="txtAnho" class="valida">
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui labeled mini input">
                            <div class="ui label">Desde</div>
                            <select name="cmbDesde" id="cmbDesde">
                                <option>Seleccione</option>
                                <?php include './semanas.php'; ?>
                            </select>
                        </div>
                    </div>
                    <div class="field">
                        <div class="ui labeled mini input">
                            <div class="ui label">Hasta</div>
                            <select name="cmbHasta" id="cmbHasta">
                                <option>Seleccione</option>
                                <?php include './semanas.php'; ?>
                            </select>
                        </div>
                    </div>
                    
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <div class="ui labeled mini input">
                        <div class="ui label">Fincas</div>
                        <select name="cmbFincas" id="cmbFincas">

                        </select>
                    </div>
                </div>
                <div class="field">
                    <div class="ui labeled mini input">
                        <div class="ui label">Tipo fruta</div>
                        <select name="cmbTipoFruta" id="cmbTipoFruta">
                            <option>All...</option>
                        </select>
                    </div>
                </div>
            </div>
        </form>
        <div class="ui labeled input-group input-group-sm mg-b-15">
            <div class="input-group-addon" style="font-weight: 700; font-size: 11px;">Cajas</div>
            <select id="cmbCajas" class="js-example-placeholder-multiple form-control" multiple="multiple">
                
            </select>
        </div>
        <script type="text/javascript">
            $("#cmbCajas").select2();
        </script>
    <?php endif; ?>

    <!-- FrmGeneral -->
    <?php if (isset($_GET['frm']) and $_GET['frm'] === 'general') : ?>
        <p>General</p>
    <?php endif; ?>

    <!-- FrmRechazos -->
    <?php if (isset($_GET['frm']) and $_GET['frm'] === 'rechazos') : ?>
        <p>Rechazos</p>
    <?php endif; ?>

    <!-- FrmNacional -->
    <?php if (isset($_GET['frm']) and $_GET['frm'] === 'nacional') : ?>
        <p>Nacional</p>
    <?php endif; ?>