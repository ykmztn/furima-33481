window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

  const addTaxDom = document.getElementById("add-tax-price");
    const addTaxValue = (Math.floor(inputValue * 0.1));
    addTaxDom.innerHTML = addTaxValue;
    console.log(addTaxValue);

    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = (Math.floor(inputValue - addTaxValue));
    console.log(saleProfit);

  })
});
