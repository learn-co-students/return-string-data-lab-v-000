products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]

10.times do
  products = ["tv", "vcr", "macbook", "macbook air", "mouse", "chair", "desk", "lamp", "water bottle"]
  Product.create(
    :name => products.sample,
    :price => Faker::Number.between(1,1500))
end
5.times do
  Customer.create(:name => Faker::Name.name)
end

5.times do
  Invoice.create
end
10.times do
  order = Order.create(:customer_id => Customer.all.collect(&:id).sample, :invoice_id => Invoice.all.collect(&:id).sample)
  order.products << Product.find(Product.all.collect(&:id).sample)
end

<script type="text/javascript" charset="utf-8">
  $(function() {
    $("#js-description").on('click', function() {
      // get the id from the data attribute
      // this. in an event, referes to the element (in this case, js-more)
      let id = $(this).data("id");
      $.get("/products/" + id + "/description", function(data) {
        console.log(data)
        //console.log($("#inventory-" + id).text(data))
        $("#description-" + id).html(data);
      });
    });
  });
</script>
