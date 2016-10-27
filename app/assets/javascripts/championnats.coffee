# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

  if $('#match_per_league').data('series')?

    $('#match_per_league').highcharts
      chart:
        plotBackgroundColor: null
        plotBorderWidth: null
        plotShadow: false
        type: 'pie'
      title: text: 'Répartition des matchs par championnat'
      tooltip: pointFormat: '{series.name}: <b>{point.percentage:.1f}</b>'
      plotOptions: pie:
        allowPointSelect: true
        cursor: 'pointer'
        dataLabels:
          enabled: true
          format: '<b>{point.name}</b>: {point.percentage:.1f} %'
          style: color: Highcharts.theme and Highcharts.theme.contrastTextColor or 'black'
      series: [ {
        name: 'Championnats'
        colorByPoint: true
        data: $('#match_per_league').data('series')
      } ]


  if $('#total_winners').data('series') and $('#total_winners').data('series').categories? and $('#total_winners').data('series').series?
    $('#total_winners').highcharts
      chart: type: 'bar'
      title: text: 'Classement des meilleurs équipes'
      xAxis:
        categories: $('#total_winners').data('series').categories
        title: text: null
      yAxis:
        min: 0
        title:
          text: 'Nombre de victoires'
          align: 'high'
        labels: overflow: 'justify'
      tooltip: valueSuffix: ' victoires'
      plotOptions: bar: dataLabels: enabled: true
      legend:
        layout: 'vertical'
        align: 'right'
        verticalAlign: 'top'
        x: -40
        y: 80
        floating: false
        borderWidth: 1
        backgroundColor: Highcharts.theme and Highcharts.theme.legendBackgroundColor or '#FFFFFF'
        shadow: true
      credits: enabled: false
      series: $('#total_winners').data('series').series

  return

$(document).ready(ready)
$(document).on("turbolinks:load", ready)
