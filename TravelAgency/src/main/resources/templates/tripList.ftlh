<#import "parts/common.ftlh" as c>
<#include "parts/security.ftlh">

<@c.page>
<h1>Список доступных туров</h1>
<form action="trips" method="GET" class="mb-3">
<div class="form-group row">
	<label class="col-sm-2 col-form-label">Выберите тип тура:</label> 
	<select class="form-select" name="tripType">
		<option <#if !tripType??>selected</#if> value="">любой</option>
		<option <#if tripType?? && tripType="отдых">selected</#if>>отдых</option>
		<option <#if tripType?? && tripType="шоппинг">selected</#if>>шоппинг</option>
		<option <#if tripType?? && tripType="экскурсия">selected</#if>>экскурсия</option>
	</select> 
</div>
<div class="form-check mb-2">
	<input type="checkbox" name="isHotTour" class="form-check-input" <#if isHotTour?? && isHotTour="on" >checked</#if> />
	<label class="form-check-label" for="isHotTour">Только горящие туры</label>
</div>
	<button class="btn btn-primary" type="submit">
    	Показать
    </button>
    <button class="btn btn-primary" type="submit" formaction="/all-trips" > 
    	Показать все
    </button>
</form>

<#if isAdmin>
<form method="get" action="/create-trip" class="mb-3">
	<button  class="btn btn-primary">
    	Добавить тур
    </button>
</form>
</#if>

<div class="card-columns">
<#list trips as trip>
<div class="card" >
	<#if trip.isHotTour()>
		<div class="card-header">Горящий тур!!!</div>
	</#if>
	<div class="card-body">
		<h5 class="card-title">${trip.destination}</h5>
		<h6 class="card-subtitle mb-2 text-muted">${trip.tripType}</h6>
		<i class="card-text">${trip.price} у.е.</i>
		<#if isUser>
			<div><a href="/create-order/${trip.tripId}" class="card-link">Оформить заказ</a></div>
		</#if>
		<#if isAdmin>
			<div><a href="/edit-trip/${trip.tripId}" class="card-link">Редактировать</a></div>
		</#if>
	</div>
</div>
</#list>
</div>

<#--<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Куда</th>
			<th>Тип тура</th>
			<th>Цена</th>
			<th>Горящий тур</th>
		</tr>
	</thead>
	<tbody>
	<#list trips as trip>
		<tr>
			<td>${trip.tripId}</td>
			<td>${trip.destination}</td>
			<td>${trip.tripType}</td>
			<td>${trip.price}</td>
			<td>${trip.hotTour?string("Горящий тур", "")}</td>
		</tr>
	</#list>
	</tbody>
</table>-->

</@c.page>