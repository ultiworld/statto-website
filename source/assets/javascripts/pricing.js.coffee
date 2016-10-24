class Pricing
  @locales:
    gb: '£29.99'
    au: '$62.99'
    ca: '$54.99'
    us: '$39.99'

  @init: ->
    code = navigator.language.replace('en-', '')
    if price = Pricing.locales[code]
      $('.price').each ->
        $(this).text(price)

$ ->
  Pricing.init()
