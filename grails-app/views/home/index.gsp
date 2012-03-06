
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="layout" content="bootstrap"/>
    <meta charset="utf-8">
    <title>Proyecto Salamander</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le HTML5 shim, for IE6-8 support of HTML elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le styles -->
    
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
    <script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
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
      var myPosition;
      var myAddress;
      jQuery(document).ready(function() {
        
        jQuery('#showMyAddress').click(function() {
            mapServiceProvider(myPosition.coords.latitude, myPosition.coords.longitude);
            jQuery("#myAddress").html(myAddress);
        });
        
        //Código para geolocalizacion
        jQuery("#btnGeo").click(function() {          
          geocoder = new google.maps.Geocoder();
          if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition( 
		function (position) {  
                  myPosition = position;
                  var latlng = new google.maps.LatLng(myPosition.coords.latitude, myPosition.coords.longitude);
                  geocoder.geocode({'latLng': latlng}, function(results, status) {
                    if (status == google.maps.GeocoderStatus.OK) {
                      if (results[1]) {    
                        myAddress = results[1].formatted_address;
                        jQuery("#showMyAddress").html(myAddress);
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
            title:"¡Aquí!"
        });
      }
    </script>
    
  </head>

  <body>        
      <br/><br/><br/>
      <g:if test="${flash.message}">
        <g:if test="${warning}">
          <div class="alert">
            <a class="close" data-dismiss='alert'>×</a>
            <strong>Warning!</strong> ${flash.message}
          </div>
        </g:if>
        <g:else>
          <div class="alert alert-success">
            <a class="close" data-dismiss='alert'>×</a>
            <strong>Success!</strong> ${flash.message}
          </div>
        </g:else>
      </g:if>
      <br/><br/><br/>
      <br/><br/><br/>
      <div class="row">        
        <div class="span4 offset4" style="text-align:center">
            <img alt="Salamander" src="${resource(dir: 'images', file: 'salamander.jpeg')}" width="200px" height="100px"/>
        </div>
      </div>
      <div class="row">&nbsp;</div>
      <div class="row">
        <g:form name="form-search" action="">
          <div class="row">
            <div class="span12" style="text-align:center">
              <sec:ifLoggedIn>
                <a class="btn btn-small btn-info" href="#" name="btnGeo" id="btnGeo">
                  <i class="icon-map-marker icon-white"></i>
                  Mi Ubicación
                </a>  
              </sec:ifLoggedIn>
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
        <div class="span12" style="text-align:center">
          <a data-toggle="modal" href="#myModal" id="showMyAddress"></a>
        </div>        
      </div>
      
      <!-- Modal que muestra la ubicacion detectada en el mapa -->
      <div id="myModal" class="modal hide fade" style="display: none;">
        <div class="modal-header">
          <a class="close" data-dismiss="modal">×</a>
          <h3>¿En dónde estoy?</h3>
        </div>
        <div class="modal-body">
          <div class="hero-unit-mod" id="map">
            &nbsp;
          </div>
        </div>
        <div class="modal-footer" id="myAddress" style="text-align: center"></div>
      </div>
      <!-- Fin del modal -->
    
  </body>
</html>
