# Execute code from a slot

"IO day 1" println

# Create a new prototype
DayOne := Object clone
(DayOne slotNames) println

# Define the code
DayOne method1 := method("haha" println)

# create an instance
dayOne := DayOne clone

# show the code that gets executed
dayOne getSlot("method1") println

# Execute the code
dayOne method1
