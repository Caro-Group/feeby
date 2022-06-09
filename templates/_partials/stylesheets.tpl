{**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
{foreach $stylesheets.external as $stylesheet}
  <link rel="preload" href="{$stylesheet.uri}" as="style">     

  {if $stylesheet.urit|strstr:"cache"}
    <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="all">
  {else}
    <link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="none" onload="this.media='all'; this.onload=null;">
  {/if}

  <noscript><link rel="stylesheet" href="{$stylesheet.uri}" type="text/css" media="{$stylesheet.media}"></noscript>
{/foreach}

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preload" 
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,400&subset=latin-ext&display=swap"
    as="style"
    media="none"
    onload="this.media='all';this.rel='stylesheet';this.onload=null;"
  >

<noscript>
  <link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;1,400&subset=latin-ext&display=swap"
    media="all"
    rel="stylesheet">
</noscript>


{foreach $stylesheets.inline as $stylesheet}
  <style>
    {$stylesheet.content}
  </style>
{/foreach}
