import Input  from "./Input"

class Coincidence{
  constructor(pass, pass_conf){
    this.pass = new Input(pass),
    this.pass_conf = new Input(pass_conf)
    this.pass.domElem.addEventListener('input',  f => {this.compare()} )
    this.pass_conf.domElem.addEventListener('input', f => {this.compare()} )
  }

  compare(){
    if( this.pass.isBlank() && this.pass_conf.isBlank() ){
      this.pass.blank()
      this.pass_conf.blank()
    } else if ( this.pass.value() == this.pass_conf.value() ){
      this.pass.correct()
      this.pass_conf.correct()
    } else {
      this.pass.incorrect()
      this.pass_conf.incorrect()
    }
  }
}

export default Coincidence
