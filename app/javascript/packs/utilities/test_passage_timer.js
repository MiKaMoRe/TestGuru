import Timer from './Timer'

const test_passage_timer = () => {
  if (document.querySelector('.timer')){
    const timerBlock = document.querySelector('.timer')
    const timer = new Timer(timerBlock, timerBlock.dataset.timeLeft)
    timer.timeSet()
    setInterval( () => { change_time(timer) } , 1000)
  }
}

const change_time = (timer) => {
  timer.amountSeconds -= 1
  timer.timeSet()
}

export default test_passage_timer
