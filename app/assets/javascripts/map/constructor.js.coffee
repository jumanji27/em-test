# Асинхронная инициализация карты гугла не очень вписывается в объектную модель кофе.
# Можно придумать инициализатор поумнее
# + очень плохо сочетаются две нотации в описании сущностей lowerCamelCase и under_score
window.map_settings = ->
  mapOptions =
    zoom: 11
    center: new google.maps.LatLng(55.74, 37.61)
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new google.maps.Map(document.getElementById("map"), mapOptions)

  markersForCluster = []
  # Адовый цикл рисует маркеры
  for key of api_data
    marker_settings = api_data[key]
    myLatlng = new google.maps.LatLng(marker_settings.latitude, marker_settings.longitude)
    marker = new google.maps.Marker(
      position: myLatlng
      map: map
      icon: helpers.icon()
    )
    if routes.development
      markerHtml = "<div class='m_marker'><img src='#{marker_settings.photo_url}' alt='Фотография новостройки'>#{marker_settings.name}</div>"
      infowindow = new google.maps.InfoWindow(content: markerHtml)
      # Немного функциональщины от гугла
      google.maps.event.addListener marker, "click", ((marker, infowindow) ->
        ->
          infowindow.open(map, marker)
      )(marker, infowindow)
    markersForCluster.push(marker)

  markerCluster = new MarkerClusterer(map, markersForCluster);

map_constructor = ->
  script = document.createElement("script")
  script.type = "text/javascript"
  script.src = "https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&" + "callback=map_settings"
  document.body.appendChild(script)

helpers =
  icon: ->
    if routes.development
      "/assets/map/development.png"
    else
      "/assets/map/default.png"

window.onload = map_constructor