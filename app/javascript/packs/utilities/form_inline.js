import FormInline from '../entities/FormInline'

const form_inline = () => {
  const controls = document.querySelectorAll('.form-inline-link')

  const formInlineLinkHandler = (id) => {
    const form = new FormInline(
      document.querySelector(`.form-inline-link[data-test-id='${id}']`),
      document.querySelector(`.test-title[data-test-id='${id}']`),
      document.querySelector(`.form-inline[data-test-id='${id}']`)
    )
    form.isHide() ? form.show() : form.hide()
  }
  
  if (controls.length){
    controls.forEach((control) => {
      control.addEventListener('click', event => {
        event.preventDefault()
        const testId = control.dataset.testId
        formInlineLinkHandler(testId)
      })
    })
  }

  const errors = document.querySelector('.resource-errors')

  if (errors){
    const resourceId = errors.dataset.resourceId
    formInlineLinkHandler(resourceId)
  }
}

export default form_inline
