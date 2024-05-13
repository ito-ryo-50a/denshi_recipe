import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "suggestions"]
  connect() {
    console.log("Ingredients controller 接続できています！");
  }
  update() {
    const input = this.inputTarget.value;
    if (input.length > 0) {
      fetch(`/ingredients/search?query=${input}`)
        .then(response => response.json())
        .then(data => {
          this.suggestionsTarget.innerHTML = '';
          data.forEach(item => {
            const div = document.createElement('div');
            div.textContent = item;
            div.className = "p-2 hover:bg-gray-200 cursor-pointer hover:text-blue-500 mx-1 my-1 rounded-md";
            div.addEventListener('click', () => {
              this.inputTarget.value = div.textContent;
              this.suggestionsTarget.innerHTML = '';
            });
            this.suggestionsTarget.appendChild(div);
          });
        })
        .catch(error => console.error('Error:', error));
    } else {
      this.suggestionsTarget.innerHTML = '';
    }
  }
}
