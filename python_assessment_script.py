#1. Define the Expense Class
class Expense:
    def __init__(self, expense_id, date, category, description, amount):
        self.expense_id = expense_id
        self.date = date
        self.category = category
        self.description = description
        self.amount = amount

    def __str__(self):
        return f"ID: {self.expense_id}, Date: {self.date}, Category: {self.category}, Description: {self.description}, Amount: ${self.amount:.2f}"
        #return f"{self.expense_id}: {self.date} - {self.category} - {self.description} - {self.amount}"

#2. Data Storage and Manipulation Functions
# Initialize an empty list to store expense records
expenses = []

def add_expense(expense):
    expenses.append(expense)

def update_expense(expense_id, new_expense):
    for i, expense in enumerate(expenses):
        if expense.expense_id == expense_id:
            expenses[i] = new_expense
            return True
    return False

            #expenses[i] = new_expense
            #break
        
def delete_expense(expense_id):
    global expenses
    expenses = [expense for expense in expenses if expense.expense_id != expense_id]

def display_expenses():
    for expense in expenses:
        print(expense)

#3. User Authentication
users = {"user1": "password1","user2": "password2"}

def authenticate_user(username, password):
    if username in users and users[username] == password:
        print("Authentication successful")
        return True
    else:
        print("Authentication failed")
        return False

#4. Categorization and Summarization
def categorize_expenses():
    categories = {}
    for expense in expenses:
        if expense.category in categories:
            categories[expense.category] += expense.amount
        else:
            categories[expense.category] = expense.amount
    return categories

def summarize_expenses():
    total = sum(expense.amount for expense in expenses)
    return total

#5. Additional Functions
def calculate_total_expenses():
    return sum(expense.amount for expense in expenses)

def generate_summary_report():
    categories = categorize_expenses()
    for category, total in categories.items():
        print(f"Category: {category}, Total: ${total:.2f}")
    print(f"Total expenses: ${calculate_total_expenses():.2f}")

        #print(f"{category}: {total}")
    #print(f"Total: {calculate_total_expenses()}")

#6. CLI for Interaction
def cli():
    while True:
        print("\nExpense Tracker Menu:")
        print("1. Add a new expense")
        print("2. Update an existing expense")
        print("3. Delete an expense")
        print("4. Display all expenses")
        print("5. Generate summary report")
        print("6. Exit")

        choice = input("Select an option: ")
        
        if choice == '1':
            expense_id = input("Enter expense ID: ")
            date = input("Enter date (YYYY-MM-DD): ")
            category = input("Enter category: ")
            description = input("Enter description: ")
            amount = float(input("Enter amount: "))
            expense = Expense(expense_id, date, category, description, amount)
            add_expense(expense)
        
        elif choice == '2':
            expense_id = input("Enter expense ID to update: ")
            date = input("Enter date (YYYY-MM-DD): ")
            category = input("Enter category: ")
            description = input("Enter description: ")
            amount = float(input("Enter amount: "))           
            new_expense = Expense(expense_id,date,category,description,amount )
            if not update_expense(expense_id, new_expense):
                print("Expense not found.")
                
        elif choice == '3':
            expense_id = input("Enter expense ID to delete: ")
            delete_expense(expense_id)

        elif choice == '4':
            display_expenses()

        elif choice == '5':
            generate_summary_report()
        elif choice == '6':
            print("Exiting the application.")
            break          
        else:
            print("Invalid choice, please select a valid option.")

def main():
    print("Welcome to the Expense Tracker")
    username = input("Enter username: ")
    password = input("Enter password: ")
    
    if authenticate_user(username, password):
        cli()
    else:
        print("Exiting due to failed authentication.")

if __name__ == "__main__":
    main()
