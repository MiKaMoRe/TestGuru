import sorting from './sorting'
import password_coincidence from './password_coincidence'
import form_inline from './form_inline'
import testProgressbar from './test_progressbar'

document.addEventListener('turbolinks:load', () => {
  sorting()
  password_coincidence()
  form_inline()
  testProgressbar()
})
