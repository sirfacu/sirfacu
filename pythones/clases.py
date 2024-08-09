#In script.py we have defined a Store class. Create two objects from this store class, #named alternative_rocks and isabelles_ices.
#
#Checkpoint 2 Enabled
#2.
#Give them both instance attributes called .store_name. Set alternative_rocks‘s .store_name to "Alternative Rocks". Set isabelles_ices‘s .store_name to "Isabelle's Ices".
#
class Store:
    def __init__(self, store_name):
        self.store_name = store_name

alternative_rocks = Store("Alternative Rocks")
isabelles_ices = Store("Isabelle's Ices")

print(alternative_rocks.store_name)
print(isabelles_ices.store_name)