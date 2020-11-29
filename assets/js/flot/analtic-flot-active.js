(function ($) {
 "use strict";
    fetch('../logica/contenido.php?op=datos_flot')
    .then(response => {return response.json()})
    .then(datos => {
        var fincas = [null, "ALAMOS", "GUAIMARAL", "TAIWAN", "KALAMARI", "ZARZAMORA", "CANDELARIA"];
        var data = [
                [1, 0],
                [2, 0],
                [3, 0],
                [4, 0],
                [5, 0],
                [6, 0]
            ],
            dataset = [{
                data: data,
                label: "Total Cajas",
                bars: {
                    show: !0,
                    barWidth: .5,
                    order: 1,
                    lineWidth: 2,
                    fillColor: "#39A275" // 39A275 , 01689c
                }
            }],
            options = {
                grid: {
                    borderWidth: 1,
                    borderColor: "#f3f3f3",
                    show: !0,
                    hoverable: !0,
                    clickable: !1,
                    labelMargin: 10
                },
                yaxis: {
                    tickColor: "#f3f3f3",
                    tickDecimals: 0,
                    font: {
                        lineHeight: 13,
                        style: "normal",
                        color: "#9f9f9f"
                    },
                    shadowSize: 0
                },
                xaxis: {
                    tickFormatter: function(value, axis) {
                        return fincas[value];
                    },
                    tickColor: "#fff",
                    tickDecimals: 0,
                    font: {
                        lineHeight: 13,
                        style: "normal",
                        color: "#7e7e7e"
                    },
                    shadowSize: 0
                },
                legend: {
                    show: !1
                }
            };
        datos.forEach(element => {
            data[fincas.indexOf(element.Nombre)-1] = [fincas.indexOf(element.Nombre), element.totalElaborado];
        });

        $("#chart-produccion-fincas")[0] && $.plot($("#chart-produccion-fincas"), dataset, options),$(".flot-chart")[0] && ($(".flot-chart").bind("plothover", function(event, pos, item) {
            if (item) {
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);
                $(".flot-tooltip").html(Math.floor(y)).css({
                    top: item.pageY + 5,
                    left: item.pageX + 5
                }).show()
            } else $(".flot-tooltip").hide()
        }), $("<div class='flot-tooltip' class='chart-tooltip'></div>").appendTo("body"))
    })  
})(jQuery); 