{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
{block name='hook_display_reassurance'}
  {hook h='displayReassurance'}

{literal}
<style>
.blockreassurance_product{    display: flex;
    flex-direction: row;
    flex-wrap: wrap;
}
.blockreassurance_product > div{
    flex: 1 1 auto;
    width: 50%;
    border: 0;
}
div.blockreassurance_product .block-title, div.blockreassurance_product p.block-title{
font-size: 16px;
    line-height: normal;
}

</style>
{/literal}


{/block}