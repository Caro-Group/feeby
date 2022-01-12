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
    <h1 class="step-title absolute pt-8 mt-7 tablet:pt-14 top-0 w-1/4 px-2 text-center leading-3 ">
      <span class="step-number tablet:text-xl tablet:leading-[45px] tablet:-ml-[25px] tablet:h-[50px] tablet:w-[50px] tablet:-top-1  top-1 absolute bg-transparent border border-gray-2000 border-solid font-body font-normal pt-0.5 text-gray-3000 h-7 -ml-[14px] left-1/2 not-italic p-0 rounded-full text-base text-center text-main-dark w-7">{if $position == 4}3{else}{$position}{/if}</span>
      <span class="font-body tablet:text-xl font-normal normal-case not-italic text-[10px] text-gray-3000 ">{$title}</span>
    </h1>

    <div class="content">
      {block name='step_content'}DUMMY STEP CONTENT{/block}
    </div>
  </section>
{/block}
