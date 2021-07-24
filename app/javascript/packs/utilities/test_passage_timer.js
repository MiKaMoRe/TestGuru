import Timer from '../entities/Timer'

const test_passage_timer = () => {
  if (document.querySelector('.timer')){
    const timerBlock = document.querySelector('.timer')
    const timer = new Timer(timerBlock, timerBlock.dataset.timeLeft)
    timer.timeSet()
    timer.start()
  }
}

export default test_passage_timer
