class Vampire
  @@coven = []


  def self.coven
    @@coven
  end



  def initialize(name,age) #creates a vampire and assigns values for each of its attributes
    @name = name
    @age = age
    @in_coffin = false
    @drank_blood_today
  end

  def drank_blood_today
    @drank_blood_today
  end

  def in_coffin
    @in_coffin
  end

  def self.create(name,age) #creates a new vampire and adds it to the coven
    new_vampire = Vampire.new(name,age)
    @@coven << new_vampire
    return new_vampire
  end
# sets a vampire's drank_blood_today boolean to true
  def drink_blood
    @drank_blood_today = true
  end
# removes from the coven any vampires who are out of their coffins or who
# haven't drank any blood in the last day
  def self.sunrise
    @@coven.each do |vampire|
      if !vampire.in_coffin && !vampire.drank_blood_today
        puts "Deleting this vampire."
        @@coven.delete(vampire)
      end
    end
  end
# sets drank_blood_today to true and in_coffin to false for the entire coven as they
 # go out in search of blood
  def self.sunset
    @@coven.each do |vampire|
      vampire.drank_blood_today = true
      vampire.in_coffin = false
    end
  end
# sets a vampire's in_coffin boolean to true
  def go_home
    @in_coffin = true
  end
end


new_vampire = Vampire.create("Michael", 23)
puts new_vampire
puts new_vampire.in_coffin
# puts new_vampire.drink_blood
puts Vampire.sunrise
puts new_vampire.drink_blood
puts Vampire.sunset
puts new_vampire.go_home
