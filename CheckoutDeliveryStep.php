<?php
/**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Open Software License (OSL 3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/OSL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/OSL-3.0 Open Software License (OSL 3.0)
 */
use PrestaShop\PrestaShop\Adapter\Product\PriceFormatter;
use Symfony\Component\Translation\TranslatorInterface;

class CheckoutDeliveryStepCore extends AbstractCheckoutStep
{
    protected $template = 'checkout/_partials/steps/shipping.tpl';

    private $recyclablePackAllowed = false;
    private $giftAllowed = false;
    private $giftCost = 0;
    private $includeTaxes = false;
    private $displayTaxesLabel = false;

    private $addressForm;
    private $use_same_address = true;
    private $show_delivery_address_form = false;
    private $show_invoice_address_form = false;
    private $form_has_continue_button = false;

    public function __construct(
        Context $context,
        TranslatorInterface $translator,
        CustomerAddressForm $addressForm
    ) {
        parent::__construct($context, $translator);
        $this->addressForm = $addressForm;
    }

    public function getDataToPersist()
    {
        return [
            'use_same_address' => $this->use_same_address,
        ];
    }

    public function restorePersistedData(array $data)
    {
        if (array_key_exists('use_same_address', $data)) {
            $this->use_same_address = $data['use_same_address'];
        }

        return $this;
    }

    public function setRecyclablePackAllowed($recyclablePackAllowed)
    {
        $this->recyclablePackAllowed = $recyclablePackAllowed;

        return $this;
    }

    public function isRecyclablePackAllowed()
    {
        return $this->recyclablePackAllowed;
    }

    public function setGiftAllowed($giftAllowed)
    {
        $this->giftAllowed = $giftAllowed;

        return $this;
    }

    public function isGiftAllowed()
    {
        return $this->giftAllowed;
    }

    public function setGiftCost($giftCost)
    {
        $this->giftCost = $giftCost;

        return $this;
    }

    public function getGiftCost()
    {
        return $this->giftCost;
    }

    public function setIncludeTaxes($includeTaxes)
    {
        $this->includeTaxes = $includeTaxes;

        return $this;
    }

    public function getIncludeTaxes()
    {
        return $this->includeTaxes;
    }

    public function setDisplayTaxesLabel($displayTaxesLabel)
    {
        $this->displayTaxesLabel = $displayTaxesLabel;

        return $this;
    }

    public function getDisplayTaxesLabel()
    {
        return $this->displayTaxesLabel;
    }

    public function getGiftCostForLabel()
    {
        if ($this->getGiftCost() != 0) {
            $taxLabel = '';
            $priceFormatter = new PriceFormatter();

            if ($this->getIncludeTaxes() && $this->getDisplayTaxesLabel()) {
                $taxLabel .= $this->getTranslator()->trans('tax incl.', [], 'Shop.Theme.Checkout');
            } elseif ($this->getDisplayTaxesLabel()) {
                $taxLabel .= $this->getTranslator()->trans('tax excl.', [], 'Shop.Theme.Checkout');
            }

            return $this->getTranslator()->trans(
                '(additional cost of %giftcost% %taxlabel%)',
                [
                    '%giftcost%' => $priceFormatter->convertAndFormat($this->getGiftCost()),
                    '%taxlabel%' => $taxLabel,
                ],
                'Shop.Theme.Checkout'
            );
        }

        return '';
    }

    public function handleRequest(array $requestParams = [])
    {

	    $this->addressForm->setAction($this->getCheckoutSession()->getCheckoutURL());

        if (array_key_exists('use_same_address', $requestParams)) {
            $this->use_same_address = (bool) $requestParams['use_same_address'];
            if (!$this->use_same_address) {
                $this->setCurrent(true);
            }
        }

        if (isset($requestParams['cancelAddress'])) {
            if ($requestParams['cancelAddress'] === 'invoice') {
                if ($this->getCheckoutSession()->getCustomerAddressesCount() < 2) {
                    $this->use_same_address = true;
                }
            }
            $this->setCurrent(true);
        }

        // Can't really hurt to set the firstname and lastname.
        $this->addressForm->fillWith([
            'firstname' => $this->getCheckoutSession()->getCustomer()->firstname,
            'lastname' => $this->getCheckoutSession()->getCustomer()->lastname,
        ]);

        if (isset($requestParams['saveAddress'])) {
            $saved = $this->addressForm->fillWith($requestParams)->submit();
            if (!$saved) {
                $this->setCurrent(true);
                $this->getCheckoutProcess()->setHasErrors(true);
                if ($requestParams['saveAddress'] === 'delivery') {
                    $this->show_delivery_address_form = true;
                } else {
                    $this->show_invoice_address_form = true;
                }
            } else {
                if ($requestParams['saveAddress'] === 'delivery') {
                    $this->use_same_address = isset($requestParams['use_same_address']);
                }
                $id_address = $this->addressForm->getAddress()->id;
                if ($requestParams['saveAddress'] === 'delivery') {
                    $this->getCheckoutSession()->setIdAddressDelivery($id_address);
                    if ($this->use_same_address) {
                        $this->getCheckoutSession()->setIdAddressInvoice($id_address);
                    }
                } else {
                    $this->getCheckoutSession()->setIdAddressInvoice($id_address);
                }
            }
        } elseif (isset($requestParams['newAddress'])) {
            // while a form is open, do not go to next step
            $this->setCurrent(true);
            if ($requestParams['newAddress'] === 'delivery') {
                $this->show_delivery_address_form = true;
            } else {
                $this->show_invoice_address_form = true;
            }
            $this->addressForm->fillWith($requestParams);
            $this->form_has_continue_button = $this->use_same_address;
        } elseif (isset($requestParams['editAddress'])) {
            // while a form is open, do not go to next step
            $this->setCurrent(true);
            if ($requestParams['editAddress'] === 'delivery') {
                $this->show_delivery_address_form = true;
            } else {
                $this->show_invoice_address_form = true;
            }
            $this->addressForm->loadAddressById($requestParams['id_address']);
        } elseif (isset($requestParams['deleteAddress'])) {
            $addressPersister = new CustomerAddressPersister(
                $this->context->customer,
                $this->context->cart,
                Tools::getToken(true, $this->context)
            );

            $deletionResult = (bool) $addressPersister->delete(
                new Address((int) Tools::getValue('id_address'), $this->context->language->id),
                Tools::getValue('token')
            );
            if ($deletionResult) {
                $this->context->controller->success[] = $this->getTranslator()->trans(
                    'Address successfully deleted!',
                    [],
                    'Shop.Notifications.Success'
                );
                $this->context->controller->redirectWithNotifications(
                    $this->getCheckoutSession()->getCheckoutURL()
                );
            } else {
                $this->getCheckoutProcess()->setHasErrors(true);
                $this->context->controller->errors[] = $this->getTranslator()->trans(
                    'Could not delete address.',
                    [],
                    'Shop.Notifications.Error'
                );
            }
        }


        if (isset($requestParams['confirm-addresses'])) {
            if (isset($requestParams['id_address_delivery'])) {
                $id_address = $requestParams['id_address_delivery'];

                if (!Customer::customerHasAddress($this->getCheckoutSession()->getCustomer()->id, $id_address)) {
                    $this->getCheckoutProcess()->setHasErrors(true);
                } else {
                    if ($this->getCheckoutSession()->getIdAddressDelivery() != $id_address) {
                        $this->setCurrent(true);
                        $this->getCheckoutProcess()->invalidateAllStepsAfterCurrent();
                    }

                    $this->getCheckoutSession()->setIdAddressDelivery($id_address);
                    if ($this->use_same_address) {
                        $this->getCheckoutSession()->setIdAddressInvoice($id_address);
                    }
                }
            }

            if (isset($requestParams['id_address_invoice'])) {
                $id_address = $requestParams['id_address_invoice'];
                if (!Customer::customerHasAddress($this->getCheckoutSession()->getCustomer()->id, $id_address)) {
                    $this->getCheckoutProcess()->setHasErrors(true);
                } else {
                    $this->getCheckoutSession()->setIdAddressInvoice($id_address);
                }
            }

            if (!$this->getCheckoutProcess()->hasErrors()) {
                $this->setNextStepAsCurrent();
                $this->setComplete(
                    $this->getCheckoutSession()->getIdAddressInvoice() &&
                    $this->getCheckoutSession()->getIdAddressDelivery()
                );
            }
        }

        $addresses_count = $this->getCheckoutSession()->getCustomerAddressesCount();

        if ($addresses_count === 0) {
            $this->show_delivery_address_form = true;
        } elseif ($addresses_count < 2 && !$this->use_same_address) {
            $this->show_invoice_address_form = true;
            $this->setComplete(false);
        }

        if ($this->show_invoice_address_form) {
            // show continue button because form is at the end of the step
            $this->form_has_continue_button = true;
        } elseif ($this->show_delivery_address_form) {
            // only show continue button if we're sure
            // our form is at the bottom of the step
            if ($this->use_same_address || $addresses_count < 2) {
                $this->form_has_continue_button = true;
            }
        }


        if (isset($requestParams['delivery_option'])) {
            $this->setComplete(false);
            $this->getCheckoutSession()->setDeliveryOption(
                $requestParams['delivery_option']
            );
            $this->getCheckoutSession()->setRecyclable(
                isset($requestParams['recyclable']) ? $requestParams['recyclable'] : false
            );

            $useGift = isset($requestParams['gift']) ? $requestParams['gift'] : false;
            $this->getCheckoutSession()->setGift(
                $useGift,
                ($useGift && isset($requestParams['gift_message'])) ? $requestParams['gift_message'] : ''
            );
        }

        if (isset($requestParams['delivery_message'])) {
            $this->getCheckoutSession()->setMessage($requestParams['delivery_message']);
        }

        if ($this->isReachable() && isset($requestParams['confirmDeliveryOption'])) {
            // we're done if
            // - the step was reached (= all previous steps complete)
            // - user has clicked on "continue"
            // - there are delivery options
            // - the is a selected delivery option
            // - the module associated to the delivery option confirms
            $deliveryOptions = $this->getCheckoutSession()->getDeliveryOptions();
            $this->setNextStepAsCurrent();
            $this->setComplete(
                !empty($deliveryOptions)
                && $this->getCheckoutSession()->getSelectedDeliveryOption()
                && $this->isModuleComplete($requestParams)
            );
        }

        $this->setTitle($this->getTranslator()->trans('Shipping Address and Method', [], 'Shop.Theme.Checkout'));

        Hook::exec('actionCarrierProcess', ['cart' => $this->getCheckoutSession()->getCart()]);

    }

 	public function getTemplateParameters()
    {
        $idAddressDelivery = (int) $this->getCheckoutSession()->getIdAddressDelivery();
        $idAddressInvoice = (int) $this->getCheckoutSession()->getIdAddressInvoice();
        $params = [
            'address_form' => $this->addressForm->getProxy(),
            'use_same_address' => $this->use_same_address,
            'use_different_address_url' => $this->context->link->getPageLink(
                'order',
                true,
                null,
                ['use_same_address' => 0]
            ),
            'new_address_delivery_url' => $this->context->link->getPageLink(
                'order',
                true,
                null,
                ['newAddress' => 'delivery']
            ),
            'new_address_invoice_url' => $this->context->link->getPageLink(
                'order',
                true,
                null,
                ['newAddress' => 'invoice']
            ),
            'id_address' => (int) Tools::getValue('id_address'),
            'id_address_delivery' => $idAddressDelivery,
            'id_address_invoice' => $idAddressInvoice,
            'show_delivery_address_form' => $this->show_delivery_address_form,
            'show_invoice_address_form' => $this->show_invoice_address_form,
            'form_has_continue_button' => $this->form_has_continue_button,
        ];

        /** @var OrderControllerCore $controller */
        $controller = $this->context->controller;
        if (isset($controller)) {
            $warnings = $controller->checkoutWarning;
            $addressWarning = isset($warnings['address'])
                ? $warnings['address']
                : false;
            $invalidAddresses = isset($warnings['invalid_addresses'])
                ? $warnings['invalid_addresses']
                : [];

            $errors = [];
            if (in_array($idAddressDelivery, $invalidAddresses)) {
                $errors['delivery_address_error'] = $addressWarning;
            }

            if (in_array($idAddressInvoice, $invalidAddresses)) {
                $errors['invoice_address_error'] = $addressWarning;
            }

            if ($this->show_invoice_address_form
                || $idAddressInvoice != $idAddressDelivery
                || !empty($errors['invoice_address_error'])
            ) {
                $this->use_same_address = false;
            }

            // Add specific parameters
            $params = array_replace(
                $params,
                [
                    'not_valid_addresses' => implode(',', $invalidAddresses),
                    'use_same_address' => $this->use_same_address,
                ],
                $errors
            );
        }

        return $params;
    }

    public function render(array $extraParams = [])
    {
	    $adreessParam = $this->getTemplateParameters();

		$templateParams = array_merge($adreessParam,             [
                'hookDisplayBeforeCarrier' => Hook::exec('displayBeforeCarrier', ['cart' => $this->getCheckoutSession()->getCart()]),
                'hookDisplayAfterCarrier' => Hook::exec('displayAfterCarrier', ['cart' => $this->getCheckoutSession()->getCart()]),
                'id_address' => $this->getCheckoutSession()->getIdAddressDelivery(),
                'delivery_options' => $this->getCheckoutSession()->getDeliveryOptions(),
                'delivery_option' => $this->getCheckoutSession()->getSelectedDeliveryOption(),
                'recyclable' => $this->getCheckoutSession()->isRecyclable(),
                'recyclablePackAllowed' => $this->isRecyclablePackAllowed(),
                'delivery_message' => $this->getCheckoutSession()->getMessage(),
                'gift' => [
                    'allowed' => $this->isGiftAllowed(),
                    'isGift' => $this->getCheckoutSession()->getGift()['isGift'],
                    'label' => $this->getTranslator()->trans(
                        'I would like my order to be gift wrapped %cost%',
                        ['%cost%' => $this->getGiftCostForLabel()],
                        'Shop.Theme.Checkout'
                    ),
                    'message' => $this->getCheckoutSession()->getGift()['message'],
                ],
            ]);

        return $this->renderTemplate(
            $this->getTemplate(),
            $extraParams,
		   $templateParams
        );
    }

    protected function isModuleComplete($requestParams)
    {
        $deliveryOptions = $this->getCheckoutSession()->getDeliveryOptions();
        $currentDeliveryOption = $deliveryOptions[$this->getCheckoutSession()->getSelectedDeliveryOption()];
        if (!$currentDeliveryOption['is_module']) {
            return true;
        }

        $isComplete = true;
        Hook::exec(
            'actionValidateStepComplete',
            [
                'step_name' => 'adress and delivery',
                'request_params' => $requestParams,
                'completed' => &$isComplete,
            ],
            Module::getModuleIdByName($currentDeliveryOption['external_module_name'])
        );

        return $isComplete;
    }
}
