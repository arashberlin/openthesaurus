<!doctype html>
<%@page import="com.vionto.vithesaurus.*" %>
<g:javascript library="prototype" />
<html>
<head>
  <title><g:message code="homepage.title"/></title>
  <meta name="layout" content="homepage" />
  <link rel="image_src" href="${createLinkTo(dir:'images',file:'screenshot_homepage_300px.png')}" />
  <script type="text/javascript" src="${createLinkTo(dir:'js/prototype',file:'prototype.js?20130609')}"></script>
  <script type="text/javascript">
  <!--
      var onChangeInterval = null;
      var deferRequestMillis = 200;
      var minChars = 2;
      var currentValue = null;

      function doSearchOnKeyUp(event) {
          switch (event.keyCode) {
              case Event.KEY_UP:
              case Event.KEY_DOWN:
              case Event.KEY_RIGHT:
              case Event.KEY_LEFT:
                  return;
          }
          clearInterval(onChangeInterval);
          var searchString = document.searchform.q.value;
          if (currentValue != searchString) {
              onChangeInterval = setInterval("onValueChange()", deferRequestMillis);
          }
      }

      var lastUpdateTimeStamp = 0;

      function onValueChange() {
          clearInterval(onChangeInterval);
          var searchString = document.searchform.q.value;
          currentValue = searchString;
          if (searchString === '' || searchString.length < minChars) {
              $('searchResultArea').update("");
          } else {
              cursorPosition = -1;
              var timeStamp = new Date().getTime();
              loadSearch();
              new Ajax.Request(
                '${createLinkTo(dir:"ajaxSearch/ajaxMainSearch",file:"")}',
                {
                 asynchronous: true,
                 evalScripts: false,
                 onSuccess: function(response){
                     if (timeStamp < lastUpdateTimeStamp) {
                         //console.warn("Ignoring outdated update: " + timeStamp + " < " + lastUpdateTimeStamp);
                     } else {
                         $('searchResultArea').update(response.responseText)
                         lastUpdateTimeStamp = timeStamp;
                     }
                 },
                 onFailure: function(response){$('searchResultArea').update(response.responseText)},
                 onComplete: function(e){loadedSearch()},
                 parameters:'q=' + searchString + "&home=true"
                }
              );
          }
      }

      function loadSearch() {
          document.getElementById('spinner').style.position='absolute';
          document.getElementById('spinner').style.visibility='visible';
      }

      function loadedSearch() {
          document.getElementById('spinner').style.visibility='hidden';
      }

  // -->
  </script>
</head>
<body>

  <div id="body" style="padding:80px 0 50px 0;">

    <div id="content">

      <g:render template="/searchform" model="${[homepage: true, isDirectSearch:true]}"/>

      <g:render template="/loggedin"/>
      <g:if test="${session.user}">
          <hr/>
      </g:if>

      <g:if test="${flash.message}">
          <div class="message">${flash.message}</div>
      </g:if>

      <div id="searchResultArea" style="margin-top:10px;min-height:150px"></div>

    </div>

  </div>

  <g:render template="/footer" model="${[homepage:true]}"/>

</body>
</html>
