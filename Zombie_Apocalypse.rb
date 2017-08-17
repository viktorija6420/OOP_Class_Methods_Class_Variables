class Zombie
  @@horde = [] #should eventually contain collection of zombies

  @@plague_level = 10 #will be used to determine the rate
  #at which new zombies are spawned. This value will increase over time.

  @@max_speed = 5   #indicates the maximum value for the speed attribute of any
  # zombie.
  @@max_strength = 8 #and indicates the maximum value for the strenth attribute
  # of any zombie.

  @@default_speed = 1
  @@default_strength = 3

  # This instance method should take two integer arguments: one for the zombie's
  #speed attribute and one for its strength. If the speed argument is greater than
  # @@max_speed then @@default_speed should be used as the new zombie's speed
  # instead. Similarly, you should check to make sure the strength argument is
  #less than or equal to @@max_strength, otherwise @@default_strength should be
  #used as the new zombie's strength attribute.

  def zombie_speed
    @zombie_speed
  end

  def zombie_strength
   @zombie_strength
  end

  def initialize (zombie_speed, zombie_strength)#instance method

    @zombie_strength = zombie_strength
    @zombie_speed = zombie_speed

    if @zombie_speed > @@max_speed
     new_zombie_speed = @@default_speed
   elsif @zombie_strength <= @@max_strength
     new_zombie_strength = @@default_strength
   end

  end

#Should it be a setter or a writer or both?
#encounter
# This instance method represents you coming across a zombie! This can end in
#three possible outcomes: 1. escaping unscathed 2. being killed by the zombie 3.
# catching the plague and becoming a zombie yourself.

# This method should call outrun_zombie? (see below) and survive_attack?
#(see also below) to determine which scenario applies. In the case that you
#are turned into a zombie (ie. you don't outrun the zombie but you aren't killed
# by it), create a new zombie object (that's you!) and add it to the @@horde.
# In all three cases you should return a string that describes what happened
# to you in the encounter (eg. "You escaped!").

  def encounter#instance method

    if !survive_attack?
      "You died."
    elsif !outrun_zombie?
      "You have been chased down."
      new_zombie_object = Zombie.new(30, 40)
      @@horde << new_zombie_object
    else
      "I survived."
    end
  end

  # outrun_zombie?
  # This instance method should use @@max_speed to generate a random number that
  # represents how fast you manage to run from this particular zombie. This
  #method should return true if your speed is greater than the zombie's and
  #false otherwise.
  def outrun_zombie?#instance method
    human_speed = rand(@@max_speed)
    if human_speed > zombie_speed
      return true
    else
      return false
    end
  end

  # survive_attack?
  # This instance method should use @@max_strength to generate a random number
  # that represents how well you are able to fight off this zombie. This method
  # should return true if your speed is greater than the zombie's and false
  # otherwise.
  def survive_attack? #instance method
    human_strength = rand(@@max_strength)
    if human_strength > zombie_speed
      return true
    else
      return false
    end
  end

# This class method should return the value of @@horde.
  def self.all #class method
    @@horde
  end

  # new_day
  # This class method represents the events of yet another day of the zombie
  #apocalypse. Every day some zombies die off (phew!), some new ones show up,
  #and sometimes the zombie plague level increases. In order to accomplish this,
  # new_day should call some_die_off, spawn, and increase_plague_level.
  def self.new_day
    some_die_off
    spawn
    increase_plague_level  #should they be with @ at all?
  end

  #some_die_off
  # This class method should generate a random number between 0 and 10 and
  #remove that number of zombies from @@horde (hint: you may want to check the
  # Array docs for methods that could help you accomplish this).
  def self.some_die_off
    rand(10).times do
      @@horde.pop
    end
  end


  # spawn
  #This class method should use @@plague_level to generate a random number and then
  # create that number of new zombies, adding each one to @@horde. Use @@max_speed
  #and @@max_strength to generate random values for each new zombie's speed and
  # strength.
  def self.spawn
      spawn_number_of_zombies = rand(@@plague_level)
      spawn_number_of_zombies.times do
        random_value_speed = rand(@@max_speed)
        random_value_strength = rand(@@max_strength)
        zombieA = Zombie.new(random_value_speed, random_value_strength)
        @@horde << zombieA
      end
#Does it need to be initialized to be a ran value i.e. (@@max_speed)??
  end

  # increase_plague_level
  # This class method should generate a random number between 0 and 2 and increase
  # @@plague_level by that amount.
  def self.increase_plague_level
     @@plague_level += rand(2)  #class method
  end

end

zombie = Zombie.new(40,30)
puts zombie.zombie_speed
puts zombie.outrun_zombie?
puts zombie.survive_attack?
puts Zombie.spawn
puts Zombie.all
puts "Somebody please die."

puts Zombie.some_die_off
puts Zombie.all
puts Zombie.new_day
puts Zombie.increase_plague_level
