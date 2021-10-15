import sorting from './sorting'
import password_coincidence from './password_coincidence'

document.addEventListener('turbolinks:load', () => {
  sorting()
  password_coincidence()
})
