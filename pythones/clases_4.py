Everything is an Object
7 min
Attributes can be added to user-defined objects after instantiation, so it’s possible for an object to have some attributes that are not explicitly defined in an object’s constructor. We can use the dir() function to investigate an object’s attributes at runtime. dir() is short for directory and offers an organized presentation of object attributes.

class FakeDict:
  pass

fake_dict = FakeDict()
fake_dict.attribute = "Cool"

print(dir(fake_dict))
# Prints ['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__()', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', 'attribute']

That’s certainly a lot more attributes than we defined! Python automatically adds a number of attributes to all objects that get created. These internal attributes are usually indicated by double-underscores. But sure enough, attribute is in that list.

Do you remember being able to use type() on Python’s native data types? This is because they are also objects in Python. Their classes are int, float, str, list, and dict. These Python classes have special syntax for their instantiation, 1, 1.0, "hello", [], and {} specifically. But these instances are still full-blown objects to Python.

fun_list = [10, "string", {'abc': True}]

type(fun_list)
# Prints <class 'list'>

print(dir(fun_list))
# Prints ['__add__', '__class__', [...], 'append', 'clear', 'copy', 'count', 'extend', 'index', 'insert', 'pop', 'remove', 'reverse', 'sort']

Above we define a new list. We check its type and see that’s an instantiation of class list. We use dir() to explore its attributes, and it gives us a large number of internal Python dunder attributes, but afterward, we get the usual list methods.

Instructions
Checkpoint 1 Enabled
1.
Call dir() on the number 5. Print out the results.

Checkpoint 2 Step instruction is unavailable until previous steps are completed
2.
Define a function called this_function_is_an_object. It can take any parameters and return anything you’d like.

Checkpoint 3 Step instruction is unavailable until previous steps are completed
3.
Print out the result of calling dir() on this_function_is_an_object.

Functions are objects too!



#################### Solucion


print("Attributes of number 5:")
print(dir(5))

# Checkpoint 2: Define a function called this_function_is_an_object
def this_function_is_an_object(param1=None):
    return param1

# Checkpoint 3: Print out the result of calling dir() on this_function_is_an_object
print("\nAttributes of the function:")
print(dir(this_function_is_an_object))