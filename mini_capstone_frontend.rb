require 'http'
require 'tty-prompt'
prompt = TTY::Prompt.new

puts "weclome to da sto"
choice = prompt.select("what do u wanna do", ["select a product", "view all products", "create a product", "update a product"])
if choice == "select a product"
  selection = prompt.select("choose a product ID: ", ["1", "2", "3"])
  response = HTTP.get("http://localhost:3000/products/#{selection}")
  response = response.parse(:json)
  pp response
elsif choice == "view all products"
  response = HTTP.get("http://localhost:3000/products")
  response = response.parse(:json)
  pp response
elsif choice == "create a product"
  puts "enter product name: "
  name = gets.chomp
  puts "enter a product price: "
  price = gets.chomp.to_i
  puts "enter a product image_url: "
  image_url = gets.chomp
  puts "enter a description: "
  description = gets.chomp
  puts "thank you!"
  send = HTTP.post("http://localhost:3000/products", :json => { :name => name, :price => price, image_url: image_url, description: description })
else
  puts "which product ID would you like to edit?"
  id = gets.chomp
  
  continue = true
  while continue
    edit = prompt.select("what would you like to edit, enter 'q' to escape", ["name", "price", "image url", "description", "q"])
    if edit == "name"
      puts "enter new name: "
      name = gets.chomp
    elsif edit == "price"
      puts "enter new price: "
      price = gets.chomp.to_i
    elsif edit == "image url"
      puts "enter new image url: "
      image_url = gets.chomp
    elsif edit == "description"
      puts "enter new description: "
      description = gets.chomp
    else
      continue = false
    end
  end
  update = HTTP.patch("http://localhost:3000/products/#{id}", :json => { :name => name, :price => price, image_url: image_url, descripton: description })

end


