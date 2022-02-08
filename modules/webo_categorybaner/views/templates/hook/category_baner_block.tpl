{if !$smarty.server.REQUEST_URI|strstr:'?page=' && $index eq 9}

    <div class="mb-[30px] w-full">
        <div class="-mx-[10px] tablet:mx-0">
            <img class="img-fluid tablet:rounded-md" src="{$banerImage}" />
        </div>
    </div>
{/if}