function chartHomeUser($, dynamicData) {
 "use strict";

    var dias = [null, 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'];
    var data1 = [
            [1, dynamicData.cajasElaboradasUltimaSemana[0]],
            [2, dynamicData.cajasElaboradasUltimaSemana[1]],
            [3, dynamicData.cajasElaboradasUltimaSemana[2]],
            [4, dynamicData.cajasElaboradasUltimaSemana[3]],
            [5, dynamicData.cajasElaboradasUltimaSemana[4]],
            [6, dynamicData.cajasElaboradasUltimaSemana[5]],
            [7, dynamicData.cajasElaboradasUltimaSemana[6]]
        ],
        data2 = [
            [1, dynamicData.nacionalElaboradasUltimaSemana[0]],
            [2, dynamicData.nacionalElaboradasUltimaSemana[1]],
            [3, dynamicData.nacionalElaboradasUltimaSemana[2]],
            [4, dynamicData.nacionalElaboradasUltimaSemana[3]],
            [5, dynamicData.nacionalElaboradasUltimaSemana[4]],
            [6, dynamicData.nacionalElaboradasUltimaSemana[5]],
            [7, dynamicData.nacionalElaboradasUltimaSemana[6]]
        ],
        barData = [{
            label: "Cajas producción",
            data: data1,
            color: "#194A8D"
        }, {
            label: "Mercado nacional",
            data: data2,
            color: "#ffa502"
        }];
    $("#bar-chart")[0] && $.plot($("#bar-chart"), barData, {
        series: {
            bars: {
                show: !0,
                barWidth: .2,
                order: 1,
                fill: 1
            }
        },
        grid: {
            borderWidth: 1,
            borderColor: "#eee",
            show: !0,
            hoverable: !0,
            clickable: !0
        },
        yaxis: {
            tickColor: "#eee",
            tickDecimals: 0,
            font: {
                lineHeight: 14,
                style: "normal",
                color: "#565656"
            },
            shadowSize: 0
        },
        xaxis: {
            tickFormatter: function(value, axis) {
                return dias[value];
            },
            tickColor: "#fff",
            tickDecimals: 0,
            font: {
                lineHeight: 14,
                style: "normal",
                color: "#565656"
            },
            shadowSize: 0
        },
        legend: {
            container: ".flc-bar",
            backgroundOpacity: .5,
            noColumns: 0,
            backgroundColor: "white",
            lineWidth: 0
        }
    }), $(".flot-chart")[0] && ($(".flot-chart").bind("plothover", function(event, pos, item) {
        if (item) {
            var x = item.datapoint[0],
                y = item.datapoint[1];
            $(".flot-tooltip").html(item.series.label + " = " + y).css({
                top: item.pageY + 5,
                left: item.pageX + 5
            }).show()
        } else $(".flot-tooltip").hide()
    }), $("<div class='flot-tooltip' class='chart-tooltip'></div>").appendTo("body"))
 
} 