{* 
* @Module Name: Leo Blog
* @Website: leotheme.com.com - prestashop template provider
* @author Leotheme <leotheme@gmail.com>
* @copyright  Leotheme
* @description: Content Management
*}

{if isset($no_follow) AND $no_follow}
	{assign var='no_follow_text' value='rel="nofollow"'}
{else}
	{assign var='no_follow_text' value=''}
{/if}

{if isset($p) AND $p}	
	{if ($n*$p) < $nb_items }
		{assign var='blogShowing' value=$n*$p}
	{else}
		{assign var='blogShowing' value=($n*$p-$nb_items-$n*$p)*-1}
	{/if}
	{if $p==1}
		{assign var='blogShowingStart' value=1}
	{else}
		{assign var='blogShowingStart' value=$n*$p-$n+1}
	{/if}
        
	<nav class="pagination">
		{if $start!=$stop}
			<div id="pagination{if isset($paginationId)}_{$paginationId|escape:'html':'UTF-8'}{/if}">			
				<ul class="flex flex-row">
					{if $p != 1}
						{assign var='p_previous' value=$p-1}
						<li id="pagination_previous{if isset($paginationId)}_{$paginationId|escape:'html':'UTF-8'}{/if}" class="mr-2">							
							<a {$no_follow_text|escape:'html':'UTF-8'} class="previous text-inherit p-1 mx-2.5" rel="prev" href="{$link->goPage($requestPage, $p_previous)|escape:'html':'UTF-8'}">
								<i class="material-icons">&#xE314;</i>
								<span>{l s='Previous' mod='leoblog'}</span>
							</a>
						</li>
					{else}
						<li id="pagination_previous{if isset($paginationId)}_{$paginationId|escape:'html':'UTF-8'}{/if}" class="mr-2">							
							<a class="previous disabled text-inherit p-1 mx-2.5" rel="prev" href="#">
								<i class="material-icons">&#xE314;</i>
								<span>{l s='Previous' mod='leoblog'}</span>
							</a>
						</li>
					{/if}
					{if $start==3}
						<li class="mr-2"><a {$no_follow_text|escape:'html':'UTF-8'}  href="{$link->goPage($requestPage, 1)|escape:'html':'UTF-8'}" class="text-inherit p-1 mx-2.5">1</a></li>
						<li class="mr-2"><a {$no_follow_text|escape:'html':'UTF-8'}  href="{$link->goPage($requestPage, 2)|escape:'html':'UTF-8'}" class="text-inherit p-1 mx-2.5">2</a></li>
					{/if}
					{if $start==2}
						<li class="mr-2"><a {$no_follow_text|escape:'html':'UTF-8'}  href="{$link->goPage($requestPage, 1)|escape:'html':'UTF-8'}" class="text-inherit p-1 mx-2.5">1</a></li>
					{/if}
					{if $start>3}
						<li class="mr-2"><a {$no_follow_text|escape:'html':'UTF-8'}  href="{$link->goPage($requestPage, 1)|escape:'html':'UTF-8'}" class="text-inherit p-1 mx-2.5">1</a></li>
						<li class="truncate mr-2">...</li>
					{/if}
					{section name=pagination start=$start loop=$stop+1 step=1}
						{if $p == $smarty.section.pagination.index}
							<li class="current after:-ml-4 after:absolute after:bg-main after:block after:-bottom-2 after:content-[''] after:h-1 after:left-1/2 after:rounded-full after:w-8 js-search-link text-inherit  font-normal hover:text-main-dark text-base text-gray-3000 transition" class="mr-2">
								<a {$no_follow_text|escape:'html':'UTF-8'} href="{$link->goPage($requestPage, $smarty.section.pagination.index)|escape:'html':'UTF-8'}" class="disabled text-inherit p-1 mx-2.5">
									{$p|escape:'html':'UTF-8'}
								</a>
							</li>
						{else}
							<li class="font-normal hover:text-main-dark text-base text-gray-3000 transition">
								<a {$no_follow_text|escape:'html':'UTF-8'} href="{$link->goPage($requestPage, $smarty.section.pagination.index)|escape:'html':'UTF-8'}" class="text-inherit p-1 mx-2.5">
									{$smarty.section.pagination.index|escape:'html':'UTF-8'}
								</a>
							</li>
						{/if}
					{/section}
					{if $pages_nb>$stop+2}
						<li class="truncate font-normal hover:text-main-dark text-base text-gray-3000 transition">...</li>
						<li class="font-normal hover:text-main-dark text-base text-gray-3000 transition">
							<a href="{$link->goPage($requestPage, $pages_nb)|escape:'html':'UTF-8'}">
								{$pages_nb|intval}
							</a>
						</li>
					{/if}
					{if $pages_nb==$stop+1}
						<li>
							<a href="{$link->goPage($requestPage, $pages_nb)|escape:'html':'UTF-8'}">
								{$pages_nb|intval}
							</a>
						</li>
					{/if}
					{if $pages_nb==$stop+2}
						<li class="font-normal hover:text-main-dark text-base text-gray-3000 transition">
							<a href="{$link->goPage($requestPage, $pages_nb-1)|escape:'html':'UTF-8'}">
								{$pages_nb-1|intval}
							</a>
						</li>
						<li class="font-normal hover:text-main-dark text-base text-gray-3000 transition">
							<a href="{$link->goPage($requestPage, $pages_nb)|escape:'html':'UTF-8'}">
								{$pages_nb|intval}
							</a>
						</li>
					{/if}
					{if $pages_nb > 1 AND $p != $pages_nb}
						{assign var='p_next' value=$p+1}
						<li id="pagination_next{if isset($paginationId)}_{$paginationId|escape:'html':'UTF-8'}{/if}" class="font-normal hover:text-main-dark text-base text-gray-3000 transition">						
							<a {$no_follow_text|escape:'html':'UTF-8'} class="next" rel="next" href="{$link->goPage($requestPage, $p_next)|escape:'html':'UTF-8'}">							
								<span>{l s='Next' mod='leoblog'}</span>
								<i class="material-icons">&#xE315;</i>
							</a>
						</li>
					{else}
						<li id="pagination_next{if isset($paginationId)}_{$paginationId|escape:'html':'UTF-8'}{/if}" class="font-normal hover:text-main-dark text-base text-gray-3000 transition">						
							<a class="next disabled" rel="next" href="#">	
								<span>{l s='Next' mod='leoblog'}</span>
								<i class="material-icons">&#xE315;</i>
							</a>
						</li>
					{/if}
				</ul>			
			</div>
		{/if}
	</nav>	
{/if}