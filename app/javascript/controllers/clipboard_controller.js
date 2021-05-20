import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["source", "chars"]

  copy() {
    this.sourceTarget.select()
    document.execCommand("copy")
  }

  showSaved() {
    let saved = +localStorage.getItem('numOfChars') - 30
    this.charsTarget.innerText = `You saved ${saved} characters!`
    console.log(`You saved ${saved} characters!`);
  }
}