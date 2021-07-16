const $ = (elem) => document.querySelector(elem)
const $$ = (elem) => document.querySelectorAll(elem)

document.addEventListener('turbolinks:load', () => {
  if ($('#user_password_confirmation')){
    let pass = $('#user_password')
    let pass_conf = $('#user_password_confirmation')
    let correct = () => {
      pass.classList.add('correct')
      pass_conf.classList.add('correct')
      pass.classList.remove('incorrect')
      pass_conf.classList.remove('incorrect')
    }
    let incorrect = () => {
      pass.classList.add('incorrect')
      pass_conf.classList.add('incorrect')
      pass.classList.remove('correct')
      pass_conf.classList.remove('correct')
    }
    let blank = () => {
      pass.classList.remove('incorrect')
      pass_conf.classList.remove('incorrect')
    }
    let check_confirmation = () => {
      if (pass.value == '' || pass_conf.value == '') {
        blank()
      } else if (pass.value == pass_conf.value){
        correct()
      } else {
        incorrect()
      }
    }

    pass.addEventListener('input', check_confirmation)
    pass_conf.addEventListener('input', check_confirmation)
  }
})
