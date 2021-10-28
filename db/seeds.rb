Supplier.create!([
  {name: "BikeShop", email: "bikeshop@email.com", phone_number: "839-741-3812"},
  {name: "ScootersRus", email: "scooters@Rus.com", phone_number: "143-984-2983"}
])
Product.create!([
  {name: "bike", price: "699.0", description: "its a bike", inventory: 4, supplier_id: 1},
  {name: "scooter", price: "99.0", description: "its a scooter", inventory: 5, supplier_id: 2},
  {name: "grease", price: "9.0", description: "grease for bikes and things that use grease.", inventory: 11, supplier_id: 1},
  {name: "electric scooter", price: "900.0", description: "its a scooter, with electricity.", inventory: 2, supplier_id: 2},
  {name: "bike chain", price: "50.0", description: "its a bike chain", inventory: 0, supplier_id: 1},
  {name: "bike tire", price: "59.0", description: "a bike tire", inventory: 12, supplier_id: 1},
  {name: "Gas can", price: "24.99", description: "can of gas", inventory: 0, supplier_id: 1}
])
Image.create!([
  {url: "https://www.ghost-bikes.com/fileadmin/_processed_/8/c/csm_ghost-bikes-Riot-Trail-essential-black-black-45_38d9fe71b8.png", product_id: 1},
  {url: "https://cdn.shopify.com/s/files/1/0018/7616/4681/products/Dualtron-Storm-Electric-Scooter-Profile_1600x.jpg?v=1599679050", product_id: 2},
  {url: "https://bikevscycle.com/wp-content/uploads/2020/09/Bike-grease-1.jpg", product_id: 3},
  {url: "https://americanqualityhealthproducts.com/37531-big_default/gatsby-4-wheel-scooter-by-vintage-vehicles-usa.jpg", product_id: 4},
  {url: "https://www.wigglestatic.com/product-media/103283250/KMC-E101-EPT-Single-Speed-E-Bike-Chain-Chains-Silver-BE101EP12.jpg?w=1200&h=1200&a=7", product_id: 5},
  {url: "https://m.media-amazon.com/images/I/8185MMhNVYL._AC_SL1500_.jpg", product_id: 6}
])
Category.create!([
  {name: "Bikes"},
  {name: "Scooters"},
  {name: "Bike parts"}
])
ProductCategory.create!([
  {product_id: 1, category_id: 1},
  {product_id: 1, category_id: 3},
  {product_id: 2, category_id: 2},
  {product_id: 3, category_id: 3},
  {product_id: 4, category_id: 2},
  {product_id: 5, category_id: 3},
  {product_id: 6, category_id: 3},
  {product_id: 7, category_id: 3}
])
User.create!([
  {name: "dude", email: "dude@test.com", password_digest: "$2a$12$qALz46A3xZ40yFo93XmxVepmzp3ImE5UqHrH63ihDzrud4NVu/DYC", admin: false},
  {name: "ian", email: "ian@example.com", password_digest: "$2a$12$lTYCJmMga2yIBmysYztqSuiJ8p9cpbFOHfQ.19z3uoYoaB8SXuG.u", admin: false}
])
Order.create!([
  {user_id: 1, product_id: 3, quantity: 2},
  {user_id: 2, product_id: 5, quantity: 4}
])
