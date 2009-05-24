<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link type="text/css" rel="stylesheet" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body>
    
        <noscript>
	        <div class="nojs">
	           Note: You need to enable Javascript in order to be able to edit the thesaurus
	        </div>
        </noscript>
        
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>
        
        <div class="logo"><a href="${createLinkTo(dir:'',file:'')}"><img
        	src="${createLinkTo(dir:'images',file:'openthesaurus-logo.png')}" 
        	alt="OpenThesaurus Logo" /></a></div>
        	
        <g:render template="/searchform"/>

       	<g:layoutBody />

    </body>	
</html>