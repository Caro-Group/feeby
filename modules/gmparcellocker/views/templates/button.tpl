<div class="gmparcellocker-button col-sm-12">
    {*<span id="parcel-search-address">{$gmSearchAddress}</span>*}
   <p class="font-body text-sm">{l s='Chosen Parcel Locker:' mod='gmparcellocker'} <span class="chosen-parcel">{$gmChosenParcel}</span></p>
   <button class="border-2 border-main-dark border-solid font-body font-normal hover:bg-main-dark hover:text-white px-6 py-3 rounded-full text-main-dark text-sm transition uppercase whitespace-nowrap bg-transparent cursor-pointer" id="parcel-choose" onclick="gmParcelLockerChoose();return false;">
      {l s='Choose Parcel Locker' mod='gmparcellocker'}
   </button>
</div>