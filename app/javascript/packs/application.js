import "bootstrap"
import "jquery-mask-plugin"
require("@rails/ujs").start()
require("turbolinks").start()
require("@fortawesome/fontawesome-free")

document.addEventListener("turbolinks:load", () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
  $('.toast').toast('show')

  $('.date-time').mask('00/00/0000 00:00');
  $('.date').mask('00/00/0000')
  $('.number-only').mask('0#')
  $('.cpf').mask('000.000.000-00', {reverse: true})
})
