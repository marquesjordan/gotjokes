# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

profiles = Profile.create([
  {name: "T Swizzle", videos: "none", image: "none", location: "Santa Monica, CA", bio:"I wanna make you smile gurl"}, 
  {name: "Croisant Face", videos: "none", image: "none", location: "Palmdale, CA", bio:"I wanna make you cry gurl"},
  {name: "Chizzled Abs", videos: "none", image: "none", location: "Venice, CA", bio:"I wanna make you fee; gurl"},
  {name: "FoolsRus", videos: "none", image: "none", location: "Culver City, CA", bio:"I wanna make you want me gurl"},
  ])

usercomments = UserComment.create([{
  description: "your joke was funny"
  }])  

categories = Category.create([
{name: "Clean & Corny", description: "Nice clean jokes"},
{name: "Dark & Dirty", description: "Not for the fainted-hearted"},
{name: "Child's Play", description: "Kid-friendly"},
{name: "PG-13", description: "age 13 yrs or older recommended"},
{name: "Rated-R", description: "age 17 yrs or older recommended"},
])