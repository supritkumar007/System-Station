const products = [
    { name: "dell 1", available: true },
    { name: "hp 2", available: true },
    { name: "asus 3", available: true },
    // Add more products as needed
];

const searchInput = document.getElementById("searchInput");
const searchResults = document.getElementById("searchResults");

searchInput.addEventListener("input", () => {
    const query = searchInput.value.toLowerCase();
    const filteredProducts = products.filter(product => 
        product.name.toLowerCase().includes(query) && product.available
    );

    displayResults(filteredProducts);
});

function displayResults(results) {
    searchResults.innerHTML = "";
    if (results.length === 0) {
        searchResults.innerHTML = "<p>No results found</p>";
        return;
    }

    results.forEach(product => {
        const productElement = document.createElement("div");
        productElement.textContent = product.name;
        searchResults.appendChild(productElement);
    });
}