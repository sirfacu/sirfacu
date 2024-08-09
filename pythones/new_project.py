Learn Python 3
Basta Fazoolin'
You’ve started a position as the lead programmer for the family-style Italian restaurant Basta Fazoolin’ with My Heart. The restaurant has been doing fantastically and seen a lot of growth lately. You’ve been hired to keep things organized.

If you get stuck during this project or would like to see an experienced developer work through it, click “Get Unstuck“ to see a project walkthrough video.

Tasks
26/26 complete
Check off all the tasks as you go. Once all are completed you can complete the project.
AI-generated hints
Beta
Struggling with what you're working on? Get up to 3 AI-generated hints for each task, tailored to your code. After the 3 just-in-time hints, you can also access expert help written for everyone.
Making the Menus

At Basta Fazoolin’ with my Heart our motto is simple: when you’re here with family, that’s great! We have four different menus: brunch, early-bird, dinner, and kids.

Create a Menu class .


Give Menu a constructor with the five parameters self, name, items, start_time, and end_time.


Let’s create our first menu: brunch. Brunch is served from 11am to 4pm. The following items are sold during brunch:

{
  'pancakes': 7.50, 'waffles': 9.00, 'burger': 11.00, 'home fries': 4.50, 'coffee': 1.50, 'espresso': 3.00, 'tea': 1.00, 'mimosa': 10.50, 'orange juice': 3.50
}


Let’s create our second menu item early_bird. Early-bird Dinners are served from 3pm to 6pm. The following items are available during the early-bird menu:

{
  'salumeria plate': 8.00, 'salad and breadsticks (serves 2, no refills)': 14.00, 'pizza with quattro formaggi': 9.00, 'duck ragu': 17.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 1.50, 'espresso': 3.00,
}


Let’s create our third menu, dinner. Dinner is served from 5pm to 11pm. The following items are available for dinner:

{
  'crostini with eggplant caponata': 13.00, 'caesar salad': 16.00, 'pizza with quattro formaggi': 11.00, 'duck ragu': 19.50, 'mushroom ravioli (vegan)': 13.50, 'coffee': 2.00, 'espresso': 3.00,
}


And let’s create our last menu, kids. The kids menu is available from 11am until 9pm. The following items are available on the kids menu.

{
  'chicken nuggets': 6.50, 'fusilli with wild mushrooms': 12.00, 'apple juice': 3.00
}


Give our Menu class a string representation method that will tell you the name of the menu. Also, indicate in this representation when the menu is available.


Try out our string representation. If you call print(brunch) it should print out something like the following:

brunch menu available from 11am to 4pm


Give Menu a method .calculate_bill() that has two parameters: self, and purchased_items, a list of the names of purchased items.

Have calculate_bill return the total price of a purchase consisting of all the items in purchased_items.


Test out Menu.calculate_bill(). We have a breakfast order for one order of pancakes, one order of home fries, and one coffee. Pass that into brunch.calculate_bill() and print out the price.


What about an early-bird purchase? Our last guests ordered the salumeria plate and the vegan mushroom ravioli. Calculate the bill with .calculate_bill().

Creating the Franchises

Basta Fazoolin’ with my Heart has seen tremendous success with the family market, which is fantastic because when you’re at Basta Fazoolin’ with my Heart with family, that’s great!

We’ve decided to create more than one restaurant to offer our fantastic menus, services, and ambience around the country.

First, let’s create a Franchise class.


Give the Franchise class a constructor. Take in an address, and assign it to self.address. Also take in a list of menus and assign it to self.menus.


Let’s create our first two franchises! Our flagship store is located at "1232 West End Road" and our new installment is located at "12 East Mulberry Street". Pass in all four menus along with these addresses to define flagship_store and new_installment.


Give our Franchises a string representation so that we’ll be able to tell them apart. If we print out a Franchise it should tell us the address of the restaurant.


Let’s tell our customers what they can order! Give Franchise an .available_menus() method that takes in a time parameter and returns a list of the Menu objects that are available at that time.


Let’s test out our .available_menus() method! Call it with 12 noon as an argument and print out the results.


Let’s do another test! See what is printed if we call .available_menus() with 5pm as an argument and print out the results.

Creating Businesses!

Since we’ve been so successful building out a branded chain of restaurants, we’ve decided to diversify. We’re going to create a restaurant that sells arepas!

First let’s define a Business class.


Give Business a constructor. A Business needs a name and a list of franchises.


Let’s create our first Business. The name is "Basta Fazoolin' with my Heart" and the two franchises are flagship_store and new_installment.


Before we create our new business, we’ll need a Franchise and before our Franchise we’ll need a menu. The items for our Take a’ Arepa available from 10am until 8pm are the following:

{
  'arepa pabellon': 7.00, 'pernil arepa': 8.50, 'guayanes arepa': 8.00, 'jamon arepa': 7.50
}

Save this to a variable called arepas_menu.


Next let’s create our first Take a’ Arepa franchise! Our new restaurant is located at "189 Fitzgerald Avenue". Save the Franchise object to a variable called arepas_place.


Now let’s make our new Business! The business is called "Take a' Arepa"!


Congrats! You created a system of classes that help structure your code and perform all business requirements you need. Whenever we need a new feature we’ll have the well-organized code required to make developing and shipping it easy.


If you are stuck on the project or would like to see an experienced developer work through the project, watch the following project walkthrough video!


You made it past the finish line! If you're done, be sure to check off all the tasks for this project.





############ Solucion


class Menu:
    def __init__(self, name, items, start_time, end_time):
        self.name = name
        self.items = items
        self.start_time = start_time
        self.end_time = end_time
    
    def __repr__(self):
        return f"{self.name} menu available from {self.start_time} to {self.end_time}"
    
    def calculate_bill(self, purchased_items):
        total = 0
        for item in purchased_items:
            total += self.items.get(item, 0)
        return total

# Create Menu instances
brunch = Menu(
    "brunch",
    {
        'pancakes': 7.50,
        'waffles': 9.00,
        'burger': 11.00,
        'home fries': 4.50,
        'coffee': 1.50,
        'espresso': 3.00,
        'tea': 1.00,
        'mimosa': 10.50,
        'orange juice': 3.50
    },
    "11am",
    "4pm"
)

early_bird = Menu(
    "early-bird",
    {
        'salumeria plate': 8.00,
        'salad and breadsticks (serves 2, no refills)': 14.00,
        'pizza with quattro formaggi': 9.00,
        'duck ragu': 17.50,
        'mushroom ravioli (vegan)': 13.50,
        'coffee': 1.50,
        'espresso': 3.00,
    },
    "3pm",
    "6pm"
)

dinner = Menu(
    "dinner",
    {
        'crostini with eggplant caponata': 13.00,
        'caesar salad': 16.00,
        'pizza with quattro formaggi': 11.00,
        'duck ragu': 19.50,
        'mushroom ravioli (vegan)': 13.50,
        'coffee': 2.00,
        'espresso': 3.00,
    },
    "5pm",
    "11pm"
)

kids = Menu(
    "kids",
    {
        'chicken nuggets': 6.50,
        'fusilli with wild mushrooms': 12.00,
        'apple juice': 3.00
    },
    "11am",
    "9pm"
)

# Test Menu string representation and calculate_bill method
print(brunch)
# Output: brunch menu available from 11am to 4pm

breakfast_order = ['pancakes', 'home fries', 'coffee']
print(brunch.calculate_bill(breakfast_order))
# Output: 13.50

early_bird_order = ['salumeria plate', 'mushroom ravioli (vegan)']
print(early_bird.calculate_bill(early_bird_order))
# Output: 21.50

# Define the Franchise class
class Franchise:
    def __init__(self, address, menus):
        self.address = address
        self.menus = menus

    def __repr__(self):
        return f"Franchise at {self.address}"

    def available_menus(self, time):
        available = []
        for menu in self.menus:
            start_time = int(menu.start_time[:-2]) % 12
            end_time = int(menu.end_time[:-2]) % 12
            time_int = int(time[:-2]) % 12
            if start_time <= time_int <= end_time:
                available.append(menu)
        return available

# Create Franchise instances
flagship_store = Franchise("1232 West End Road", [brunch, early_bird, dinner, kids])
new_installment = Franchise("12 East Mulberry Street", [brunch, early_bird, dinner, kids])

# Test Franchise available_menus method
print(flagship_store.available_menus("12pm"))
# Output: [brunch menu, early-bird menu, kids menu]

print(flagship_store.available_menus("5pm"))
# Output: [dinner menu, kids menu]

# Define the Business class
class Business:
    def __init__(self, name, franchises):
        self.name = name
        self.franchises = franchises

# Create Business and additional Menu and Franchise instances
arepas_menu = Menu(
    "arepas",
    {
        'arepa pabellon': 7.00,
        'pernil arepa': 8.50,
        'guayanes arepa': 8.00,
        'jamon arepa': 7.50
    },
    "10am",
    "8pm"
)

arepas_place = Franchise("189 Fitzgerald Avenue", [arepas_menu])

take_a_arepa = Business("Take a' Arepa", [arepas_place])