import codecademylib3_seaborn
from matplotlib import pyplot as plt
import random
# Add your code below:
numbers_a=range(1, 13)
numbers_b=random.sample(range(1000),12)
print(numbers_b)
plt.plot(numbers_a,numbers_a)
plt.show()