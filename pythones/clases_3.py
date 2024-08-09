Self
16 min
Since we can already use dictionaries to store key-value pairs, using objects for that purpose is not really useful. Instance variables are more powerful when you can guarantee a rigidity to the data the object is holding.

This convenience is most apparent when the constructor creates the instance variables using the arguments passed into it. If we were creating a search engine and wanted to create a class to hold each search entry, we could do so like this:

class SearchEngineEntry:
  def __init__(self, url):
    self.url = url

codecademy = SearchEngineEntry("www.codecademy.com")
wikipedia = SearchEngineEntry("www.wikipedia.org")

print(codecademy.url)
# prints "www.codecademy.com"

print(wikipedia.url)
# prints "www.wikipedia.org"

In the preceding code sample, we define a SearchEngineEntry class, which contains a constructor with two parameters, self and url. Inside the constructor body, we create an instance variable named self.url and assign it the value of the url parameter that is passed into the constructor.

We then create the codecademy instance of SearchEngineEntry by passing the URL as an argument to the constructor. After codecademy is defined, printing codecademy.url shows that the URL has been assigned to the url instance variable of codecademy. Similarly, wikipedia.url holds the value that was passed into the constructor when wikipedia was defined.

Since the self keyword refers to the object and not the class being called, we can define a .secure() method on the SearchEngineEntry class that returns the secure link to an entry.

class SearchEngineEntry:
  secure_prefix = "https://"
  def __init__(self, url):
    self.url = url

  def secure(self):
    return "{prefix}{site}".format(prefix=self.secure_prefix, site=self.url)

codecademy = SearchEngineEntry("www.codecademy.com")
wikipedia = SearchEngineEntry("www.wikipedia.org")

print(codecademy.secure())
# prints "https://www.codecademy.com"

print(wikipedia.secure())
# prints "https://www.wikipedia.org"

Above, we define our .secure() method to take just the one required argument, self. We access both the class variable self.secure_prefix and the instance variable self.url to return a secure URL.

This is the strength of writing object-oriented programs. We can write our classes to structure the data that we need and write methods that will interact with that data in a meaningful way.

Instructions
Checkpoint 1 Enabled
1.
In script.py you’ll find our familiar friend, the Circle class.

Even though we usually know the diameter beforehand, what we need for most calculations is the radius.

In Circle‘s constructor, set the instance variable self.radius to equal half the diameter that gets passed in.

Checkpoint 2 Step instruction is unavailable until previous steps are completed
2.
Define a new method .circumference() for your circle object that takes only one argument, self, and returns the circumference of a circle with the given radius by this formula:

circumference = 2 * pi * radius

Checkpoint 3 Step instruction is unavailable until previous steps are completed
3.
Define three Circles with three different diameters.

A medium pizza, medium_pizza, that is 12 inches across.
Your teaching table, teaching_table, which is 36 inches across.
The Round Room auditorium, round_room, which is 11,460 inches across.
Checkpoint 4 Step instruction is unavailable until previous steps are completed
4.
Print out the circumferences of medium_pizza, teaching_table, and round_room.





############## Solucion


class Circle:
    pi = 3.14
    
    def __init__(self, diameter):
        self.radius = diameter / 2  # Set instance variable radius

    def circumference(self):
        return 2 * Circle.pi * self.radius

# Create Circle objects
medium_pizza = Circle(12)
teaching_table = Circle(36)
round_room = Circle(11460)

print(medium_pizza.circumference())
print(teaching_table.circumference)
print(round_room.circumference)