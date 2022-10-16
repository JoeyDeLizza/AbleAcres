import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static get targets() {
	return ["toggelable"]
    }
    
    toggle() {
	console.log("hello")
	this.toggelableTarget.classList.toggle('hidden')
    }


}
