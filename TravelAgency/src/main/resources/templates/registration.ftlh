<#import "parts/common.ftlh" as c>
<#import "parts/loginForms.ftlh" as l>

<@c.page>
	${message?ifExists}
	<div class="mb-1">
    	Заполните информацию о новом пользователе
    </div>
    <@l.login "/registration" true/>
</@c.page>