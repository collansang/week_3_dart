// Encapsulation
class BankAccount {
  // Private variable
  double _balance;

  BankAccount(this._balance);

  // Controlled access method
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
    } else {
      print("Insufficient funds");
    }
  }
}

// Inheritance
class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(double balance, this.interestRate) : super(balance);

  void applyInterest() {
    double interest = balance * interestRate;
    deposit(interest);
  }
}

// Polymorphism
class CheckingAccount extends BankAccount {
  CheckingAccount(double balance) : super(balance);

  @override
  void withdraw(double amount) {
    // Overriding to allow overdraft
    if (amount > 0) {
      _balance -= amount;
    }
  }
}

// Abstraction
abstract class Account {
  void displayInfo();
}

class UserAccount extends Account {
  String username;
  BankAccount account;

  UserAccount(this.username, this.account);

  @override
  void displayInfo() {
    print("User: $username, Balance: \$${account.balance}");
  }
}

void main() {
  // Using encapsulation
  var savings = SavingsAccount(1000, 0.05);
  savings.deposit(500);
  savings.applyInterest();
  print("Savings Account Balance: \$${savings.balance}");

  var checking = CheckingAccount(500);
  checking.withdraw(600); // Overdraft allowed
  print("Checking Account Balance: \$${checking.balance}");

  // Using abstraction
  var user = UserAccount("Alice", savings);
  user.displayInfo();
}
