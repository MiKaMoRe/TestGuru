import Table from '../entities/Table'

const sorting = () => {
  if (document.querySelector('.sort-by-title')){
    const table = new Table(document.querySelector('table'))

    document.querySelector('.sort-by-title').addEventListener('click', target => {
      table.isDesc ? table.sortingDescRows() : table.sortingAscRows()
      table.isDesc = !table.isDesc
      table.insertTable(document.querySelector('table tbody'))
    })
  }
}

export default sorting
