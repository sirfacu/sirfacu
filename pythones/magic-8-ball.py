import random

answers = [
    "Yes - definitely",
    "It is decidedly so",
    "Without a doubt",
    "Reply hazy, try again",
    "Ask again later",
    "Better not tell you now",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
]

def magic_8_ball():
    name = "juan"
    question = "Should I accept a new job offer?"
    answer = random.choice(answers)
    print(f"{name} asks: {question}")
    print(f"Magic 8-Ball's answer: {answer}")

# Run the Magic 8-Ball
magic_8_ball()