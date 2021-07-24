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

export default Input
