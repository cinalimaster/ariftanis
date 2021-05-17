from Question import Question

question_prompts = [
    "What color are apples?\n(a) Red/Green\n(b) Purple\n(c) Orange\n\n",
    "What color are bananas?\n(a) Teal\n(b) Magenta\n(c) Yellow\n\n",
    "What color are strawberries?\n(a) Yellow\n(b) Red\n(c) Blue\n\n",
]

#we need track 2 type of variables what is asked and what is answered
#we need a new class type we create Question.py file

questions = [
    Question(question_prompts[0], "a"),
    Question(question_prompts[1], "c"),
    Question(question_prompts[2], "b"),
]

# we created array of questions and answers now we need a function to run the test
#this is a 1 parameter function which includes list of questions
def run_test(questions):
    score = 0 #this is a score variable starting from zero it will update
    for question in questions: #for each question inside questions object i wanna do
        answer = input(question.prompt) # we collect info with using question class second variable as prompt
        if answer == question.answer: #if input maches our recorded class variable in this case "a"
            score += 1 # increment score value +1
    print("You got " + str(score) + "/" + str(len(questions)) + " answers correct")
run_test(questions)

#with this code we can add new questions and answers to test and it will automatically work