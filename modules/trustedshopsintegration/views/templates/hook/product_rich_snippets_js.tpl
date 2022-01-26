{*
* 2016-2021 Trusted Shops GmbH
*
* NOTICE OF LICENSE
*  @author    Trusted Shops GmbH
*  @copyright 2016-2021 Trusted Shops GmbH
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*
*}

<script type="application/ld+json">
            {
            "@context": "http://schema.org",
            "@type": "Organization",
           "name": "{$shopName|escape:'htmlall':'UTF-8'}",
            "aggregateRating" : {
            "@type": "AggregateRating",
            "ratingValue" : "{$result|escape:'htmlall':'UTF-8'}",
            "bestRating" : "{$max|escape:'htmlall':'UTF-8'}",
           "ratingCount" : "{$count|escape:'htmlall':'UTF-8'}"
           }}
</script>
