class Pricing
  @locales:
    'en-gb': '£29.99'
    'en-au': '$47.99'
    'en-ca': '$41.99'

  @init: ->
    if price = Pricing.locales[navigator.language]
      $('.price').each ->
        $(this).text(price)

$ ->
  Pricing.init()
