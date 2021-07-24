class TableRow{
  constructor(domElem){
    this.domElem = domElem
  }

  getTitle(){
    return this.domElem.querySelector('td').innerText
  }
}

export default TableRow
