$(function(){var l=!0;$(".panel-title > a").click(function(l){l.preventDefault()}),$(".collapse-init").on("click",function(){l?(l=!1,$(".panel-collapse").collapse("show"),$(".panel-title > a").attr("data-toggle",""),$(this).html("Click to Close all")):(l=!0,$(".panel-title > a").attr("data-toggle","collapse"),$(".panel-collapse").collapse("hide"),$(this).html("Click to Open all"))})});