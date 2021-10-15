class Arrow{
  constructor(domElem){
    this.domElem = domElem
  }

  hide(){
    this.domElem.classList.remove('hide')
  }

  show(){
    this.domElem.classList.add('hide')
  }
}

export default Arrow
