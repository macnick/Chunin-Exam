import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['link', 'counter'];

  countChar() {
    let numOfChars = this.linkTarget.value.length;
    this.counterTarget.innerText = numOfChars;
    localStorage.setItem('numOfChars', `${numOfChars}`)
  }

}