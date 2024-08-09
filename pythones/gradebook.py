last_semester_gradebook = [["politics", 80], ["latin", 96], ["dance", 97], ["architecture", 65]]

# Your code below: 
subjects=["physics","calculus","poetry","history"]
grades=[98,97,85,88]
gradebook=[]
for subject, grade in zip(subjects, grades):
    gradebook.append([subject, grade])
gradebook.append(["computer science",100])
gradebook.append(["visual arts",93])
gradebook.remove(["visual arts", 93])
gradebook.append(["visual arts","Pass"])
for newGrades in gradebook:
    if newGrades[0] == "poetry":
        newGrades.append("Pass")
full_gradebook= last_semester_gradebook + gradebook
print(full_gradebook)