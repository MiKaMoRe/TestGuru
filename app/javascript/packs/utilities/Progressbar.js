class Progressbar{
  constructor(domElem){
    this.domElem = domElem
    this.completedElem = this.createCompletedElem(domElem)
  }

  createCompletedElem(domElem){
    const completedElem = document.createElement('div')
    completedElem.classList.add('complited')
    domElem.appendChild(completedElem)

    return completedElem
  }

  fill(){
    const data = this.domElem.dataset
    this.completedElem.style.width = `${data.currentQuestion / data.amountQuestions * 100}%`
  }


}

export default Progressbar
