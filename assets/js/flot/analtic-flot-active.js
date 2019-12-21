(function ($) {
 "use strict";
    var fincas = [null, "Álamos", "Guaimaral", "Taiwán", "Kalamarí", "Zarzamora", "Candelaria"];
    var data = [
            [1, 27969],
            [2, 34905],
            [3, 34490],
            [4, 23627],
            [5, 19045],
            [6, 16701]
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


	
    function gd(year, month, day) {
        return new Date(year, month - 1, day).getTime()
    }
    var data1 = [
            [gd(2019, 12, 9), 10593],
            [gd(2019, 12, 10), 8760],
            [gd(2019, 12, 11), 3490],
            [gd(2019, 12, 12), 9789],
            [gd(2019, 12, 13), 12756],
            [gd(2019, 12, 14), 3650],
            [gd(2019, 12, 15), 0]
        ],
        data2 = [
            [gd(2019, 12, 9), 9373],
            [gd(2019, 12, 10), 8892],
            [gd(2019, 12, 11), 3140],
            [gd(2019, 12, 12), 9491],
            [gd(2019, 12, 13), 13584],
            [gd(2019, 12, 14), 3438],
            [gd(2019, 12, 15), 0]
        ],
        dataset = [{
            label: "Semana 50",
            data: data1,
            color: "#00c292",
            points: {
                fillColor: "#00c292",
                show: !0,
                radius: 2
            },
            lines: {
                show: !0,
                lineWidth: 1
            }
        }, {
            label: "Semana 49",
            data: data2,
            xaxis: 2,
            color: "#03A9F4",
            points: {
                fillColor: "#03A9F4",
                show: !0,
                radius: 2
            },
            lines: {
                show: !0,
                lineWidth: 1
            }
        }],
        dayOfWeek = ["Lun", "Mar", "Mie", "Jue", "Vie", "Sab", "Dom"],
        options = {
            series: {
                shadowSize: 0
            },
            grid: {
                borderWidth: 1,
                borderColor: "#f3f3f3",
                show: !0,
                clickable: !0,
                hoverable: !0,
                mouseActiveRadius: 20,
                labelMargin: 10
            },
            xaxes: [{
                color: "#f3f3f3",
                mode: "time",
                tickFormatter: function(val, axis) {
                    return dayOfWeek[new Date(val).getDay()]
                },
                position: "top",
                font: {
                    lineHeight: 13,
                    style: "normal",
                    color: "#9f9f9f"
                }
            }, {
                color: "#f3f3f3",
                mode: "time",
                timeformat: "%d/%m",
                font: {
                    lineHeight: 13,
                    style: "normal",
                    color: "#9f9f9f"
                }
            }],
            yaxis: {
                ticks: 2,
                color: "#f3f3f3",
                tickDecimals: 0,
                font: {
                    lineHeight: 13,
                    style: "normal",
                    color: "#9f9f9f"
                }
            },
            legend: {
                container: ".flc-visits",
                backgroundOpacity: .5,
                noColumns: 0,
                font: {
                    lineHeight: 13,
                    style: "normal",
                    color: "#9f9f9f"
                }
            }
        };
    $("#visit-over-time")[0] && $.plot($("#visit-over-time"), dataset, options)

})(jQuery); 