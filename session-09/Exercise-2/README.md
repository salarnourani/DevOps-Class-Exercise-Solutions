# Exercise 2 – Find Minimum and Maximum of 20 Numbers (Bash)

## Description
This Bash script reads **20 integer numbers** from the user and determines:
- The **largest** number
- The **smallest** number

The script compares each number as it is entered and updates the minimum and maximum values accordingly.

## Script File
exercise-2.sh

## How It Works
1. The script first asks the user to enter the first number.
2. That number is initially set as both the minimum and maximum.
3. The script then prompts the user to enter 19 more numbers.
4. Each new number is compared with the current minimum and maximum.
5. After all numbers are entered, the script prints the largest and smallest values.

## How to Run

### Step 1: Give execute permission
chmod +x exercise-2.sh

### Step 2: Run the script
./exercise-2.sh

or

bash exercise-2.sh

## Example Output
Type Number 1: 10  
Enter number 2: 5  
Enter number 3: 25  
...  
Enter number 20: 3  

Largest number is: 25  
Smallest number is: 3

## Notes
- The script expects **integer values only**.
- Inputting non-numeric values may result in an error.

