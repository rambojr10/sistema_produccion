(function ($) {
 "use strict";
    fetch('../logica/contenido.php?op=datos_flot')
    .then(response => {return response.json()})
    .then(datos => {
        var fincas = [null, "ÁLAMOS", "GUAIMARAL", "TAIWÁN", "KALAMARÍ", "ZARZAMORA", "CANDELARIA"];
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
                    barWidth: .4,
                    order: 1,
                    lineWidth: 0,
                    fillColor: "#00c292"
                }
            }],
            options = {
                grid: {
                    borderWidth: 1,
                    borderColor: "#f3f3f3",
                    show: !0,
                    hoverable: !0,
                    clickable: !0,
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

        $("#visit-server-time")[0] && $.plot($("#visit-server-time"), dataset, options),$(".flot-chart")[0] && ($(".flot-chart").bind("plothover", function(event, pos, item) {
            if (item) {
                var x = item.datapoint[0].toFixed(2),
                    y = item.datapoint[1].toFixed(2);
                $(".flot-tooltip").html(Math.floor(y)).css({
                    top: item.pageY + 5,
                    left: item.pageX + 5
                }).show()
            } else $(".flot-tooltip").hide()
        }), $("<div class='flot-tooltip' class='chart-tooltip'></div>").appendTo("body"))
        
        
        function getRandomData() {
            for (data.length > 0 && (data = data.slice(1)); data.length < totalPoints;) {
                var prev = data.length > 0 ? data[data.length - 1] : 50,
                    y = prev + 10 * Math.random() - 5;
                0 > y ? y = 0 : y > 90 && (y = 90), data.push(y)
            }
            for (var res = [], i = 0; i < data.length; ++i) res.push([i, data[i]]);
            return res
        }

        function update() {
            plot.setData([getRandomData()]), plot.draw(), setTimeout(update, updateInterval)
        }
        var data = [],
            totalPoints = 300,
            updateInterval = 30;
        if ($("#dynamic-chart")[0]) {
            var plot = $.plot("#dynamic-chart", [getRandomData()], {
                series: {
                    label: "Server Process Data",
                    lines: {
                        show: !0,
                        lineWidth: .2,
                        fill: .6
                    },
                    color: "#00c292",
                    shadowSize: 0
                },
                yaxis: {
                    min: 0,
                    max: 100,
                    tickColor: "#eee",
                    font: {
                        lineHeight: 13,
                        style: "normal",
                        color: "#9f9f9f"
                    },
                    shadowSize: 0
                },
                xaxis: {
                    tickColor: "#eee",
                    show: !0,
                    font: {
                        lineHeight: 13,
                        style: "normal",
                        color: "#9f9f9f"
                    },
                    shadowSize: 0,
                    min: 0,
                    max: 250
                },
                grid: {
                    borderWidth: 1,
                    borderColor: "#eee",
                    labelMargin: 10,
                    hoverable: !0,
                    clickable: !0,
                    mouseActiveRadius: 6
                },
                legend: {
                    show: !1
                }
            });
            update()
        }
    })  
})(jQuery); 