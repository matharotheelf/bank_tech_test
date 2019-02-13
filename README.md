#Bank Tech Test

This is a repository for the Bank technical test. The aim is create a programme which can save withdrawals and deposits of money to a bank account and then print the details of that account's transactions.

**User Story 1**

As a user,

To see my account history,

I would like to be able to see a history of past transactions.

**User Story 2**

As a user,

To see my account history,

I would like to be able to see the date of all my transactions.

**User Story 3**

As a user,

To see my account history,

I would like to be able to see my balance after each transaction.

**User Story 4**

As a user,

To see my account history,

I would like to be able to see the value of each transaction.

**User Story 5**

As a user,

To deposit money,

I would like to be able to add a deposit to my account.

**User Story 6**

As a user,

To withdraw money,

I would like to be able to add a withdrawal to my account.

##Approach

I split the code into to five classes:

1. The Deposit class stores the information of one deposit transaction.

2. The Withdrawal class stores the information of one withdrawal transaction.

3. The Account class stores an array of all the Withdrawal and Deposit objects associated to an account i.e. the account history. The methods "create_deposit" and "create_withdrawal" create a Withdrawal and Deposit objects respectively and store them to the Account's array.

4. The BankStatement class converts Account object's array into a hash in the format needed for the printed bank statement.

5. The PrintStatement class convert's the BankStatment's hash into a string which it then prints to the console.

6. The Float class adds a method to Float object that displays float with two decimal places.

## Getting Started

To get started I will guide you in how to use the app in irb.

To start you must create a new "Account", "BankStatement", and "PrintStatement" object:

account = Account.new
banker = BankStatement.new
printer = PrintStatement.new

To withdraw money from the account run on the "Account" object:

 account.create_withdrawal(500)

 Where the above withdraws 500 pounds.

 To deposit money into the account run on the "Account" object:

 account.create_deposit(100)

 Where the above deposits 100 pounds.

 Then to create a bank statement run:

 statement = banker.create_history(account)

 And to print the statement to the console run:

 printer.print_statement(statement)

### Prerequisites

To run the software you must have installed Ruby version 2.5.1p57 and to run the tests RSpec version 3.8.0.

### Installing

If you have installed bundler (https://bundler.io) you can quickly install all the gems used in this project. To install the gems run "bundle install" in the command line.

## Running the tests

To run the tests run "rspec" in the command line. The tests cover all the features of the program. There are also two feature tests written which run through two scenarios one with a grid with no live cells and one with a grid seeded with live cells.

## Built With

* [Ruby version 2.5.1p57](http://www.dropwizard.io/1.0.2/docs/) - Language used
* [RSpec version 3.8.0](http://rspec.info) - Testing framework

## Authors

* **Thomas Lawrence**

Challenged created by Makers' Academy

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

Thanks to the Makers' Academy for creating this challenge
