require "sinatra"
require "pry" if development? || test?
require "sinatra/reloader" if development?

set :bind, '0.0.0.0'  # bind to all interfaces

# The MAGICAL_CREATURES variable is an array of hashes, and can be accessed from an of your routes.
MAGICAL_CREATURES = [
  {
    name: "Unicorn",
    ability: "Its horn is said to have the power to render poisoned water potable and heal sickness.",
    age: 140
  },
  {
    name: "Dragon",
    ability: "Breathes fire and has a hide of scales that is near impenetrable.",
    age: 587
  },
  {
    name: "Phoenix",
    ability: "When it is old and weary, its body ignites in flame and it arises anew from the ashes of its predecessor.",
    age: nil
  }
]

get "/" do
  erb :home
end

get "/creatures" do
  @creatures_list = ""
  erb :creatures
end

get "/creatures/:name" do
  @selected_creature = MAGICAL_CREATURES.find do |creature|
    creature[:name] == params[:name]
  end

  @creature_stats = ""
  erb :creature_info
end
