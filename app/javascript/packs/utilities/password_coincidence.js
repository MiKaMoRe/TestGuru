import Coincidence  from "../entities/Coincidence"

const password_coincidence = () => {
  if (document.querySelector('#user_password_confirmation')){
    const pass = document.querySelector('#user_password')
    const pass_conf = document.querySelector('#user_password_confirmation')
    new Coincidence(pass, pass_conf)
  }
}

export default password_coincidence
