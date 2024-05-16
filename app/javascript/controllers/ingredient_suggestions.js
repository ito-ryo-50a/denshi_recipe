console.log("Hello from ingredient_suggestions.js!");

document.addEventListener("turbo:load", () => {
  const inputs = document.querySelectorAll('input[id^="ingredient"]');

  inputs.forEach(input => {
    input.addEventListener("input", function() {
      const query = this.value;
      console.log("Input value:", query);
      const suggestionsContainer = document.getElementById(`${this.id}_suggestions`);

      if (query.length > 0) {
        fetch(`/ingredients/search?query=${query}`)
          .then(response => response.json())
          .then(data => {
            console.log("Search results:", data);
            suggestionsContainer.innerHTML = '';
            data.forEach(item => {
              const div = document.createElement('div');
              div.textContent = item;
              div.className = "p-2 hover:bg-gray-200 cursor-pointer hover:text-blue-500 mx-1 my-1 rounded-md";
              div.addEventListener('click', () => {
                input.value = div.textContent;
                suggestionsContainer.innerHTML = '';
              });
              suggestionsContainer.appendChild(div);
            });
          })
          .catch(error => console.error('Error:', error));
      } else {
        suggestionsContainer.innerHTML = '';
      }
    });
  });
});
