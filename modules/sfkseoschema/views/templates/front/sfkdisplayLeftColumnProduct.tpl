{*
* This module helps to build relationship with customers,provide personalized service and increase in sales.
*
* NOTICE OF LICENSE
* 
* Each copy of the software must be used for only one production website, it may be used on additional
* test servers. You are not permitted to make copies of the software without first purchasing the
* appropriate additional licenses. This license does not grant any reseller privileges.
* 
* @author    Shahab
* @copyright 2007-2021 Shahab-FK Enterprises
* @license   Prestashop Commercial Module License
*}



{if $SFK_STAR_COUNT >0  &&  $SFK_LIST_FLAG != '1' }

{if $PS_FLAG =="PS17"}
<br/>
{/if}

<table border="0">
	<tr>
		<td align="center"> <h4>{$SFK_STAR_LABEL|escape:'htmlall':'UTF-8'}  </h4> </td>
		<td align="center" style="padding-bottom: 10px;"> 

{if $SFK_STAR_COUNT >=1 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 2 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 3 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 4 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 5 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

</td>
	<td align="center"> <h4>({$SFK_RATING_COUNT|escape:'htmlall':'UTF-8'})</h4> </td>
	</tr>	
</table>


{/if}


{if $SFK_STAR_COUNT >0  &&  $SFK_LIST_FLAG == '3' }

<table border="0" style="padding-bottom: 10px;">
	<tr>
	<td align="center" style="padding-bottom:10px;padding-left:70px;"> 

{if $SFK_STAR_COUNT >=1 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 2 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 3 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 4 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

{if $SFK_STAR_COUNT >= 5 }
	<span class="fa fa-star checked"></span> {else} <span class="fa fa-star"></span>
{/if}

</td>
	<td align="center"> <h4>({$SFK_RATING_COUNT|escape:'htmlall':'UTF-8'})</h4> </td>
	</tr>	
</table>


{/if}
