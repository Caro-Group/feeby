{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApFullSlider -->
{if isset($formAtts.title) && $formAtts.title}
	<h4 class="title_block">{$formAtts.title|escape:'html':'UTF-8'}</h4>
{/if}
{if isset($formAtts.sub_title) && $formAtts.sub_title}
    <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
{/if}
{if $formAtts.slides}
{assign var=slides_count value=$formAtts.slides|@count} 
<div id="{$formAtts.form_id|escape:'html':'UTF-8'}" class="block carousel slide full-slider {(isset($formAtts.class)) ? $formAtts.class : ''|escape:'html':'UTF-8'}"
     data-ride="carousel"
	 style="width:{if $formAtts.width}{$formAtts.width|escape:'html':'UTF-8'}{else}100%{/if};
	 height:{if $formAtts.height}{$formAtts.height|escape:'html':'UTF-8'}{else}400px{/if};">
	{($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
	<ol class="carousel-indicators {if (isset($formAtts.display_indicators)
		&& $formAtts.display_indicators == 0) || $slides_count <= 1}hide{/if}">
		{assign var="count" value="0"}
		{foreach $formAtts.slides as $slide}
		<li {if $count == 0}class="active"{/if} data-slide-to="{$count|intval}" data-target="#{$formAtts.form_id|escape:'html':'UTF-8'}"></li>
		{$count = $count + 1}
		{/foreach}
	</ol>
	<div role="listbox" class="carousel-inner">
		{assign var="count" value="0"}
		{foreach $formAtts.slides as $slide}
		<div class="carousel-item {if $count == 0}active{/if}">
			{if $slide['img']}
			<img {if $aplazyload}class="lazy" data-src{else}src{/if}="{$slide['img']}{*full link can not validate*}" alt="{$slide['title'] nofilter}{* HTML form , no escape necessary *}"/>
			{else}
				{if isset($slide['image_link']) && $slide['image_link']}
				<img {if $aplazyload}class="lazy" data-src{else}src{/if}="{$slide['image_link']}{*full link can not validate*}" alt="{$slide['title'] nofilter}{* HTML form , no escape necessary *}"/>
				{/if}
			{/if}
			<div class="content-slider">{$slide['descript']}</div>
			{if (isset($formAtts.display_title) && $formAtts.display_title) || !isset($formAtts.display_title)}
			<div class="carousel-caption">
				{if $slide['link']}
				<a href="{$slide['link']}" {if isset($formAtts.is_open) && $formAtts.is_open}target="_blank"{/if}>
				{/if}
				<h3>{$slide['title'] nofilter}{* HTML form , no escape necessary *}</h3>
				{if $slide['link']}
				</a>
				{/if}
			</div>
			{/if}
		</div>
		{$count = $count + 1}
		{/foreach}
	</div>
	<a data-slide="prev" role="button" href="#{$formAtts.form_id|escape:'html':'UTF-8'}" class="left carousel-control">
		<span aria-hidden="true" class="glyphicon glyphicon-chevron-left">‹</span>
		<span class="sr-only">Previous</span>
	</a>
	<a data-slide="next" role="button" href="#{$formAtts.form_id|escape:'html':'UTF-8'}" class="right carousel-control">
		<span aria-hidden="true" class="glyphicon glyphicon-chevron-right">›</span>
		<span class="sr-only">Next</span>
	</a>
	{($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
</div>
{/if}
