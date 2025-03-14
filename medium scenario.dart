import 'dart:math';

///////////////////////////////////////////////////////////
// 1️⃣ Messaging App (Abstract Class & Interface)
///////////////////////////////////////////////////////////
abstract class Message {
  void send();
}

class TextMessage extends Message {
  String content;
  TextMessage(this.content);

  @override
  void send() {
    print("Sending Text Message: $content");
  }
}

class ImageMessage extends Message {
  String imageUrl;
  ImageMessage(this.imageUrl);

  @override
  void send() {
    print("Sending Image Message: $imageUrl");
  }
}

class VideoMessage extends Message {
  String videoUrl;
  VideoMessage(this.videoUrl);

  @override
  void send() {
    print("Sending Video Message: $videoUrl");
  }
}

///////////////////////////////////////////////////////////
// 2️⃣ AI-Based Personal Trainer App (Polymorphism & Inheritance)
///////////////////////////////////////////////////////////
abstract class Workout {
  void generateRoutine();
}

class StrengthTraining extends Workout {
  @override
  void generateRoutine() {
    print("Strength Training Routine: 4 sets of deadlifts and bench press.");
  }
}

class Cardio extends Workout {
  @override
  void generateRoutine() {
    print("Cardio Routine: 30 minutes of running and cycling.");
  }
}

class Yoga extends Workout {
  @override
  void generateRoutine() {
    print("Yoga Routine: 20 minutes of stretching and deep breathing.");
  }
}

///////////////////////////////////////////////////////////
// 3️⃣ AI-Powered Health Monitoring (Abstract Class & Interface)
///////////////////////////////////////////////////////////
abstract class HealthMonitor {
  void analyzeData();
}

class HeartRateMonitor extends HealthMonitor {
  @override
  void analyzeData() {
    print("Analyzing heart rate data... Normal range detected.");
  }
}

class SleepTracker extends HealthMonitor {
  @override
  void analyzeData() {
    print("Analyzing sleep patterns... 7 hours of deep sleep recorded.");
  }
}

///////////////////////////////////////////////////////////
// 4️⃣ AI-Driven Resume Scanner (Factory Constructor)
///////////////////////////////////////////////////////////
abstract class ResumeAnalyzer {
  void analyzeResume();
}

class SoftwareEngineerAnalyzer extends ResumeAnalyzer {
  @override
  void analyzeResume() {
    print("Analyzing Software Engineer resume... Focus on programming skills.");
  }
}

class MarketingAnalyzer extends ResumeAnalyzer {
  @override
  void analyzeResume() {
    print("Analyzing Marketing resume... Focus on branding experience.");
  }
}

class ResumeAnalyzerFactory {
  static ResumeAnalyzer getAnalyzer(String jobField) {
    if (jobField == "Software Engineer") {
      return SoftwareEngineerAnalyzer();
    } else if (jobField == "Marketing") {
      return MarketingAnalyzer();
    } else {
      throw Exception("Unknown job field: $jobField");
    }
  }
}

///////////////////////////////////////////////////////////
// 5️⃣ Smart Home Automation (Composition & Inheritance)
///////////////////////////////////////////////////////////
class SmartDevice {
  void operate() {
    print("Operating smart device...");
  }
}

class SmartLight extends SmartDevice {
  @override
  void operate() {
    print("Smart Light: Adjusting brightness based on user preference.");
  }
}

class SmartThermostat extends SmartDevice {
  @override
  void operate() {
    print("Smart Thermostat: Setting temperature based on AI prediction.");
  }
}

class SmartSecurityCamera extends SmartDevice {
  @override
  void operate() {
    print("Smart Security Camera: Monitoring suspicious activities.");
  }
}

///////////////////////////////////////////////////////////
// 6️⃣ AI-Powered Fraud Detection (Exception Handling)
///////////////////////////////////////////////////////////
class FraudDetectedException implements Exception {
  final String message;
  FraudDetectedException(this.message);

  @override
  String toString() => "FraudDetectedException: $message";
}

class TransactionValidator {
  void validateTransaction(double amount, bool isSuspicious) {
    if (isSuspicious) {
      throw FraudDetectedException("Suspicious transaction detected: \$${amount}");
    } else {
      print("Transaction of \$${amount} approved.");
    }
  }
}

///////////////////////////////////////////////////////////
// Main function to test all scenarios
///////////////////////////////////////////////////////////
void main() {
  // Messaging App Test
  TextMessage textMsg = TextMessage("Hello!");
  ImageMessage imageMsg = ImageMessage("image.png");
  VideoMessage videoMsg = VideoMessage("video.mp4");

  textMsg.send();
  imageMsg.send();
  videoMsg.send();

  // AI-Based Personal Trainer App Test
  Workout strength = StrengthTraining();
  Workout cardio = Cardio();
  Workout yoga = Yoga();

  strength.generateRoutine();
  cardio.generateRoutine();
  yoga.generateRoutine();

  // AI-Powered Health Monitoring Test
  HealthMonitor heartMonitor = HeartRateMonitor();
  HealthMonitor sleepTracker = SleepTracker();

  heartMonitor.analyzeData();
  sleepTracker.analyzeData();

  // AI-Driven Resume Scanner Test
  ResumeAnalyzer softwareAnalyzer = ResumeAnalyzerFactory.getAnalyzer("Software Engineer");
  ResumeAnalyzer marketingAnalyzer = ResumeAnalyzerFactory.getAnalyzer("Marketing");

  softwareAnalyzer.analyzeResume();
  marketingAnalyzer.analyzeResume();

  // Smart Home Automation Test
  SmartDevice light = SmartLight();
  SmartDevice thermostat = SmartThermostat();
  SmartDevice camera = SmartSecurityCamera();

  light.operate();
  thermostat.operate();
  camera.operate();

  // AI-Powered Fraud Detection Test
  TransactionValidator validator = TransactionValidator();

  try {
    validator.validateTransaction(5000, false);
    validator.validateTransaction(10000, true); // This should throw an exception
  } catch (e) {
    print(e);
  }
}
