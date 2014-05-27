############################################################
#
#  Name:        Sean Glover
#  Assignment:  Extra Credit #1 - Coins
#  Date:        01/22/2013
#  Class:       CIS 282
#  Description: Prompt user for number of each type of coin and calculate total amount
#
############################################################

def menu
  puts
  puts "1. Total all coins"
  puts "2. Find number of coins"
  puts "3. Make change"
  puts
  puts "4. Quit"

  print "Please enter your selection: "
end

def count_coins(cash)
  coins = [["Quarters", 0.25, 0], ["Dimes", 0.10, 0], ["Nickels", 0.05, 0], ["Pennies", 0.01, 0]]

  coins.each do |value|
    value[2] = (cash / value[1]).to_i

    cash = (cash - (value[2] * value[1])).round(2)

    puts "#{value[0]}: #{value[2]}"
  end
end

option = 0

while option != 4
  menu
  option = gets.to_i

  if option == 1
    puts
    print "Please enter the number of Quarters: "
    quarters = gets.to_f
    print "Please enter the number of Dimes: "
    dimes = gets.to_f
    print "Please enter the number of Nickels: "
    nickels = gets.to_f
    print "Please enter the number of Pennies: "
    pennies = gets.to_f

    total = (quarters * 0.25) + (dimes * 0.10) + (nickels * 0.05) + (pennies * 0.01)
    puts "Total amount of money: #{sprintf("$%.2f", total)}"

  elsif option == 2
    puts
    print "Please enter the total amount in numbers (decimal ok): "
    cash = gets.to_f.round(2)

    count_coins(cash)

  elsif option == 3
    puts
    print "Please enter the total amount in numbers (decimal ok): "
    total = gets.to_f.round(2)
    print "Please enter the amount received in numbers (decimal ok): "
    received = gets.to_f.round(2)

    if received > total
      change = received - total
      puts "The change owed is: #{sprintf("$%.2f", change)}"
      puts
      print "Would you like to calculate the coins needed to make change? (y/n): "
      make_change = gets.chomp.downcase

      if make_change == "y"
        puts
        puts "You will need the following:"
        count_coins(change)
      end

    elsif received == total
      puts "There is no change needed."

    else
      puts "That is not enough money received."
      puts "Customer still owes: #{sprintf("$%.2f", (total - received))}"
    end
  end
end