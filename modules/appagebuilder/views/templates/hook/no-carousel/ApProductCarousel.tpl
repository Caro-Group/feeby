{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<!-- @file modules\appagebuilder\views\templates\hook\ApProductCarousel -->
{if isset($formAtts.lib_has_error) && $formAtts.lib_has_error}
    {if isset($formAtts.lib_error) && $formAtts.lib_error}
        <div class="alert alert-warning leo-lib-error">{$formAtts.lib_error}</div>
    {/if}
{else}
    <div class="block products_block cus-nocarousel">
        {($apLiveEdit)?$apLiveEdit:'' nofilter}{* HTML form , no escape necessary *}
        {if isset($formAtts.title)&&!empty($formAtts.title)}
            <div class="flex justify-between px-[30px] tablet-medium:px-[20px] tablet:mb-8">
                <h2 class="flex-shrink-0 font-normal text-2xl tablet:text-4xl">
                    {$formAtts.title|rtrim|escape:'html':'UTF-8'}
                </h2>
                <svg class="tablet:h-[60px] w-auto" width="40px" height="40px" viewbox="0 0 123 123" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xml:space="preserve" xmlns:serif="http://www.serif.com/" style="fill-rule: evenodd; clip-rule: evenodd; stroke-linejoin: round; stroke-miterlimit: 2;">
                    <path style="fill-rule: nonzero;" fill="#ececec" d="M93.965,26.032l-52.047,0c-0.526,0 -1.047,0.017 -1.571,0.046c-0.067,0.006 -0.138,0.007 -0.205,0.011c-0.497,0.031 -0.987,0.075 -1.477,0.132c-0.088,0.01 -0.179,0.021 -0.265,0.031c-0.485,0.06 -0.968,0.133 -1.444,0.217c-0.084,0.014 -0.165,0.029 -0.246,0.044c-0.493,0.092 -0.98,0.191 -1.463,0.307c-0.045,0.012 -0.088,0.024 -0.136,0.036c-0.476,0.115 -0.949,0.244 -1.42,0.385c-0.047,0.012 -0.09,0.024 -0.138,0.039c-0.469,0.143 -0.937,0.301 -1.4,0.47c-0.081,0.027 -0.161,0.057 -0.242,0.086c-0.447,0.167 -0.893,0.345 -1.329,0.533c-0.088,0.036 -0.172,0.072 -0.257,0.11c-0.44,0.194 -0.876,0.397 -1.306,0.612c-0.064,0.033 -0.131,0.067 -0.195,0.101c-0.447,0.227 -0.885,0.461 -1.319,0.712c-0.013,0.007 -0.024,0.014 -0.037,0.021c-0.43,0.249 -0.857,0.514 -1.276,0.786c-0.06,0.041 -0.124,0.081 -0.188,0.12c-0.4,0.265 -0.792,0.54 -1.183,0.826c-0.074,0.055 -0.148,0.11 -0.225,0.166c-0.38,0.286 -0.755,0.58 -1.121,0.884c-0.067,0.057 -0.138,0.114 -0.201,0.169c-0.377,0.318 -0.747,0.641 -1.106,0.976c-0.036,0.035 -0.074,0.071 -0.107,0.105c-0.355,0.334 -0.703,0.676 -1.038,1.03c-0.033,0.036 -0.071,0.071 -0.103,0.107c-0.341,0.359 -0.669,0.729 -0.992,1.107c-0.057,0.066 -0.114,0.131 -0.167,0.198c-0.313,0.37 -0.616,0.748 -0.908,1.137c-0.026,0.034 -0.057,0.067 -0.081,0.103l0,-8.729c0,-12.652 9.904,-22.814 22.546,-23.134l0.607,-0.015c0.109,0 0.219,0.003 0.327,0.007l0.279,0.008l0.003,-0.015l51.437,0c5.589,0 10.135,4.546 10.135,10.135c0,5.59 -4.546,10.136 -10.141,10.136m-26.018,31.78c5.588,0 10.136,4.546 10.136,10.137c0,5.588 -4.548,10.134 -10.154,10.134l-28.841,0l-0.057,3.568l0.011,0.002l0,25.337c0,5.588 -4.545,10.133 -10.137,10.133c-5.585,0 -10.133,-4.545 -10.133,-10.14l0,-52.06c0.004,-4.06 1.075,-8.056 3.104,-11.558c0.246,-0.425 0.504,-0.834 0.772,-1.237c0.088,-0.132 0.182,-0.259 0.273,-0.388c0.184,-0.268 0.372,-0.533 0.571,-0.791c0.11,-0.148 0.227,-0.293 0.346,-0.437c0.184,-0.23 0.369,-0.459 0.564,-0.683c0.127,-0.147 0.258,-0.292 0.388,-0.436c0.193,-0.212 0.387,-0.42 0.588,-0.625c0.138,-0.139 0.279,-0.278 0.417,-0.414c0.209,-0.199 0.417,-0.394 0.632,-0.586c0.141,-0.129 0.282,-0.257 0.427,-0.38c0.228,-0.196 0.462,-0.385 0.701,-0.573c0.134,-0.108 0.269,-0.218 0.41,-0.323c0.282,-0.215 0.574,-0.418 0.866,-0.619c0.098,-0.067 0.191,-0.139 0.289,-0.205c0.394,-0.261 0.796,-0.511 1.205,-0.748c0.102,-0.058 0.205,-0.112 0.31,-0.168c0.309,-0.174 0.621,-0.344 0.941,-0.504c0.154,-0.078 0.311,-0.148 0.469,-0.222c0.272,-0.129 0.545,-0.256 0.82,-0.375c0.174,-0.074 0.353,-0.143 0.526,-0.211c0.27,-0.109 0.535,-0.21 0.807,-0.308c0.186,-0.065 0.366,-0.127 0.55,-0.188c0.273,-0.089 0.549,-0.171 0.824,-0.251c0.184,-0.053 0.369,-0.106 0.553,-0.154c0.289,-0.076 0.578,-0.141 0.864,-0.205c0.182,-0.04 0.356,-0.081 0.538,-0.115c0.321,-0.064 0.645,-0.115 0.97,-0.165c0.147,-0.021 0.295,-0.048 0.447,-0.069c0.032,-0.005 0.067,-0.007 0.098,-0.009l0,25.853l28.905,-0.017Zm26.011,-57.808l-52.033,0c-0.086,-0.011 -0.177,0.003 -0.265,0.005l-0.039,0.002c-0.108,0.001 -0.212,0.003 -0.32,0.007l-0.124,0.003c-7.564,0.193 -14.643,3.281 -19.939,8.699c-5.3,5.428 -8.221,12.599 -8.221,20.204l0,78.066c0,8.761 7.126,15.89 15.888,15.89c8.763,0 15.892,-7.129 15.892,-15.897l0,-23.143l23.15,0c8.762,0 15.891,-7.129 15.891,-15.891c0,-8.763 -7.129,-15.894 -15.902,-15.894l-23.139,0.016l0,-20.282l49.174,0c8.766,0 15.892,-7.129 15.892,-15.893c0,-8.761 -7.126,-15.892 -15.905,-15.892"></path>
                    <path style="fill-rule: nonzero;" fill="#ececec" d="M100.584,109.389l-1.998,0l0,3.707l1.998,0c1.487,0 2.234,-0.622 2.234,-1.867c0,-0.561 -0.191,-1.008 -0.578,-1.342c-0.387,-0.331 -0.937,-0.498 -1.656,-0.498m-0.053,-1.316c1.138,0 2.065,0.303 2.773,0.908c0.712,0.605 1.065,1.364 1.065,2.275c0,0.807 -0.245,1.47 -0.736,1.996c-0.49,0.528 -1.164,0.896 -2.024,1.106l3.207,3.866l-1.71,0l-3.022,-3.814l-1.471,0l0,3.814l-1.528,0l0,-10.151l3.446,0Zm0.053,-2.576c-1.91,0 -3.633,0.736 -5.169,2.208c-1.534,1.474 -2.301,3.322 -2.301,5.547c0,2.227 0.767,4.077 2.301,5.551c1.536,1.472 3.259,2.208 5.169,2.208c1.998,0 3.742,-0.731 5.232,-2.198c1.491,-1.461 2.234,-3.315 2.234,-5.561c0,-2.242 -0.743,-4.097 -2.234,-5.559c-1.49,-1.465 -3.234,-2.196 -5.232,-2.196m0,-1.631c2.418,0 4.557,0.896 6.414,2.684c1.859,1.788 2.789,4.022 2.789,6.702c0,2.685 -0.93,4.918 -2.789,6.707c-1.857,1.79 -3.996,2.682 -6.414,2.682c-2.368,0 -4.497,-0.898 -6.391,-2.694c-1.894,-1.797 -2.841,-4.028 -2.841,-6.695c0,-2.665 0.947,-4.893 2.841,-6.69c1.894,-1.797 4.023,-2.696 6.391,-2.696"></path>
                </svg>
            </div>
        {/if}
        {if isset($formAtts.sub_title) && $formAtts.sub_title}
            <div class="sub-title-widget">{$formAtts.sub_title nofilter}</div>
        {/if}
        <div class="block_content">	
			{if !empty($products)}
				{assign var=leo_include_file value=$leo_helper->getTplTemplate('ProductOwlCarousel.tpl', $formAtts['override_folder'])}
				{include file=$leo_include_file}
			{/if}
        </div>
        {($apLiveEditEnd)?$apLiveEditEnd:'' nofilter}{* HTML form , no escape necessary *}
    </div>
{/if}