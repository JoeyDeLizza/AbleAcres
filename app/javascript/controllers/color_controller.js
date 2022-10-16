import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static get targets() {
	return ["colorclass"]
    }
    
    changeColor() {
	console.log(this.colorclassTarget)
	this.colorclassTarget.classList.toggle('bg-slate-400')
    }


}
