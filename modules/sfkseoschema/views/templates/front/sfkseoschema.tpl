{*
* This module helps to build relationship with customers,provide personalized service and increase in sales.
*
* NOTICE OF LICENSE
* 
* Each copy of the software must be used for only one production website, it may be used on additional
* test servers. You are not permitted to make copies of the software without first purchasing the
* appropriate additional licenses. This license does not grant any reseller privileges.
* 
* @author    Shahab
* @copyright 2007-2021 Shahab-FK Enterprises
* @license   Prestashop Commercial Module License
*}


{*
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
*}

<style>
	.checked {
	  color: orange;
	}
</style>

 
{assign var="flag" value="0"}

{if $SFK_PAGENAME == 'product' && $SFK_NAME == '' && $PS_FLAG =="PS17"}

<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. 1.7 default-->
<script type="application/ld+json" data-keepinline="true" data-nocompress="true">
{
  "@context" : "https://schema.org",
  "@type" : "Product",
  "name" : "{$product.name|escape:'htmlall':'UTF-8'}",
  "image" : "{$product.cover.large.url|escape:'htmlall':'UTF-8'}",
  "description" : "{$product.description_short|strip_tags:true}",
  "sku" : "{$product.reference_to_display|escape:'htmlall':'UTF-8'}",
  "mpn" : "{$product.reference_to_display|escape:'htmlall':'UTF-8'}",
  "brand": {
    "@type": "Thing",
    "name": "{$product_manufacturer->name|escape:'htmlall':'UTF-8'}"
  },
  
  
  "offers": {
    "@type": "Offer",
    "priceCurrency": "{$currency.iso_code|escape:'htmlall':'UTF-8'}",
    "availability": "https://schema.org/InStock",
    "price": "{$product.price_amount|escape:'htmlall':'UTF-8'}",
    "priceValidUntil": "2030-12-31",
    "url": "{$product.url|escape:'htmlall':'UTF-8'}"
  },
          
    "url" : "{$product.url|escape:'htmlall':'UTF-8'}",

  "sameAs": [
      "{$SFK_FACEBOOK|escape:'htmlall':'UTF-8'}",
      "{$SFK_TWITTER|escape:'htmlall':'UTF-8'}",
      "{$SFK_LINKEDIN|escape:'htmlall':'UTF-8'}",
      "{$SFK_YOUTUBECHANNEL|escape:'htmlall':'UTF-8'}",
      "{$SFK_INSTAGRAM|escape:'htmlall':'UTF-8'}",
      "{$SFK_VK|escape:'htmlall':'UTF-8'}"
   ]
}
</script>

{assign var="flag" value="1"}

{assign currency Currency::getDefaultCurrency()->sign}
{assign currency_code Currency::getDefaultCurrency()->iso_code}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"  data-keepinline="true" data-nocompress="true"></script>

<script type="text/javascript"  data-keepinline="true" data-nocompress="true">
	
$(document).ready(function(){
    $.ajax({
        url: "{$SFK_SITE_URL}sfk_product_data.php?flag=1&sfk_pid={$product.id}&sfk_psku='{$product.reference_to_display}'&sfk_pmpn='{$product.reference_to_display}'&sfk_pmanuname='{$product_manufacturer->name}'&sfk_pcurrency='{$currency_code}'&sfk_pprice='{$product.price_amount}'",
        success: function(result){
    }});
});

</script>


<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. For Breadcrumb List -->
<script type="application/ld+json">
{
 "@context": "https://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement":
 [
  
   {
   "@type": "ListItem",
   "position": 1,
   "item":
   {
    "@id": "{$SFK_SHOP_DOMAIN|escape:'htmlall':'UTF-8'}",
    "name": "{$SFK_SHOP_NAME|escape:'htmlall':'UTF-8'}"
    }
  },

  {
   "@type": "ListItem",
  "position": 2,
  "item":
   {
     "@id": "{$product.url|escape:'htmlall':'UTF-8'}",
     "name": "{$product.name|escape:'htmlall':'UTF-8'}"
   }
  }

 ]
}
</script>


{/if}





{if $SFK_PAGENAME == 'product' && $flag == '0' && $SFK_NAME == '' && $PS_FLAG =="PS156"}

<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. 1.5 1.6 default-->
<script type="application/ld+json" data-keepinline="true" data-nocompress="true">
{
  "@context" : "https://schema.org",
  "@type" : "Product",
  "name" : "{$SFK_PRODUCT_NAME|escape:'htmlall':'UTF-8'}",
  "image" : "{$SFK_PRODUCT_IMAGE|escape:'htmlall':'UTF-8'}",
  "description" : "{$SFK_PRODUCT_DESC|strip_tags:true}",
  "sku" : "{$SFK_PRODUCT_SKU|escape:'htmlall':'UTF-8'}",
  "mpn" : "{$SFK_PRODUCT_SKU|escape:'htmlall':'UTF-8'}",
  "brand": {
    "@type": "Thing",
    "name": "{$SFK_PRODUCT_MANUFACTURER|escape:'htmlall':'UTF-8'}"
  },
  "url" : "{$SFK_PRODUCT_URL|escape:'htmlall':'UTF-8'}",
  
  "offers": {
    "@type": "Offer",
    "priceCurrency": "{$currency->iso_code|escape:'htmlall':'UTF-8'}",
    "availability": "https://schema.org/InStock",
    "price": "{$SFK_REGULAR_PRICE|escape:'htmlall':'UTF-8'}",
    "priceValidUntil": "2030-12-31",
    "url": "{$SFK_PRODUCT_URL|escape:'htmlall':'UTF-8'}"
  },
  "sameAs": [
      "{$SFK_FACEBOOK|escape:'htmlall':'UTF-8'}",
      "{$SFK_TWITTER|escape:'htmlall':'UTF-8'}",
      "{$SFK_LINKEDIN|escape:'htmlall':'UTF-8'}",
      "{$SFK_YOUTUBECHANNEL|escape:'htmlall':'UTF-8'}",
      "{$SFK_INSTAGRAM|escape:'htmlall':'UTF-8'}",
      "{$SFK_VK|escape:'htmlall':'UTF-8'}"
   ]
}
</script>

{assign var="flag" value="1"}

{assign currency Currency::getDefaultCurrency()->sign}
{assign currency_code Currency::getDefaultCurrency()->iso_code}

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" type="text/javascript"  data-keepinline="true" data-nocompress="true"></script>


<script type="text/javascript"  data-keepinline="true" data-nocompress="true">
	
$(document).ready(function(){
    $.ajax({
        url: "{$SFK_SITE_URL}sfk_product_data.php?flag=1&sfk_pid={$SFK_PRODUCT_ID}&sfk_psku='{$SFK_PRODUCT_SKU}'&sfk_pmanuname='{$SFK_PRODUCT_MANUFACTURER}'&sfk_pcurrency='{$currency_code}'&sfk_pprice='{$SFK_REGULAR_PRICE}'&sfk_url='{$SFK_PRODUCT_URL}' ",
        success: function(result){
    }});
});

</script>


<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. For Breadcrumb List -->
<script type="application/ld+json">
{
 "@context": "https://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement":
 [
  
   {
   "@type": "ListItem",
   "position": 1,
   "item":
   {
    "@id": "{$SFK_SHOP_DOMAIN|escape:'htmlall':'UTF-8'}",
    "name": "{$SFK_SHOP_NAME|escape:'htmlall':'UTF-8'}"
    }
  },

  {
   "@type": "ListItem",
  "position": 2,
  "item":
   {
     "@id": "{$SFK_PRODUCT_URL|escape:'htmlall':'UTF-8'}",
     "name": "{$SFK_PRODUCT_NAME|escape:'htmlall':'UTF-8'}"
   }
  }

 ]
}
</script>



{/if}







{if $SFK_NAME != '' && $flag == '0'}

<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. From DB -->
<script type="application/ld+json" data-keepinline="true" data-nocompress="true">
{
  "@context" : "https://schema.org",
  "@type" : "{$SFK_TYPE|escape:'htmlall':'UTF-8'}",
  "name" : "{$SFK_NAME|escape:'htmlall':'UTF-8'}",
  "image" : "{$SFK_IMAGE_URL|escape:'htmlall':'UTF-8'}",
  "telephone" : "{$SFK_TELEPHONE|escape:'htmlall':'UTF-8'}",
  "email" : "{$SFK_EMAIL|escape:'htmlall':'UTF-8'}",
  "priceRange" : "{$SFK_PRICE_RANGE|escape:'htmlall':'UTF-8'}",
  "description" : "{$SFK_DESCRIPTION|strip_tags:true}",
  "sku" : "{$SFK_SKU|escape:'htmlall':'UTF-8'}",
  "mpn" : "{$SFK_SKU|escape:'htmlall':'UTF-8'}",
  
  {if !empty($SFK_STREET_ADDRESS)}
  "address" : {
    "@type" : "PostalAddress",
    "streetAddress" : "{$SFK_STREET_ADDRESS|escape:'htmlall':'UTF-8'}",
    "addressLocality" : "{$SFK_ADDRESS_LOCALITY|escape:'htmlall':'UTF-8'}",
    "addressRegion" : "{$SFK_ADDRESS_REGION|escape:'htmlall':'UTF-8'}",
    "addressCountry" : "{$SFK_ADDRESS_COUNTRY|escape:'htmlall':'UTF-8'}",
    "postalCode" : "{$SFK_POSTAL_CODE|escape:'htmlall':'UTF-8'}"
  },
  {/if}    
  
  {if !empty($SFK_DAY_OF_WEEK)}
  "openingHoursSpecification" : {
    "@type" : "OpeningHoursSpecification",
    "dayOfWeek" : {
      "@type" : "DayOfWeek",
      "name" : "{$SFK_DAY_OF_WEEK|escape:'htmlall':'UTF-8'}"
    },
    "opens": "{$SFK_OPENS|escape:'htmlall':'UTF-8'}",
      "closes": "{$SFK_CLOSES|escape:'htmlall':'UTF-8'}"
  },
  {/if}  
  
  {if !empty($SFK_BRAND)}
  "brand": {
    "@type": "Thing",
    "name": "{$SFK_BRAND|escape:'htmlall':'UTF-8'}"
  },
  {/if}  
  
  "url" : "{$SFK_URL|escape:'htmlall':'UTF-8'}",
          
  {if !empty($SFK_LATITUDE)}
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "{$SFK_LATITUDE|escape:'htmlall':'UTF-8'}",
    "longitude": "{$SFK_LONGITUDE|escape:'htmlall':'UTF-8'}"
  },
  {/if}  
  
  {if !empty($SFK_RATING_VALUE)}
  "aggregateRating" : {
    "@type" : "AggregateRating",
    "ratingValue" : "{$SFK_RATING_VALUE|escape:'htmlall':'UTF-8'}",
    "bestRating" : "{$SFK_BEST_RATING|escape:'htmlall':'UTF-8'}",
    "worstRating" : "{$SFK_WORST_RATING|escape:'htmlall':'UTF-8'}",
    "ratingCount" : "{$SFK_RATING_COUNT|escape:'htmlall':'UTF-8'}"
  },
  "review" : {
    "@type" : "Review",
    "author" : {
      "@type" : "{$SFK_AUTHOR|escape:'htmlall':'UTF-8'}",
      "name" : "{$SFK_AUTHOR_NAME|escape:'htmlall':'UTF-8'}"
    }
  },
  {/if}     

  {if !empty($SFK_OFFER_PRICE)}
  "offers": {
    "@type": "Offer",
    "priceCurrency": "{$SFK_OFFER_CURRENCY|escape:'htmlall':'UTF-8'}",
    "availability": "https://schema.org/InStock",
    "price": "{$SFK_OFFER_PRICE|escape:'htmlall':'UTF-8'}",
    "priceValidUntil": "{$SFK_PRICE_VALID|escape:'htmlall':'UTF-8'}",
    "url": "{$SFK_URL|escape:'htmlall':'UTF-8'}"
  },
  {/if}  
  
  "sameAs": [
      "{$SFK_FACEBOOK|escape:'htmlall':'UTF-8'}",
      "{$SFK_TWITTER|escape:'htmlall':'UTF-8'}",
      "{$SFK_LINKEDIN|escape:'htmlall':'UTF-8'}",
      "{$SFK_YOUTUBECHANNEL|escape:'htmlall':'UTF-8'}",
      "{$SFK_INSTAGRAM|escape:'htmlall':'UTF-8'}",
      "{$SFK_VK|escape:'htmlall':'UTF-8'}"
   ]
}
</script>



<!-- SFK JSON-LD markup generated by Google Structured Data Markup Helper. For Breadcrumb List -->
<script type="application/ld+json" data-keepinline="true" data-nocompress="true">
{
 "@context": "https://schema.org",
 "@type": "BreadcrumbList",
 "itemListElement":
 [
  
   {
   "@type": "ListItem",
   "position": 1,
   "item":
   {
    "@id": "{$SFK_SHOP_DOMAIN|escape:'htmlall':'UTF-8'}",
    "name": "{$SFK_SHOP_NAME|escape:'htmlall':'UTF-8'}"
    }
  },


  {
   "@type": "ListItem",
  "position": 2,
  "item":
   {
     "@id": "{$SFK_NAME|escape:'htmlall':'UTF-8'}",
     "name": "{$SFK_URL|escape:'htmlall':'UTF-8'}"
   }
  }

 ]
}
</script>


{/if}


{if $SFK_HOME_PAGE == "YES" && isset($SFK_FACEBOOK_HOME)}




<script type = "application/ld+json" data-keepinline="true" data-nocompress="true"> 
{
    "@context": "https://schema.org",
    "@type": "Organization",
    "url": "{$SFK_SITE_URL|escape:'htmlall':'UTF-8'}",
    "logo": "{$SFK_SITE_URL}img/logo.png",
    "sameAs": [
		"{$SFK_FACEBOOK_HOME|escape:'htmlall':'UTF-8'}",
		"{$SFK_TWITTER_HOME|escape:'htmlall':'UTF-8'}",
		"{$SFK_LINKEDIN_HOME|escape:'htmlall':'UTF-8'}",
		"{$SFK_YOUTUBECHANNEL_HOME|escape:'htmlall':'UTF-8'}",
		"{$SFK_VK_HOME|escape:'htmlall':'UTF-8'}",
		"{$SFK_INSTAGRAM_HOME|escape:'htmlall':'UTF-8'}"
    ]
} 
</script>


{/if}


