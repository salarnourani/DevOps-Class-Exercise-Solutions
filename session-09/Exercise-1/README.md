# Exercise 1 - Number Comparison

## Description
This script takes a single integer from user input, compares it to the number 10, and prints the appropriate message for one of the three possible outcomes:

1. Larger than 10
2. Equal to 10
3. Smaller than 10

## Conceptual Logic
The solution utilizes a **chained `if` structure (`if / elif / else`)** to efficiently handle the three mutually exclusive conditions:

1. It first checks if the number is **Greater Than** 10 (`-gt`).
2. If not, it checks if the number is **Equal To** 10 (`-eq`).
3. If neither of the above conditions is met, the number must logically be **Smaller Than** 10, and the `else` block executes.

## How to Run

1.  **Execution Permission:** Ensure the script has executable permissions:
```bash
chmod +x exercise-1.sh

2. Run: Execute the script. When prompted, enter your desired integer:

./exercise-1.sh
# or
bash exercise-1.sh

## Example Output

**Input: 15**
Please Type Nember :15
Larger than 10

**Input: 10**
Please Type Nember :10
Equal to 10

**Input: 5**
Please Type Nember :5
Smaler than 10

**Date Created: 2026-01-04**
