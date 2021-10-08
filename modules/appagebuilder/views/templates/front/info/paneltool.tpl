{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{if class_exists("LeoFrameworkHelper")}
{$skins=LeoFrameworkHelper::getSkins($LEO_THEMENAME)}
{$header_styles=LeoFrameworkHelper::getPanelConfigByTheme('header',$LEO_THEMENAME)}
{$sidebarmenu=LeoFrameworkHelper::getPanelConfigByTheme('sidebarmenu',$LEO_THEMENAME)}
{$theme_customizations=LeoFrameworkHelper::getLayoutSettingByTheme($LEO_THEMENAME)}
<div id="leo-paneltool" class="hidden-md-down" data-cname="{$LEO_COOKIE_THEME}">
	{if $skins || $header_styles || $theme_customizations || $sidebarmenu}
		<div class="paneltool themetool">
			<div class="panelbutton">
				<span>THEME OPTIONS</span>
			</div>
			<div class="block-panelcontent">
				<div class="panelcontent">
					<div class="panelinner">
						<h4>{l s='Panel Tool' d='Shop.Theme.Global'}</h4>
						<!-- Theme layout mod section -->
						{*
						{if $theme_customizations && isset($theme_customizations.layout) && isset($theme_customizations.layout.layout_mode) && isset($theme_customizations.layout.layout_mode.option)}
							<div class="group-input clearfix layout">
								<label class="col-sm-12 control-label"><span class="fa fa-desktop"></span>{l s='Layout Mod' d='Shop.Theme.Global'}</label>
								<div class="col-sm-12">
									{foreach $theme_customizations.layout.layout_mode.option as $layout}
										<span class="leo-dynamic-update-layout {if $LEO_LAYOUT_MODE == $layout.id}current-layout-mod{/if}" data-layout-mod="{$layout.id}">
											{$layout.name}
										</span>
									{/foreach}
								</div>
							</div>
						{/if}
						*}
						<!-- Theme skin section --> 
						{if $skins}
							<div class="group-input clearfix">
								<label class="col-sm-12 control-label"><span class="fa fa-pencil"></span>{l s='Theme' d='Shop.Theme.Global'}</label>
								<div class="col-sm-12">
									<div data-theme-skin-id="default" class="skin-default leo-dynamic-theme-skin{if $LEO_DEFAULT_SKIN=='default'} current-theme-skin{/if}">
										<label>{l s='Default' d='Shop.Theme.Global'}</label>
									</div>
									{foreach $skins as $skin}
										<div data-theme-skin-id="{$skin.id}" data-theme-skin-css="{$skin.css}" data-theme-skin-rtl="{$skin.rtl}" class="leo-dynamic-theme-skin{if isset($skin.icon) && $skin.icon} theme-skin-type-image{/if}{if $LEO_DEFAULT_SKIN==$skin.id} current-theme-skin{/if}">
											{if isset($skin.icon) && $skin.icon}
												<img class="lazy" data-src="{$skin.icon}" width="20" height="20" alt="{$skin.name}" />
											{else}
												<label>{$skin.name}</label>
											{/if}
										</div>
									{/foreach}
								</div>
							</div>
						{/if} 
						<!-- Float Header -->
						<div class="group-input clearfix">
							<label class="col-sm-12 control-label"><span class="fa fa-credit-card"></span>{l s='Float Header' d='Shop.Theme.Global'}</label>
							<div class="col-sm-12">
								<div class="btn_enable_fheader">
									<span class="enable_fheader btn_yes {if $USE_FHEADER}current{/if}" data-value="1">
										<span>{l s='Yes' d='Shop.Theme.Global'}</span>
									</span>
									<span class="enable_fheader btn_no {if !$USE_FHEADER}current{/if}" data-value="0">
										<span>{l s='No' d='Shop.Theme.Global'}</span>
									</span>
								</div>
							</div>
						</div>
						<!-- Show Profile -->
						{hook h="pagebuilderConfig" configName="profile"}
						{hook h="pagebuilderConfig" configName="header"}
						{hook h="pagebuilderConfig" configName="footer"}
						{*
						{hook h="pagebuilderConfig" configName="content"}
						{hook h="pagebuilderConfig" configName="product"}
						{hook h="pagebuilderConfig" configName="product_builder"}
						*}
					</div>
				</div>
			</div>
		</div>
	{/if}
	<!-- Live Theme Editor -->

</div>
{/if}