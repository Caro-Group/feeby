{*
* Do not edit the file if you want to upgrade the module in future.
* 
* @author    Globo Jsc <contact@globosoftware.net>
* @copyright 2016 Globo., Jsc
* @link	     http://www.globosoftware.net/
* @license   please read license in file license.txt
*/
*}


<select class="chosen" id="gcmb" name="idCombinations[]" multiple="multiple">
    {foreach from=$combinations item=combination key=key name=name}
        <option value="{$combination['id_product_attribute']|intval}" {$combination['selected']|escape:'htmlall':'UTF-8'}>{$combination['attributes']|escape:'htmlall':'UTF-8'}</option>
    {/foreach}
</select>
