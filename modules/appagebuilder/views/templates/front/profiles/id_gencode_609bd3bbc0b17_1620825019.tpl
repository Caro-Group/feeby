{* 
* @Module Name: AP Page Builder
* @Website: apollotheme.com - prestashop template provider
* @author Apollotheme <apollotheme@gmail.com>
* @copyright Apollotheme
* @description: ApPageBuilder is module help you can build content for your shop
*}
<div class="header-top-bar"><div><a href="tel:+48696403333">+48 696 403 333</a><span>|</span><a href="mailto:sklep@feeby.pl">sklep@feeby.pl</a><span>|</span><a href="https://feeby.herodotus.xyz/content/9-kontakt">Kontakt</a></div><div><a href="https://feeby.herodotus.xyz:82">Blog</a> <span>|</span><a href="https://feeby.herodotus.xyz/moje-konto">Moje konto</a> <span>| </span>{if !$customer.is_logged} <a href="https://feeby.herodotus.xyz/logowanie?create_account=1">Zarejestruj się</a> <span>|</span> <a href="https://feeby.herodotus.xyz/logowanie?back=my-account">Zaloguj się</a></div>{else}<a href="https://feeby.herodotus.xyz/logowanie?logout=">Wyloguj się</a>{/if}</div>