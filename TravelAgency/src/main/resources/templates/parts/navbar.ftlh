<#include "security.ftlh" >
<#import "loginForms.ftlh" as l>

<nav class="navbar navbar-expand-lg navbar-light bg-light"> <!-- on devices of size lg and larger the menu is expanded -->
  <a class="navbar-brand" href="/">Турагентство</a> 
  <!-- menu button for screens of size less than large -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button> 

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link <#if springMacroRequestContext.requestUri?contains("/trips")>active</#if>" href="/trips">Туры</a>
      </li>
    </ul>
    
    <div class="navbar_text mr-3">
    	${name}
    </div>
    <#if known>
    	<@l.logout />
    <#else>
    	<@l.login_btn />
    </#if>
    
  </div>
</nav>