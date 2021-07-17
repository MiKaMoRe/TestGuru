const $ = (elem) => document.querySelector(elem)

class Table{
  constructor(domElem){
    this.domElem = domElem
    this.rows = this.setRows()
    this.head = domElem.querySelector('tr')
    this.arrowUp = new Arrow(this.head.querySelector('.octicon-arrow-up'))
    this.arrowDown = new Arrow(this.head.querySelector('.octicon-arrow-down'))
    this.isDesc = true
  }

  setRows(){
    let rows = []
    Array
      .from(this.domElem.querySelectorAll('tr'))
      .forEach( (row, index) => {
        if (index == 0) {
          return
        }
        rows.push(new TableRow(row))
      })
    return rows
  }

  sortingDescRows(){
    let rows = []
    this.sortingRowsTitles().forEach( title => {
      this.rows.forEach( tr => {
        if( title == tr.getTitle() ){
          rows.push(tr)
        }
      })
    })
    this.arrowUp.hide()
    this.arrowDown.show()
    this.rows = rows
  }

  sortingAscRows(){
    this.rows.reverse()
    this.arrowUp.show()
    this.arrowDown.hide()
  }

  getTitles(){
    return this.rows.map(row => row.getTitle())
  }

  sortingRowsTitles(){
    return Array
      .from(this.rows)
      .map( tr => tr.getTitle() )
      .sort()
  }

  insertTable(target){
    target.innerHTML = ''
    target.appendChild(this.head)
    this.rows.forEach( row => {
      target.appendChild(row.domElem)
    })
  }
}

class TableRow{
  constructor(domElem){
    this.domElem = domElem
  }

  getTitle(){
    return this.domElem.querySelector('td').innerText
  }
}

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

document.addEventListener('turbolinks:load', () => {
  if ($('.sort-by-title')){
    const table = new Table($('table'))
    $('.sort-by-title').addEventListener('click', target => {
      table.isDesc ? table.sortingDescRows() : table.sortingAscRows()
      table.isDesc = !table.isDesc
      table.insertTable($('table tbody'))
    })
  }
})

