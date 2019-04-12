# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
$mobile_number = 1111111111
$last_mobile_number = 9999999999

while $mobile_number <= $last_mobile_number  do
   MobileNumber.create(mobile_number: $mobile_number)
   $mobile_number +=1
end
