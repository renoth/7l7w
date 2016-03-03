

random := Random value(100) ceil

guess := -1
try := 0

while(try < 10,
    guess := File standardInput readLine asNumber;
    try := try + 1;
    if(guess < random, "More" println, if(guess == random, break, "Less"
println))
)

if (guess == random, "You are really good!" println, "Better luck next
time" println)

