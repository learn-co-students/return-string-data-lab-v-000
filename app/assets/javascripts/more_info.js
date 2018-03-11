$(function () {
  $(document).on("click", ".more_info", async function (event) {
    const productInventory = getProductInventory(this)
    const productDescription = getProductDescription(this)
    const inventory = (await productInventory === "true" ? "Available" : "Sold Out")
    this.outerHTML = `<br>${inventory}<br>${await productDescription}`
  });
})

async function getProductInventory(productButton) {
  const inventoryResponse = await fetch(productButton.dataset.productInventoryUrl)
  return inventoryResponse.text()
}

async function getProductDescription(productButton) {
  const descriptionResponse = await fetch(productButton.dataset.productDescriptionUrl)
  return descriptionResponse.text()
}