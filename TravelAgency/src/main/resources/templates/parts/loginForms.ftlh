<#macro login path isRegisterForm>
<form action="${path}" method="post">
<div class="form-group row">
	<label class="col-sm-2 col-form-label">Имя пользователя:</label>
	<div class="col-sm-6">
		<input type="text" name="username" class="form-control" placeholder="Имя пользователя" /> 
	</div>
</div>

<div class="form-group row">
    <label class="col-sm-2 col-form-label">Пароль:</label>
    <div class="col-sm-6">
    	<input type="password" name="password" class="form-control"  placeholder="Пароль" /> 
    </div>
</div>
    	
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <#if !isRegisterForm>
    	<div><a href="/registration">Зарегистрироваться на сайте</a></div>
    </#if>
    <button class="btn btn-primary" type="submit">
    	<#if isRegisterForm>Создать<#else>Войти</#if>
    </button>
</form>
</#macro>

<#macro logout>
<form method="post" action="/logout">
	<input type="hidden" name="_csrf" value="${_csrf.token}" />
	<button class="btn btn-primary" type="submit">
    	Выйти
    </button>
</form>
</#macro>

<#macro login_btn>
<form method="post" action="/login">
	<input type="hidden" name="_csrf" value="${_csrf.token}" />
	<button class="btn btn-primary" type="submit">
    	Войти
    </button>
</form>
</#macro>
