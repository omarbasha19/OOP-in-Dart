import 'dart:math';

///////////////////////////////////////////////////////////
// 1️⃣ Class for a User Profile
///////////////////////////////////////////////////////////
class User {
  String name;
  String email;
  int age;

  User(this.name, this.email, this.age);

  void displayInfo() {
    print("User Info:");
    print("Name: $name");
    print("Email: $email");
    print("Age: $age\n");
  }
}

///////////////////////////////////////////////////////////
// 2️⃣ Class for a Bank Account
///////////////////////////////////////////////////////////
class BankAccount {
  double _balance = 0; // Private property

  // Deposit money
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: \$$amount, New Balance: \$${getBalance()}");
    } else {
      print("Invalid deposit amount.");
    }
  }

  // Withdraw money
  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrawn: \$$amount, Remaining Balance: \$${getBalance()}");
    } else {
      print("Insufficient balance or invalid amount.");
    }
  }

  // Get balance (read-only)
  double getBalance() {
    return _balance;
  }
}

///////////////////////////////////////////////////////////
// 3️⃣ Class for a Shape
///////////////////////////////////////////////////////////
abstract class Shape {
  double area(); // Abstract method
}

// Circle subclass
class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return pi * radius * radius;
  }
}

// Rectangle subclass
class Rectangle extends Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

///////////////////////////////////////////////////////////
// Main function to test everything
///////////////////////////////////////////////////////////
void main() {
  // User Profile Test
  User user1 = User("Ahmed", "ahmed@example.com", 25);
  user1.displayInfo();

  // Bank Account Test
  BankAccount account = BankAccount();
  account.deposit(500);
  account.withdraw(200);
  print("Final Balance: \$${account.getBalance()}\n");

  // Shape Test
  Circle circle = Circle(5);
  Rectangle rectangle = Rectangle(4, 6);

  print("Circle Area: ${circle.area()}");
  print("Rectangle Area: ${rectangle.area()}");
}
