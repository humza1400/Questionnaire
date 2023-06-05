questions = ["1. What is your name?", 
    "2. What is your age?",
    "3. What is your favorite musical artist?",
    "4. What is your favorite food?",
    "5. What state were you born in?",
    "6. What is your favorite movie?",
    "7. What is your favorite TV show?",
    "8. What is your dream car?",
    "9. How many siblings do you have?",
    "10. What is your nationality?"]

answers = Array[questions.size]
answer_file = "answers.json"
submission = 0
puts "Hello and welcome to my Questionnaire. To get started please type in your ID."
id = gets
File.open(answer_file, "a+") do |file|
    if !file.read().include? "submission"
        file.write("{\n\t\"submissions\": {\n")
    else
        file.write(",\n")
    end
    file.write("\t\t\"" + id.gsub("\n","") + "\": [\n")
    for i in 0...questions.size
        puts questions[i]
        answer = gets
        answers[i] = answer
        json = "\t\t\t{\"question_" + (i+1).to_s + "\": \"" + answer.gsub("\n","") + "\"}";
        if i != questions.size-1
            json += ",\n"
        end
        file.write(json)
    end
    file.write("\n\t\t]\n\t}")
    if !file.read().include? "submission"
        file.write("\n}")
    end
    file.close
end

puts "Thank you for taking my questionnaire!"