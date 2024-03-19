# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Driver.create(name:"Divy",age:21,gender:"Male",marry:"Single",car:"Audi Q3",color:"Red")
Driver.create(name:"Om",age:22,gender:"Male",marry:"Married",car:"BMW X3",color:"Blue")
Driver.create(name:"Tujal",age:20,gender:"Male",marry:"Single",car:"Mercedes S550d",color:"Pink")
Driver.create(name:"Divyansh",age:27,gender:"Male",marry:"Divorce",car:"Suzuki Swift",color:"Marron")
