=begin
![GeneralAssemb.ly](https://github.com/generalassembly/ga-ruby-on-rails-for-devs/raw/master/images/ga.png "GeneralAssemb.ly")

Back-End Web Development
--------

##MIDTERM  REQUIREMENTS

Create a command line based application that fulfills these criteria:

-  Takes user input and handles bad input (i.e. You expect numbers and they give you a letter).
-	Connects to a 3rd party api where the call varies based on what the user gives you.
-	Must be object oriented. You must instantiate modeled classes. The only file that can run without classes is your runner.
-	Push code on Github.


##GRADING
Your midterm is considered completed if it meets all requirements above. Your instructor and T.A will provide you with feedback.


API Ideas:

*	Twitter search api
=end

require 'json'
require 'rest-client'

class Postcode
  attr_accessor :postcode_data
  def initialize
    @postcode_data
  end

#We are creating an instance of the class Postcode.
  def getsdata (postcode)
  postcode_data = RestClient.get('http://api.postcodes.io/postcodes/#{postcode}.json')
  hashofpostcode_data = JSON.parse(postcode_data)
  return resultsdata = hashofpostcode_data[2]
  puts finaldata = resultsdata.each {|key,value| puts "#{key} is #{value}"}
  end
end

# references to the relevant libraries and gems that we will need.

puts "What postcode would you like information on?"
postcode = gets.chomp

  if postcode =~ /\d/
  postcode_data = Postcode.new
  postcode_data.getsdata (postcode)
  else puts "That postcode is not valid."
  end


#We are creating a function that enables postcode data to be retrieved and returned. RestClient is a class. ‘gets’ is method of the class RestClient. ‘body’ is a pre-defined function of RestClient.

#We are now converting the above postcode_data object into a JSON hash and converting it into a readable Ruby object. {"status":200,"result":{"postcode":"HA5 3DX","quality":1,"eastings":512039,"northings":190506,"country":"England","nhs_ha":"London","admin_county":null,"admin_district":"Harrow","admin_ward":"Pinner","longitude":-0.383673152614618,"latitude":51.6022597983112,"parliamentary_constituency":"Ruislip, Northwood and Pinner","european_electoral_region":"London","primary_care_trust":"Harrow","region":"London","parish":null,"lsoa":"Harrow 009C","msoa":"Harrow 009","nuts":"Pinner","incode":"3DX","outcode":"HA5","ccg":"NHS Harrow CCG"}}

#The second line structures it in a hash.
#The third line puts each symbol/key into a new line


#Asks the user to key in a postcode The include method is making sure that the postcode includes both letters and numbers as in the UK you need both in a postcode.



