const $ = (elem) => document.querySelector(elem)

class Coincidence{
  constructor(pass, pass_conf){
    this.pass = new Input(pass),
    this.pass_conf = new Input(pass_conf)
    this.pass.domElem.addEventListener('input',  f => {this.compare()} )
    this.pass_conf.domElem.addEventListener('input', f => {this.compare()} )
  }

  compare(){
    if( this.pass.isBlank() && this.pass_conf.isBlank() ){
      this.pass.blank()
      this.pass_conf.blank()
    } else if ( this.pass.value() == this.pass_conf.value() ){
      this.pass.correct()
      this.pass_conf.correct()
    } else {
      this.pass.incorrect()
      this.pass_conf.incorrect()
    }
  }
}

class Input{
  constructor(domElem){
    this.domElem = domElem
  }

  correct(){
    this.domElem.classList.add('correct')
    this.domElem.classList.remove('incorrect')
  }

  incorrect(){
    this.domElem.classList.add('incorrect')
    this.domElem.classList.remove('correct')
  }

  blank(){
    this.domElem.classList.remove('incorrect')
    this.domElem.classList.remove('correct')
  }

  isHide(){
    return this.domElem.classList.contains('hide')
  }

  isBlank(){
    return this.domElem.value == ''
  }

  classes(){
    return this.domElem.classList
  }

  value(){
    return this.domElem.value
  }
}

document.addEventListener('turbolinks:load', () => {
  if ($('#user_password_confirmation')){
    new Coincidence($('#user_password'), $('#user_password_confirmation'))
  }
})
