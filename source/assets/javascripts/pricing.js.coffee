class Pricing
  @locales:
    'en-gb': '£9.99'
    'en-au': '$14.99'
    'en-ca': '$13.99'

  @init: ->
    if price = Pricing.locales[navigator.language.toLowerCase()]
    	element.innerHTML = price for element in document.getElementsByClassName('price')

document.addEventListener('DOMContentLoaded', Pricing.init)
