const $ = (elem) => document.querySelector(elem)
const $$ = (elem) => document.querySelectorAll(elem)

document.addEventListener('turbolinks:load', () => {
  if ($('.sort-by-title')){
    $('.sort-by-title').addEventListener('click', target => {
      let arrows = Array.from($$('.text-success'))
      const table_head = $('table tbody tr:first-child')
      let sorted_rows = []
  
      // Sorting titles
      const sorted_titles = Array
        .from($$('.filler'))
        .map( tr => tr.querySelector('td:first-child').innerText )
        .sort()
      
      // Sorting rows
      sorted_titles.forEach( title => {
        $$('.filler').forEach( tr => {
          if(title == tr.querySelector('td:first-child').innerText){
            sorted_rows.push(tr)
          }
        })
      })

      // Show first arrow
      if (arrows.every( arrow => arrow.classList.contains('hide') )){
        arrows[0].classList.toggle('hide')
      }

      // Reverse sorted rows
      if (arrows[0].classList.contains('hide')) {
        sorted_rows.reverse()
      }

      arrows.map( arrow => arrow.classList.toggle('hide'))
      sorted_rows.unshift(table_head)
      $('table tbody').innerHTML = ''

      // Add into document
      sorted_rows.forEach( row => {
        $('table tbody').appendChild(row)
      })
    })
  }
})

