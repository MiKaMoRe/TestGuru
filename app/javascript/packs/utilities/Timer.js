class Timer{
  constructor(domElem, amountSeconds){
    this.amountSeconds = amountSeconds
    this.domElem = domElem
    this.hours = this.domElem.querySelector('.hours')
    this.minutes = this.domElem.querySelector('.minutes')
    this.seconds = this.domElem.querySelector('.seconds')
  }

  timeSet(){
    const hours = Math.floor(this.amountSeconds / 60 / 60)
    const minutes = Math.floor(this.amountSeconds / 60) - hours * 60
    const seconds = this.amountSeconds - hours * 60 - minutes * 60

    this.hours.innerText = hours
    this.minutes.innerText = minutes
    this.seconds.innerText = seconds
  }
}

export default Timer
