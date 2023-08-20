<#macro tripEditor isCreateForm>
<form method="post" action="/save-trip">
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">Куда:</label>
		<div class="col-sm-6">
			<input name="destination" type="text" class="form-control" value="<#if trip??>${trip.destination}</#if>"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">Цена (у.е.):</label>
		<div class="col-sm-6">
			<input name="price" type="number" min="0"
				class="form-control" value="<#if trip??>${trip.price?string("0")?replace(" ", "")}</#if>"/>
		</div>
	</div>
	
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">Тип тура:</label> 
		<div class="col-sm-6">
			<select class="form-select" name="tripType">
				<option <#if trip?? && trip.tripType="отдых">selected</#if>>отдых</option>
				<option <#if trip?? && trip.tripType="шоппинг">selected</#if>>шоппинг</option>
				<option <#if trip?? && trip.tripType="экскурсия">selected</#if>>экскурсия</option>
			</select> 
		</div>
	</div>
	
	<div class="form-check mb-2">
		<input type="checkbox" name="hotTour" class="form-check-input" <#if trip?? && trip.hotTour>checked</#if>/>
		<label class="form-check-label" for="isHotTour">Горящий тур</label>
	</div>
	
	<#if trip??>
		<input type="hidden" name="tripId" value="${trip.tripId}" />
	</#if>
	<input type="hidden" name="_csrf" value="${_csrf.token}" />
	
	<button class="btn btn-primary" type="submit" name="save" formaction="/save-trip">
    	<#if isCreateForm>Создать<#else>Сохранить</#if>
    </button>
    
    <#if !isCreateForm>
    <button class="btn btn-primary" type="submit" name="delete" formaction="/delete-trip">
    	Удалить тур
    </button>
    </#if>
</form>
</#macro> 