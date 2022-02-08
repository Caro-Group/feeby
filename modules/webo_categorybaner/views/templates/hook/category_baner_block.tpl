{if !$smarty.server.REQUEST_URI|strstr:'?page=' && $product@index eq 9 && $category['id_parent'] != 582}
    {assign var="img_baner" value="`$link->getMediaLink($smarty.const._THEME_CAT_DIR_)``$smarty.get.id_category`_thumb.jpg"}
    {assign var="img_baner_file" value="`$smarty.const._PS_CAT_IMG_DIR_``$smarty.get.id_category`_thumb.jpg"}

    {if file_exists($img_baner_file)}
        <div class="mb-[30px] w-full">
            <div class="-mx-[10px] tablet:mx-0">
                <img class="img-fluid tablet:rounded-md" src="{$img_baner}" />
            </div>
        </div>
    {/if}
{/if}