import Progressbar from './Progressbar'

const testProgressbar = () => {
  if (document.querySelector('.test-progressbar')) {
    const progressbar = new Progressbar(document.querySelector('.test-progressbar'))
    progressbar.fill()
  }
}

export default testProgressbar
