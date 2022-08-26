*** Settings ***
Library    SeleniumLibrary
Variables    ../Resources/TestData/locators.py
Variables    ../Resources/TestData/data.py
Resource    ../Resources/KeywordDefinition/WebShopSteps.robot
Suite Setup    Set selenium implicit wait    9 seconds
Suite Teardown    Close the browsers

*** Variables ***
${site_url}     ${baseUrl}
${browser}      ${driverType}

*** Test Cases ***
TC1-Search the product and fill the form
    Navigate to the shopping website     ${site_url}     ${browser}
    Search the product    ${productName}
    Navigate to the product page
    Set item count and add to cart
    Go to the cart page
    Verify the subtotal and total prices    ${zeroPrice}   ${subTotalPrice}    ${deliveryPrice}    ${totalPrice}
    Go to the checkout
    Fill the billing form   ${firstName}   ${lastName}  ${country}  ${address}  ${postCode}  ${city}   ${telephone}   ${email}



