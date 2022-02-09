{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@buy-addons.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    Buy-addons    <contact@buy-addons.com>
* @copyright 2007-2019 Buy-addons
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}


{if $position_popup == 1}
    {if !empty($infor)}
    <div class="videopopup" style="padding : 15px 0px;"> 
            <button class="btn btn-primary" type="button" onclick="popupvideo()" style="width: auto;background: #fff;border-radius: 5px; height: 40px;border-color: #a3c9da;color:#565252; font-weight: 800;">
            <img src="{$url1|escape:'htmlall':'UTF-8'}modules/bavideotab/views/img/iconvideo.png" alt="" style="margin-top:-4px;">
            {l s='LIVE VIDEO' mod='bavideotab'}
         </button> 
    </div>
    <div class="popup" onclick="cancelpopup({$infor[0]['type']|escape:'htmlall':'UTF-8'})">
    </div>
    <div class="momo" onclick="play()">
            {if $infor[0]['type'] == 0 }
            <div class="video_popup" style="">
                    <div class="rte" style="position: relative;width: 100%; padding: 0px;">
                         <div>
                             {$infor[0]['text_url'] nofilter}{*Escape is unnecessary*}
                         </div>
                       
                    </div>
            </div>
            {/if}
            
            {if $infor[0]['type'] == 1 }
            <div class="video_productpopup">
                <div class="rte" style="">
                    <video style=" height: auto;width: 100%" controls id="myVideo">
                    <source src="{$url|escape:'htmlall':'UTF-8'}">
                    </video>
                    <video style="display: none;" controls id="demo">
                    <source src="{$url|escape:'htmlall':'UTF-8'}">
                    </video>
                </div>
            </div>
            {/if}
    </div>
    {/if}
{/if}