class window.MapIndex
  constructor: ->
    ROOT = "#/sale"

    type_buttons = $(".js__controls")

    window.api_data = undefined

    window.location.hash = ROOT
    window.routes = {}
    @routes()

    $(window).on( "hashchange", => @routes() )

    $(".js__controls[href='#{ROOT}']").addClass("js__controls_active")
    type_buttons.on("click", ->
      type_buttons.removeClass("js__controls_active")
      $(@).addClass("js__controls_active")
    )

  # Мусорный запрос, при первой загрузке (если последний адрес отличался от рута) —
  # следствие совсем казуального роутинга на хэшах. Если нужно, решается счетчиком у routes()
  routes: ->
    @request_data(window.location.hash)
    if window.location.hash == "#/development"
      routes.development = true
    else
      routes.development = false

  request_data: (hash) ->
    hash = hash.replace("#/", "")
    $.ajax(
      type: "GET"
      dataType: "json"
      url: "/api/v1/" + hash
      success: (data) ->
        window.api_data = data
        map_settings()
    )

