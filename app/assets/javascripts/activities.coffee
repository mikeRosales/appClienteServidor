# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->

    responsables = $('#activity_responsibles').html()
    $('#activity_project_id').change ->
        projecto = $('#activity_project_id :selected').text()
        options=  $(responsables).filter("optgroup[label='#{projecto}']").html()
        if options
            $('#activity_responsibles').html(options)
            $('#activity_responsibles').parent().show()
        else
             $('#activity_responsibles').empty()
             $('#activity_responsibles').parent().hide()