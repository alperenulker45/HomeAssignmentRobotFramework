*** Settings ***
Library    SeleniumLibrary
Library    ../CustomLibs/libs.py
Variables    ../TestData/locators.py

*** Keywords ***
Navigate to the shopping website
    [Arguments]    ${url}   ${webDriver}
    open browser    ${url}  ${webDriver}
    click button    ${acceptcookies}
    maximize browser window
Search the product
    [Arguments]     ${productName}
    click element    ${searchButton}
    input text       ${searchBar}       ${productName}
Navigate to the product page
    click element    ${productTatuAndPatu}
Set item count and add to cart
    click button    ${productItemCountPlusButton}
    click button    ${addToCartButton}
Go to the cart page
    click button    ${goToCartButton}
Verify the subtotal and total prices
    [Arguments]     ${zero}     ${subTotal}     ${delivery}     ${total}
    wait until element does not contain    ${itemsSubTotalPrice}    ${zero}
    ${subTotalPrice}    get text    ${itemsSubTotalPrice}
    ${deliveryPrice}    get text    ${itemsdeliveryFee}
    ${totalPayment}     get text    ${itemstotalPrice}
    ${subTotalDecimal}  convert string to decimal   ${subTotalPrice}
    ${deliveryPriceDecimal}     convert string to decimal    ${deliveryPrice}
    ${totalPaymentDecimal}      convert string to decimal    ${totalPayment}
    should be equal as numbers    ${subTotalDecimal}    ${subTotal}
    should be equal as numbers    ${deliveryPriceDecimal}   ${delivery}
    should be equal as numbers   ${totalPaymentDecimal}       ${total}
Go to the checkout
    click button    ${checkOutButton}
Fill the billing form
    [Arguments]    ${name}  ${surname}  ${country}  ${address}  ${postCode}  ${city}    ${telephone}    ${email}
    input text    ${billingFirstNameInput}      ${name}
    input text    ${billingLastNameInput}       ${surname}
    press keys    ${billingLastNameInput}       TAB+BACKSPACE
    input text    ${billingCountryInput}    ${country}
    wait until element is visible    ${billingCountryLatvia}
    click element    ${billingCountryLatvia}
    input text  ${billingAddressInput}      ${address}
    input text    ${billingPostCodeInput}   ${postCode}
    input text    ${billingCityInput}   ${city}
    input text    ${billingTelephoneInput}  ${telephone}
    input text    ${billingEmailInput}  ${email}
Close the browsers
    close all browsers