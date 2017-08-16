# Create a class called BankAccount.
class BankAccount
  # Add a class variable called @@interest_rate
  #that is a float representing the interest rate
  #for all the accounts in the bank.
  #This is a class variable because it is
  # the same value for all accounts.
  @@interest_rate = 1.05
  # Add another class variable called @@accounts that starts as
  # an empty array. This will eventually store the list of all
  # bank accounts in the bank.

  @@accounts = []

  # You should also add reader and writer methods for balance to
  # your class.
  def balance
    @balance
  end

  def balance=(number)
    @balance = number
  end

  #  Balance is stored in an instance variable because
  # the value needs to be different from account to account.
  # Add an initialize instance method that sets @balance to zero.
  def initialize
    @balance = 0
  end

#Add an instance method called deposit that accepts a number as
# an argument and adds that amount to the account's balance.
#This needs to be an instance method because it pertains to a
#single, specific account.
  def deposit(amount_of_money)
    @balance += amount_of_money
  end
# Add an instance method called withdraw that accepts a number
# as an argument and subtracts that amount from the account's
# balance.
  def withdraw(withdraw)
     @balance -= withdraw
  end
# Add a class method called create that calls BankAccount.new
#and adds the new object to @@accounts so that we can find it
#again in the future. This method should return the new account
#object. This needs to be a class method because at the time we
#run it there is no single, specific account object that we are
# working on.
  def self.create
  new_account_variable = BankAccount.new
   @@accounts << new_account_variable
   return new_account_variable
  end
#Add a class method called total_funds that returns the sum of
# all balances across all accounts in @@accounts.This needs to
# be a class method because it does not pertain to any single,
# specific account.
  def self.total_funds
    sum = 0
    @@accounts.each do |account|
      sum += account.balance
    return sum
    end
  end
# Add a class method called interest_time that iterates through
# all accounts and increases their balances according to
#@@interest_rate.
  def self.interest_time
    @@accounts.each do |account|
      interest= account.balance * @@interest_rate
      account.deposit(interest)
    end
  end
end

puts new_account_object = BankAccount.create


puts BankAccount.total_funds
new_account_object.deposit(100)
puts BankAccount.total_funds
new_account_object.withdraw(50)
puts BankAccount.total_funds
BankAccount.interest_time
puts BankAccount.total_funds
