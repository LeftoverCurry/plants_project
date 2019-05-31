require "yaml"
require "Date"
#Collecting Crop information
class OutsidePlant


def initialize
  puts "What plant would you like to add?"
  @plant_name = gets.chomp.downcase

  puts "How many times a week does it need watering?"
  @water_freq = gets.chomp.to_i
    if @water_freq == 1
      @dotw = ["Monday"]
    elsif @water_freq == 2
      @dotw = ["Monday", 'Friday']
    elsif @water_freq == 3
      @dotw = ["Monday", 'Wednesday', 'Friday']
    elsif @water_freq == 4
      @dotw = ["Monday", 'Wednesday', 'Thursday', 'Saturday']
    elsif @water_freq == 5
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Saturday']
    elsif @water_freq == 6
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    elsif @water_freq == 7
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    else
      puts "I'm sorry, please enter 1-7."
        initialize
    end
  
  puts "What kind of food does it take?"
  @food_type = gets.chomp.downcase

  puts "How often should it be fed per month?"
  @food_freq = gets.chomp.to_i
  if @food_freq < 1
  puts "Please enter a whole number.  If your plant needs to be fed less than once a month," 
  puts "enter '1' and I will remind you on the first of the month." 
  initialize
  elsif @food_freq == 1
    @food_day = [1,]
  elsif @food_freq == 2
    @food_day = [1, 15]
  elsif @food_freq == 3
    @food_day = [1, 11, 21]
  elsif @food_freq == 4
    @food_day = [1, 8, 16, 24] 
  elsif @food_freq == 5
    @food_day = [1, 7, 14, 21, 28]
  elsif @food_freq == 6
    @food_day = [1, 6, 12, 18, 24, 28]
  elsif @food_freq == 7
    @food_day = [1, 5, 10, 16, 22, 24, 28]
  elsif @food_freq == 8
    @food_day == [1, 4, 8, 11, 15, 18, 22, 25]
  elsif @food_freq >= 9
    puts "You are probably feeding your plant too much, but I will remind you every day."
    @food_day = "Too much tuna"
  end
      

  puts "Does it have any special care needs? Y/N?"
  @resp_spec_care = gets.chomp.downcase
  if @resp_spec_care == "yes" || @resp_spec_care == "y"
    puts "What special care does it need?"
    @spec_care = gets.chomp
    puts "How often per week?"
    @spec_care_freq = gets.chomp.to_i
    if @spec_care_freq == 1
      @spec_care_day = ["Monday"]
    elsif @spec_care_freq == 2
      @spec_care_day = ["Monday", 'Friday']
    elsif @spec_care_freq == 3
      @spec_care_day = ["Monday", 'Wednesday', 'Friday']
    elsif @spec_care_freq == 4
      @spec_care_day = ["Monday", 'Wednesday', 'Thursday', 'Saturday']
    elsif @spec_care_freq == 5
      @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Saturday']
    elsif @spec_care_freq == 6
      @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    elsif @spec_care_freq == 7
      @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    else
      puts "I'm sorry, please enter 1-7."
        initialize
    end


  else
    puts "Okay, then."
  end
  respond_to_input
end

def respond_to_input
  puts "So, your #{@plant_name} plant needs to be watered #{@water_freq.to_s} times a week,"
  puts "should be fed #{@food_type} #{@food_freq.to_s} times per month?"
  
  if @resp_spec_care == "yes" || @resp_spec_care == "y"
    puts "Its special care instructions are: '#{@spec_care}' and this should"
    puts "be done #{@spec_care_freq} times per week?"
  end

  puts "Yes or no?"
  user_input_resp = gets.chomp.downcase

  if user_input_resp == "yes" || user_input_resp == "y"
    puts "Adding to the database..."
    #converting responses to a hash
    

    crop_hash = {'name' => "#{@plant_name}",
                  'dotw' => "#{@dotw}",
                  'food_type' => "#{@food_type}",
                  'food_day' => "#{@food_day}",
                  'is_succ' => false}
      if @resp_spec_care == "yes" || @resp_spec_care == "y"
        crop_hash["spec_care"] = "#{@spec_care}"
        crop_hash["spec_care_day"] = "#{@spec_care_day}"
      else
        crop_hash["spec_care"] = "none"
        crop_hash["spec_care_day"] = "0"
      end
#converting hash to an outside file so we can store it between uses
   
    
    yaml_stream = File.open("/Users/Ron/Desktop/Plants/saved_plants/yaml_test.yml", "a")
    YAML.dump(this_crop = crop_hash, yaml_stream)
    yaml_stream.close

    puts "Saved!"
  
  elsif user_input_resp == "no" || user_input_resp == "n"
    puts "I'm sorry, let's try again!"
     initialize 
  
  else 
    puts "I'm so sorry, I didn't understand that."
    respond_to_input 
  end
end

end


#Collecting Houseplant information
class Houseplant 

def initialize
  puts "What plant would you like to add?"
  @plant_name = gets.chomp.downcase

  
  def ask_succ
   puts "Is this a succulent?"
    succ_response = gets.chomp.downcase
    if succ_response == "yes" || succ_response == "y"
      @is_succ = true
    elsif succ_response == "no" || succ_response == "n"
      @is_succ = false
      puts "How many times a week does it need watering?"
      @water_freq = gets.chomp.to_i
    else 
      puts "I'm sorry, I didn't get that."
      ask_succ
    end
  end

  ask_succ

  puts "What kind of food does it take?"
  @food_type = gets.chomp.downcase

  puts "How often should it be fed per month?"
  @food_freq = gets.chomp.to_i
  if @food_freq < 1
  puts "Please enter a whole number.  If your plant needs to be fed less than once a month," 
  puts "enter '1' and I will remind you on the first of the month." 
  initialize
  elsif @food_freq == 1
    @food_day = [1,]
  elsif @food_freq == 2
    @food_day = [1, 15]
  elsif @food_freq == 3
    @food_day = [1, 11, 21]
  elsif @food_freq == 4
    @food_day = [1, 8, 16, 24] 
  elsif @food_freq == 5
    @food_day = [1, 7, 14, 21, 28]
  elsif @food_freq == 6
    @food_day = [1, 6, 12, 18, 24, 28]
  elsif @food_freq == 7
    @food_day = [1, 5, 10, 16, 22, 24, 28]
  elsif @food_freq == 8
    @food_day == [1, 4, 8, 11, 15, 18, 22, 25]
  elsif @food_freq >= 9
    puts "You are probably feeding your plant too much, but I will remind you every day."
    @food_day = "Too much tuna"
  end

  puts "Does it have any special care needs? Y/N?"
  @resp_spec_care = gets.chomp.downcase
  

  if @resp_spec_care == "yes" || @resp_spec_care == "y"
  puts "What special care does it need?"
  @spec_care = gets.chomp
  puts "How often per week?"
  @spec_care_freq = gets.chomp.to_i
  if @spec_care_freq == 1
    @spec_care_day = ["Monday"]
  elsif @spec_care_freq == 2
    @spec_care_day = ["Monday", 'Friday']
  elsif @spec_care_freq == 3
    @spec_care_day = ["Monday", 'Wednesday', 'Friday']
  elsif @spec_care_freq == 4
    @spec_care_day = ["Monday", 'Wednesday', 'Thursday', 'Saturday']
  elsif @spec_care_freq == 5
    @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Saturday']
  elsif @spec_care_freq == 6
    @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
  elsif @spec_care_freq == 7
    @spec_care_day = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
  else
    puts "I'm sorry, please enter 1-7."
      initialize
  end
  
  else
    puts "Okay, then."
  end
  respond_to_input
end

def respond_to_input
  if @is_succ == true
    puts puts "So, your #{@plant_name} plant needs to be watered sparingly as needed and should be fed #{@food_type} #{@food_freq.to_s} times per month?"
  
    if @resp_spec_care == "yes" || @resp_spec_care == "y"
      puts "Its special care instructions are: '#{@spec_care}' and this should"
      puts "be done #{@spec_care_freq} times per week?"
    end

  else
    puts "So, your #{@plant_name} plant needs to be watered #{@water_freq.to_s} times a week,"
    puts "should be fed #{@food_type} #{@food_freq.to_s} times per month?"
  
    if @resp_spec_care == "yes" || @resp_spec_care == "y"
      puts "Its special care instructions are: '#{@spec_care}' and this should"
      puts "be done #{@spec_care_freq} times per week?"
    end
  end
  puts "Yes or no?"
  user_input_resp = gets.chomp.downcase

  if user_input_resp == "yes" || user_input_resp == "y"
    puts "Adding to the database."
    if @water_freq == 1
      @dotw = ["Monday"]
    elsif @water_freq == 2
      @dotw = ["Monday", 'Friday']
    elsif @water_freq == 3
      @dotw = ["Monday", 'Wednesday', 'Friday']
    elsif @water_freq == 4
      @dotw = ["Monday", 'Wednesday', 'Thursday', 'Saturday']
    elsif @water_freq == 5
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Saturday']
    elsif @water_freq == 6
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
    elsif @water_freq == 7
      @dotw = ["Monday", 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
    elsif @is_succ == true
      @dotw = ""
    else
      puts "I'm sorry, please enter 1-7."
        initialize
    end
crop_hash = {'name' => "#{@plant_name}",
                  'dotw' => "#{@dotw}",
                  'food_type' => "#{@food_type}",
                  'food_day' => "#{@food_day}"}
      if @resp_spec_care == "yes" || @resp_spec_care == "y"
        crop_hash["spec_care"] = "#{@spec_care}"
        crop_hash["spec_care_day"] = "#{@spec_care_day}"
      else
        crop_hash["spec_care"] = "none"
        crop_hash["spec_care_day"] = "0"
      end
      if @is_succ == true
        crop_hash['is_succ'] = true
      else 
        crop_hash['is_succ'] = false
      end
#converting hash to an outside file so we can store it between uses
   
    
    yaml_stream = File.open("/Users/Ron/Desktop/Plants/saved_plants/yaml_test.yml", "a")
    YAML.dump(this_crop = crop_hash, yaml_stream)
    yaml_stream.close

    puts "Saved!"

  elsif user_input_resp == "no" || user_input_resp == "n"
    puts "I'm sorry, let's try again!"
     initialize 
  else 
    puts "I'm so sorry, I didn't understand that."
    respond_to_input 
  end
end
end



#here we determine what day of the week it is


today = Date::DAYNAMES[Date.today.wday]
month_day = Date.today.mday
#Here we pull the files of the plants we have saved, open the files and compare the number of times they need to be watered, fed, and 
# cared for per week to the algorithm for what day they would be fed on.

YAML.load_stream (File.open('/Users/Ron/Desktop/Plants/saved_plants/yaml_test.yml')) do |doc|
  if doc['dotw'].include?(today)
    puts "It's time to water your #{doc['name']}"
  elsif doc['is_succ'] == true && today == 'Thursday'
    puts "You might want to check your #{doc['name']}"
  end

  if doc['food_day'].include?(month_day.to_s)
    puts "You need to feed your #{doc['name']} its #{doc['food_type']}."
  end

  if doc['spec_care_day'].include?(today)
    puts "Your #{doc['name']} needs the following special care today: #{doc['spec_care']}"
  end
end

# Here we ask if the user would like to add, delete, or edit any of their plants and branch
# off to those various paths or exit out if they do not
puts "Would you like to add a plant?"
edit_plants_resp = gets.chomp.downcase

if edit_plants_resp == 'no' || edit_plants_resp == 'n'
  puts "Thanks! Have a great day!"
  exit
elsif edit_plants_resp == 'yes' or edit_plants_resp == 'y'
  
      puts "Would you like to enter a houseplant or an outdoor plant?"
      puts "H = Houseplant"
      puts "O = Outdoor Plant/Crop"
      plant_type = gets.chomp.downcase

      if plant_type == "h"
        newplant = Houseplant.new 
      elsif plant_type == "o"
        newplant = OutsidePlant.new
      else
        puts "Try again later."
      end
end

