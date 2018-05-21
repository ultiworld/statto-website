class Pricing
  @locales:
    'en-gb': '£29.99'
    'en-au': '$47.99'
    'en-ca': '$41.99'

  @init: ->
    if price = Pricing.locales[navigator.language.toLowerCase()]
    	element.innerHTML = price for element in document.getElementsByClassName('price')

document.addEventListener('DOMContentLoaded', Pricing.init)