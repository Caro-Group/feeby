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
 {block name='step'}
  <section  id    = "{$identifier}"
            class = "{[
                        'checkout-step'   => true,
                        '-current'        => $step_is_current,
                        '-reachable'      => $step_is_reachable,
                        '-complete'       => $step_is_complete,
                        'js-current-step' => $step_is_current
                    ]|classnames}"
  >
    <h1 class="step-title absolute mt-8 top-0 w-1/4 px-2 ">
      <i class="material-icons -top-5 absolute bg-main bg-transparent font-normal h-7 left-1/3 material-icons not-italic p-0 pt-0.5 rounded-full rtl-no-flip step-number text-base text-center text-white w-7">&#xE876;</i>
      <span class="step-number -top-5 absolute bg-transparent border border-gray-2000 border-solid font-body font-normal text-gray-3000 h-7 left-1/3 not-italic p-0 rounded-full step-number text-base text-center text-main-dark w-7">{if $position == 4}3{else}{$position}{/if}</span>
      <span class="font-body font-normal normal-case not-italic text-[10px] text-gray-3000 ">{$title}</span>
    </h1>

    <div class="content">
      {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
  </section>
{/block}
