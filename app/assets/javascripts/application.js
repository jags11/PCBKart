// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require_tree .

$(function() {
    $("select#order_layer_id").on("change", function() {
        $.ajax({
            url:  "/filter_thicknesses_by_layer",
            type: "GET",
            data: { selected_layer: $("select#order_layer_id").val() }
        });
    });
});

$(function() {
    $("select#order_layerthickness_id").on("change", function() {
        $.ajax({
            url:  "/calculate_order",
            type: "POST",
            data: { selected_layerthickness_id: $("select#order_layerthickness_id").val() ,
                    quantity: parseInt($( "#order_quantity" ).val()),
                    board_size_x: $("#order_board_size_x").val(),
                    board_size_y: $("#order_board_size_y").val()}
        });
    });
});

$(function() {
    $("select#order_quantity").on("change", function() {
        $.ajax({
            url:  "/calculate_order",
            type: "POST",
            data: { selected_layerthickness_id: $("select#order_layerthickness_id").val() ,
                quantity: parseInt($( "#order_quantity" ).val()),
                board_size_x: $("#order_board_size_x").val(),
                board_size_y: $("#order_board_size_y").val()}
        });
    });
});

$(function() {
    $("select#order_board_size_x").on("change", function() {
        $.ajax({
            url:  "/calculate_order",
            type: "POST",
            data: { selected_layerthickness_id: $("select#order_layerthickness_id").val() ,
                quantity: parseInt($( "#order_quantity" ).val()),
                board_size_x: $("#order_board_size_x").val(),
                board_size_y: $("#order_board_size_y").val()}
        });
    });
});

$(function() {
    $("select#order_board_size_y").on("change", function() {
        $.ajax({
            url:  "/calculate_order",
            type: "POST",
            data: { selected_layerthickness_id: $("select#order_layerthickness_id").val() ,
                quantity: parseInt($( "#order_quantity" ).val()),
                board_size_x: $("#order_board_size_x").val(),
                board_size_y: $("#order_board_size_y").val()}
        });
    });
});


