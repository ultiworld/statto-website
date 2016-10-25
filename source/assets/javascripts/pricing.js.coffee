class Pricing
  @locales:
    'en-gb': '£29.99'
    'en-au': '$62.99'
    'en-ca': '$54.99'

  @init: ->
    if price = Pricing.locales[navigator.language]
      $('.price').each ->
        $(this).text(price)

$ ->
  Pricing.init()
