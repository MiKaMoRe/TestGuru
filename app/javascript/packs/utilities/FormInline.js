class FormInline{
  constructor(link, testTitle, formInline){
    this.link = link,
    this.testTitle = testTitle,
    this.formInline = formInline
  }

  isHide(){
    return this.formInline.classList.contains('hide')
  }

  show(){
    this.testTitle.classList.add('hide')
    this.formInline.classList.remove('hide')
    this.link.innerText = 'Cancel'
  }

  hide(){
    this.testTitle.classList.remove('hide')
    this.formInline.classList.add('hide')
    this.link.innerText = 'Edit'
  }
}

export default FormInline
