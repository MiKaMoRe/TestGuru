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

    this.hours.innerText = hours < 0 ? 0 : hours
    this.minutes.innerText = minutes < 0 ? 0 : minutes
    this.seconds.innerText = seconds < 0 ? 0 : seconds
  }

  start(){
    setInterval( () => { this.change_time() } , 1000)
  }

  change_time(){
    this.amountSeconds -= 1
    this.timeSet()
  }
}

export default Timer
