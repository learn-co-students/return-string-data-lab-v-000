# Returning Strings Lab

## Objectives

  1. Return a string from a route.
  2. Use that string and replace the inner HTML of a div.

## Introduction

Included in the lab is a simple Order/Invoice/Customer application.
We're going to use what we've learned so far to add API endpoints and
use AJAX to bring data to the page.

## Instructions

1. Add a product `description` and an `inventory` count to the `Product`
   model.
2. Create an index page for all products that displays name and a truncated description, but not inventory.
3. Create the new product page so you can add new products, otherwise the rest of this might be kind of underwhelming!
4. Add a route and action that gets just a product description as a
   plain string.
5. Add another route and action that checks if inventory is available.
   This route should return just `"true"` or `"false"` as strings.
6. Add a "More Info" button to each product that, when clicked, fetches
   the description and the inventory and displays the result. If there
is inventory available, display "Available" and if there isn't, display
"Sold Out".
7. Make sure tests pass!

**Note:** You will need to have [Firefox](https://www.mozilla.org/en-US/firefox/new/) installed for the feature specs, which use the [selenium-webdriver](https://github.com/SeleniumHQ/selenium/tree/master/rb) gem to test pages with JavaScript requirements.
