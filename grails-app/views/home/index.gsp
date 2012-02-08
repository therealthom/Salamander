
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Proyecto Salamander</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.min.css')}" type="text/css">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
           
    </style>
    
    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
    
    <script type="text/javascript" src="/salamander/static/plugins/jquery-1.7.1/js/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    
    
    <script type="text/javascript">
      /*function foundLocation(position) {
        var jsonPos = JSON.stringify(position);
        jQuery.ajax({
          type:'POST',
          data:'val=' + jsonPos, 
          url:'/salamander/geolocation/setGeoPosition',
          success: function (data,textStatus) {
            miUbicacion(data);
          },
          error: function (XMLHttpRequest,textStatus,errorThrown){}
        });
      }      
      
      function miUbicacion(data) {        
        var latlng = new google.maps.LatLng(data.coords.latitude, data.coords.longitude);
        alert(latlng)
      }*/
      var geocoder;
      
      jQuery(document).ready(function() {
        jQuery("#btnGeo").click(function() {
          geocoder = new google.maps.Geocoder();
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition( 
		function (position) {  
                  // Did we get the position correctly?
                  //alert ("latitude: "+position.coords.latitude + ", longitude: " + position.coords.longitude);
                  // To see everything available in the position.coords array:
                  //for (key in position.coords) {alert(key)} 
                  // Show map
                  //mapServiceProvider(position.coords.latitude, position.coords.longitude);
                  var latlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
                  geocoder.geocode({'latLng': latlng}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                      if (results[1]) {                        
                        jQuery("#myAddress").html(results[1].formatted_address);
                      }
                    } else {
                      alert("Geocoder failed due to: " + status);
                    }
                  });
                }, 
		// next function is the error callback
		function (error) {
                  switch(error.code) {
                    case error.TIMEOUT:
                      alert ('Timeout');
                      break;
                    case error.POSITION_UNAVAILABLE:
                      alert ('Position unavailable');
                      break;
                    case error.PERMISSION_DENIED:
                      alert ('Permission denied');
                      break;
                    case error.UNKNOWN_ERROR:
                      alert ('Unknown error');
                      break;
                  }
		}
            );
          }
        });
      });
      
      function mapServiceProvider(latitude,longitude) {
        mapThisGoogle(latitude,longitude);
      }
      
      function mapThisGoogle(latitude,longitude) {
        var latlng = new google.maps.LatLng(latitude, longitude);
        var myOptions = {
          zoom: 13,
          center: latlng,
          mapTypeControl: false,
          navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        
        var divMap = document.getElementById("map");        
        var map = new google.maps.Map(divMap, myOptions);
        
        var marker = new google.maps.Marker({
            position: latlng, 
            map: map, 
            title:"¡Aquí estás!"
        });
      }
    </script>
    
  </head>

  <body>
    
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Proyecto Salamander</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li class="active"><a href="#">Inicio</a></li>
              <li><a href="#about">Acerca de</a></li>
              <li><a href="#contact">Contacto</a></li>
            </ul>
          </div><!--/.nav-collapse -->
          <form action="" class="navbar-form pull-right">
            <input class="input-small" type="text" placeholder="Usuario">
            <input class="input-small" type="password" placeholder="Contrase&ntilde;a">
            <button class="btn" type="submit">Ingresar</button>
          </form>
        </div>
      </div>
    </div>

    <div class="container">
      
      <br/><br/><br/><br/><br/><br/>
      <div class="row">        
        <div class="span4 offset4" style="text-align:center" id="map" name="map">
            <img alt="Salamander" src="${resource(dir: 'images', file: 'salamander.jpeg')}" width="200px" height="100px"/>
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <g:form name="form-search" action="">
          <div class="row">
            <div class="span12" style="text-align:center">
                <a class="btn btn-small btn-info" href="#" name="btnGeo" id="btnGeo">
                  <i class="icon-screenshot icon-white"></i>
                  Mi Ubicación
                </a>  
                <g:textField class="input-large search-query span4" name="txtSearch" placeholder="¿Qué necesitas?" />                                                
            </div>        
          </div>

          <div class="row ">
            &nbsp;
          </div>

          <div class="row ">
            <div class="span12" style="text-align:center">
              <g:submitButton class="btn-primary span2" name="btnSearch" value="Buscar"/>
            </div>
          </div>

        </g:form>
      </div>
      <div class="row">
        <div id="myAddress" style="text-align: center"></div>
      </div>
    </div> <!-- /container -->

  </body>
</html>
