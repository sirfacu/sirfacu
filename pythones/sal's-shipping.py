#Sal's Shipping
#Sal runs the biggest shipping company in the tri-county area, Sal’s Shippers. Sal wants to make sure that every single one of his customers has the best, and most affordable experience shipping their packages.
#
#In this project, you’ll build a program that will take the weight of a package and determine the cheapest way to ship that package using Sal’s Shippers.
#
#Sal’s Shippers has several different options for a customer to ship their package:
#
#Ground Shipping, which is a small flat charge plus a rate based on the weight of your package.
#Ground Shipping Premium, which is a much higher flat charge, but you aren’t charged for weight.
#Drone Shipping (new), which has no flat charge, but the rate based on weight is triple the rate of ground shipping.
#Here are the prices:
#
#Ground Shipping
#
#Weight of Package	Price per Pound	Flat Charge
#2 lb or less	$1.50	$20.00
#Over 2 lb but less than or equal to 6 lb	$3.00	$20.00
#Over 6 lb but less than or equal to 10 lb	$4.00	$20.00
#Over 10 lb	$4.75	$20.00
#
#Ground Shipping Premium
#
#Flat charge: $125.00
#
#Drone Shipping
#
#Weight of Package	Price per Pound	Flat Charge
#2 lb or less	$4.50	$0.00
#Over 2 lb but less than or equal to 6 lb	$9.00	$0.00
#Over 6 lb but less than or equal to 10 lb	$12.00	$0.00
#Over 10 lb	$14.25	$0.00
#
#Write a shipping.py Python program that asks the user for the weight of their package and then tells them which method of shipping is cheapest and how much it will cost to ship their package using Sal’s Shippers.
#
#Note that the walkthrough video for this project is slightly out of date — the walkthrough was done using a version of this project that uses functions. Feel free to come back to the video after having been introduced to functions!

def ground_shipping_cost(weight):
    if weight <= 2:
        return weight * 1.5 + 20
    elif weight <= 6:
        return weight * 3.0 + 20
    elif weight <= 10:
        return weight * 4.0 + 20
    else:
        return weight * 4.75 + 20

def drone_shipping_cost(weight):
    if weight <= 2:
        return weight * 4.5
    elif weight <= 6:
        return weight * 9.0
    elif weight <= 10:
        return weight * 12.0
    else:
        return weight * 14.25

def main():
    weight = 8.8
    
    ground_cost = ground_shipping_cost(weight)
    premium_cost = 125.0
    drone_cost = drone_shipping_cost(weight)
    
    if ground_cost < premium_cost and ground_cost < drone_cost:
        cheapest_method = "Ground Shipping"
        cheapest_cost = ground_cost
    elif premium_cost < ground_cost and premium_cost < drone_cost:
        cheapest_method = "Ground Shipping Premium"
        cheapest_cost = premium_cost
    else:
        cheapest_method = "Drone Shipping"
        cheapest_cost = drone_cost
    
    print(f"The cheapest method to ship your package is {cheapest_method}.")
    print(f"It will cost ${cheapest_cost:.2f} to ship your package.")

if __name__ == "__main__":
    main()

####################################################################################
####################################################################################
####################################################################################

#   SOLUTION 2               

####################################################################################
####################################################################################
####################################################################################
# Sal's Shipping
# Sonny Li

weight = 80

# Ground Shipping 🚚

if weight <= 2:
  cost_ground = weight * 1.5 + 20
elif weight <= 6:
  cost_ground = weight * 3.00 + 20
elif weight <= 10:
  cost_ground = weight * 4.00 + 20
else:
  cost_ground = weight * 4.75 + 20

print("Ground Shipping $", cost_ground)
      
# Ground Shipping Premimum 🚚💨

cost_ground_premium = 125.00

print("Ground Shipping Premimium $", cost_ground_premium)

# Drone Shipping 🛸

if weight <= 2:
  cost_drone = weight * 4.5
elif weight <= 6:
  cost_drone = weight * 9.00
elif weight <= 10:
  cost_drone = weight * 12.00
else:
  cost_drone = weight * 14.25

print("Drone Shipping: $", cost_drone)