############
data_science_topics = ["Machine Learning", "SQL", "Pandas", "Algorithms", "Statistics", "Python 3"]
print(data_science_topics)
data_science_topics.pop()
data_science_topics.pop(3)
print(data_science_topics)


############
front_display_list = ["Mango", "Filet Mignon", "Chocolate Milk"]
print(front_display_list)
front_display_list.insert(0,"Pineapple")
print(front_display_list)

############
number_list = range(0,9)
print(list(number_list))

zero_to_seven = range(0,8)
print(list(zero_to_seven))
############


suitcase = ["shirt", "shirt", "pants", "pants", "pajamas", "books"]

beginning = suitcase[0:2]

# Your code below: 
middle= suitcase[2:4]
print(middle)


#######################
suitcase = ["shirt", "shirt", "pants", "pants", "pajamas", "books"]

# Your code below: 

last_two_elements=suitcase[-2:]
slice_off_last_three=suitcase[:-3]
print(slice_off_last_three)


#######################
votes = ["Jake", "Jake", "Laurie", "Laurie", "Laurie", "Jake", "Jake", "Jake", "Laurie", "Cassie", "Cassie", "Jake", "Jake", "Cassie", "Laurie", "Cassie", "Jake", "Jake", "Cassie", "Laurie"]

# Your code below: 
jake_votes=votes.count("Jake")
print(jake_votes)


#########
inventory = ["twin bed", "twin bed", "headboard", "queen bed", "king bed", "dresser", "dresser", "table", "table", "nightstand", "nightstand", "king bed", "king bed", "twin bed", "twin bed", "sheets", "sheets", "pillow", "pillow"]

inventory_len=len(inventory)
print(inventory_len)
first=inventory[0]
print(first)
last=inventory[-1]
print(last)
inventory_2_6=inventory[2:6]
print(inventory_2_6)
first_3=inventory[0:3]
print(first_3)
twin_beds=inventory.count("twin bed")
print(twin_beds)
removed_item=inventory.pop(4)
print(removed_item)
inventory.insert(10,"19th Century Bed Frame")
inventory.sort()
print(inventory)


################### 
def more_than_n(my_list,item,n):
  count=0
  for i in my_list:
    if i == item:
      count+=1
  
  if count > n:
    return True
  else:
    return False
###o tam,bien este
def more_than_n(my_list, item, n):
  if my_list.count(item) > n:
    return True
  else:
    return False

#Uncomment the line below when your function is done
print(more_than_n([2, 4, 6, 2, 3, 2, 1, 2], 2, 3))




#### otro ejericio
#Write a function named combine_sort that has two parameters named my_list1 and my_list2.
#The function should combine these two lists into one new list and sort the result. Return the new sorted list.
def combine_sort(my_list1, my_list2):
  unsorted = my_list1 + my_list2
  sortedList = sorted(unsorted)
  return sortedList
print(combine_sort([4, 10, 2, 5], [-10, 2, 5, 10]))


#The function should return a list of every third number between start and 100 (inclusive). 
# For example, every_three_nums(91) should return the list [91, 94, 97, 100]. If start is greater than 100, the function should return an empty list.
#Write your function here
def every_three_nums(start):
  return list(range(start, 101, 3))
print(every_three_nums(91))

#Our next function will remove all elements from a list with an index within a certain range. The function will accept a list, a starting index, and an ending index. All elements with an index between the starting and ending index should be removed from the list. Here are the steps:
#
#Define the function to accept three parameters: the list, the starting index, and the ending index
#Get all elements before the starting index
#Get all elements after the ending index
#Combine the two partial lists into the result
#Return the result
def remove_middle(my_list, start, end):
  return my_list[:start] + my_list[end+1:]

print(remove_middle([4, 8, 15, 16, 23, 42], 1, 3))
#Let’s go back to our factory example. We have a conveyor belt of items where each item is represented by a different number. We want to know, out of two items, which one shows up more on our belt. To solve this, we can use a function with three parameters. One parameter for the list of items, another for the first item we are comparing, and another for the second item. Here are the steps:
#
#Define the function to accept three parameters: the list, the first item, and the second item
#Count the number of times item1 shows up in our list
#Count the number of times item2 shows up in our list
#Return the item that appears more frequently in my_list — if both items show up the same number of times, return item1
def more_frequent_item(my_list, item1, item2):
  if my_list.count(item1) >= my_list.count(item2):
    return item1
  else:
    return item2
print(more_frequent_item([2, 3, 3, 2, 3, 2, 3, 2, 3], 2, 3))

#Create a function named double_index that has two parameters: a list named my_list and a single number named index.
#The function should return a new list where all elements are the same as in my_list except for the element at index. The element at index should be double the value of the element at index of the original my_list.
#If index is not a valid index, the function should return the original list.
#For example, the following code should return [1,2,6,4] because the element at index 2 has been doubled:
#double_index([1, 2, 3, 4], 2)

def double_index(my_list, index):
  # Checks to see if index is too big
  if index >= len(my_list):
    return my_list
  else:
    my_new_list = my_list[0:index]
  my_new_list.append(my_list[index]*2)
  my_new_list = my_new_list + my_list[index+1:]
  return my_new_list

print(double_index([3, 8, -10, 12], 2))


#Create a function called middle_element that has one parameter named my_list.
#If there are an odd number of elements in my_list, the function should return the middle element. If there are an even number of elements, the function should return the average of the middle two elements.

def middle_element(my_list):
  if len(my_list) % 2 == 0:
    sum = my_list[int(len(my_list)/2)] + my_list[int(len(my_list)/2) - 1]
    return sum / 2
  else:
    return my_list[int(len(my_list)/2)]