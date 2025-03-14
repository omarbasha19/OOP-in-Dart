import 'dart:math';

///////////////////////////////////////////////////////////
// 1️⃣ Employee Management System (Encapsulation & Getters/Setters)
///////////////////////////////////////////////////////////
class Employee {
  String name;
  String position;
  double _salary = 0; // Default value assigned

  Employee(this.name, this.position, double salary) {
    this.salary = salary; // Uses setter to validate values
  }

  double get salary => _salary;

  set salary(double value) {
    if (value >= 0) {
      _salary = value;
    } else {
      print("Error: Salary cannot be negative.");
    }
  }

  void displayInfo() {
    print("Employee: $name, Position: $position, Salary: \$$_salary\n");
  }
}

///////////////////////////////////////////////////////////
// 2️⃣ Library Book Tracking (Class & Object Creation)
///////////////////////////////////////////////////////////
class Book {
  String title;
  String author;
  String isbn;

  Book(this.title, this.author, this.isbn);

  void displayDetails() {
    print("Book: $title by $author (ISBN: $isbn)\n");
  }
}

///////////////////////////////////////////////////////////
// 3️⃣ E-commerce Product (Constructor & Named Constructor)
///////////////////////////////////////////////////////////
class Product {
  String name;
  double price;
  String category;

  Product(this.name, this.price, this.category);

  // Named constructor for discounted products
  Product.discounted(String name, double price, String category, double discountPercentage)
      : this(name, price * (1 - discountPercentage / 100), category);

  void displayProduct() {
    print("Product: $name, Category: $category, Price: \$${price.toStringAsFixed(2)}\n");
  }
}

///////////////////////////////////////////////////////////
// 4️⃣ AI-Powered Weather App (Encapsulation & Getters/Setters)
///////////////////////////////////////////////////////////
class WeatherData {
  double _temperature = 0; // Default value assigned
  double humidity;
  double windSpeed;

  WeatherData(this._temperature, this.humidity, this.windSpeed);

  double get temperature => _temperature;

  set temperature(double value) {
    if (value >= -50 && value <= 60) { // Valid temperature range
      _temperature = value;
    } else {
      print("Error: Invalid temperature value.");
    }
  }

  void displayWeather() {
    print("Weather: Temperature: $_temperature°C, Humidity: $humidity%, Wind Speed: $windSpeed km/h\n");
  }
}

///////////////////////////////////////////////////////////
// 5️⃣ AI Chatbot (Class & Object Creation)
///////////////////////////////////////////////////////////
class AIChatbot {
  String name;
  String language;
  double responseTime;

  AIChatbot(this.name, this.language, this.responseTime);

  String generateResponse(String userInput) {
    return "Chatbot $name: I received your message - \"$userInput\"";
  }
}

///////////////////////////////////////////////////////////
// 6️⃣ AI Image Enhancer (Encapsulation & Private Fields)
///////////////////////////////////////////////////////////
class ImageEnhancer {
  String _imageData; // Private field

  ImageEnhancer(this._imageData);

  void applyFilter(String filterName) {
    print("Applying $filterName filter to the image.");
  }

  void displayImageInfo() {
    print("Original Image: Data hidden for security reasons.\n");
  }
}

///////////////////////////////////////////////////////////
// 7️⃣ AI-Based Translator (Constructor & Named Constructor)
///////////////////////////////////////////////////////////
class Translator {
  String language;

  Translator(this.language);

  Translator.detectLanguage(String text) : language = _detect(text);

  static String _detect(String text) {
    return "English"; // Dummy detection for demonstration
  }

  void translate(String text) {
    print("Translating \"$text\" to $language...\n");
  }
}

///////////////////////////////////////////////////////////
// 8️⃣ Voice Assistant (Method Overriding & Inheritance)
///////////////////////////////////////////////////////////
class VoiceAssistant {
  void listen() {
    print("Listening...");
  }

  void respond() {
    print("Responding...");
  }
}

class GoogleAssistant extends VoiceAssistant {
  @override
  void respond() {
    print("Google Assistant: How can I assist you?");
  }
}

class SiriAssistant extends VoiceAssistant {
  @override
  void respond() {
    print("Siri: What can I do for you?");
  }
}

///////////////////////////////////////////////////////////
// Main function to test all scenarios
///////////////////////////////////////////////////////////
void main() {
  // Employee Test
  Employee emp = Employee("John Doe", "Developer", 5000);
  emp.displayInfo();
  emp.salary = -1000; // Should show an error

  // Library Book Test
  Book book1 = Book("Dart Programming", "Author X", "123456789");
  book1.displayDetails();

  // E-commerce Product Test
  Product normalProduct = Product("Laptop", 1500, "Electronics");
  Product discountedProduct = Product.discounted("Smartphone", 1000, "Electronics", 10);
  normalProduct.displayProduct();
  discountedProduct.displayProduct();

  // AI-Powered Weather App Test
  WeatherData weather = WeatherData(25, 60, 15);
  weather.displayWeather();
  weather.temperature = 100; // Should show an error

  // AI Chatbot Test
  AIChatbot bot = AIChatbot("ChatBotX", "English", 1.5);
  print(bot.generateResponse("Hello!"));

  // AI Image Enhancer Test
  ImageEnhancer enhancer = ImageEnhancer("image_data_here");
  enhancer.applyFilter("AI Sharpen");
  enhancer.displayImageInfo();

  // AI-Based Translator Test
  Translator translator = Translator("Spanish");
  translator.translate("Hello World");

  Translator autoTranslator = Translator.detectLanguage("Bonjour");
  autoTranslator.translate("Bonjour");

  // Voice Assistant Test
  GoogleAssistant google = GoogleAssistant();
  SiriAssistant siri = SiriAssistant();

  google.listen();
  google.respond();

  siri.listen();
  siri.respond();
}
