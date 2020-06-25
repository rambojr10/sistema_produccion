
    <!-- Insertar racimos -->
    <div class="container">

        <div class="ui green segment">
            <div class="mg-b-15">
                <p>Código de embarque: <span class="badge">EMB-20201</span></p>
            </div>

            <div class="row">
                <!-- col1 -->
                <div class="col-lg-6 col-md-6">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Información de envío</h4>
                        <div class="three fields text-center">
                            <div class="field">
                                <label for="semana">Semana</label>
                                <input type="text" name="semana" value="Semana 1" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="from">Desde</label>
                                <input type="text" name="from" value="12/06/2020" class="text-center" disabled>
                            </div>
                            <div class="field">
                                <label for="to">Hasta</label>
                                <input type="text" name="to" value="18/06/2020" class="text-center" disabled>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- col 2 -->
                <div class="col-lg-6 col-md-6">
                    <form class="ui small form">
                        <h4 class="ui dividing header">Embolse</h4>
                        <div class="two fields">
                            <div class="field">
                                <div class="panel embolseOrange">
                                    <label style="padding-left: 5px;">Presente</label>
                                    <input type="text" class="form-control" value="3851">
                                </div>
                            </div>
                            <div class="field">
                                <div class="panel embolseGreen">
                                    <label style="padding-left: 5px;">Prematuro</label>
                                    <input type="text" class="form-control" value="3851">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
        
    </div>

    <div class="breadcomb-area">
        <div style="margin: 25px;">
            <div id="tblRacimos_ip"></div>
        </div>
    </div>

    <script src="../logica/js/racimos_ip.js"></script>

    