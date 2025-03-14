import 'dart:math';

///////////////////////////////////////////////////////////
// 1️⃣ AI-Powered Recommendation System (Singleton Pattern)
///////////////////////////////////////////////////////////
class RecommendationEngine {
  static final RecommendationEngine _instance = RecommendationEngine._internal();

  factory RecommendationEngine() {
    return _instance;
  }

  RecommendationEngine._internal(); // Private constructor

  void recommend(String user) {
    print("AI Recommendation for $user: Suggested personalized products.");
  }
}

///////////////////////////////////////////////////////////
// 2️⃣ AI-Driven Sentiment Analysis for Social Media (Mixin Usage)
///////////////////////////////////////////////////////////
mixin SentimentAnalyzer {
  String analyzeSentiment(String text) {
    if (text.contains("happy") || text.contains("good")) {
      return "Positive Sentiment";
    } else if (text.contains("sad") || text.contains("bad")) {
      return "Negative Sentiment";
    } else {
      return "Neutral Sentiment";
    }
  }
}

class CommentAnalyzer with SentimentAnalyzer {
  void analyzeComment(String comment) {
    print("Comment Sentiment: ${analyzeSentiment(comment)}");
  }
}

class PostAnalyzer with SentimentAnalyzer {
  void analyzePost(String post) {
    print("Post Sentiment: ${analyzeSentiment(post)}");
  }
}

///////////////////////////////////////////////////////////
// 3️⃣ AI-Based Fraud Detection for Payments (Dependency Injection)
///////////////////////////////////////////////////////////
abstract class FraudDetectionModel {
  void detectFraud();
}

class NeuralNetwork implements FraudDetectionModel {
  @override
  void detectFraud() {
    print("Neural Network Model: Fraud detected using deep learning.");
  }
}

class DecisionTree implements FraudDetectionModel {
  @override
  void detectFraud() {
    print("Decision Tree Model: Fraud detected using rule-based logic.");
  }
}

class PaymentFraudDetector {
  final FraudDetectionModel model;

  PaymentFraudDetector(this.model);

  void analyzeTransaction() {
    model.detectFraud();
  }
}

///////////////////////////////////////////////////////////
// 4️⃣ AI-Based Virtual Shopping Assistant (State Management & OOP)
///////////////////////////////////////////////////////////
class ShoppingAssistant {
  String userState;

  ShoppingAssistant(this.userState);

  void recommendProducts() {
    if (userState == "Active Shopper") {
      print("Recommendation: Discounts on your favorite brands.");
    } else if (userState == "Casual Viewer") {
      print("Recommendation: Explore trending products.");
    } else {
      print("Recommendation: Sign up for a personalized shopping experience.");
    }
  }
}

///////////////////////////////////////////////////////////
// 5️⃣ AI-Based Image Recognition System (Deep Copy vs Shallow Copy)
///////////////////////////////////////////////////////////
class AIModel {
  String modelName;
  List<double> parameters;

  AIModel(this.modelName, this.parameters);

  // Shallow Copy
  AIModel shallowCopy() {
    return AIModel(modelName, parameters);
  }

  // Deep Copy
  AIModel deepCopy() {
    return AIModel(modelName, List.from(parameters));
  }

  void modifyParameters(int index, double newValue) {
    parameters[index] = newValue;
  }

  void display() {
    print("$modelName Parameters: $parameters");
  }
}

///////////////////////////////////////////////////////////
// Main function to test all scenarios
///////////////////////////////////////////////////////////
void main() {
  // AI-Powered Recommendation System Test
  RecommendationEngine engine = RecommendationEngine();
  engine.recommend("User123");

  // AI-Driven Sentiment Analysis Test
  CommentAnalyzer commentAnalyzer = CommentAnalyzer();
  commentAnalyzer.analyzeComment("This is a good product!");

  PostAnalyzer postAnalyzer = PostAnalyzer();
  postAnalyzer.analyzePost("I feel so sad today.");

  // AI-Based Fraud Detection Test
  PaymentFraudDetector nnDetector = PaymentFraudDetector(NeuralNetwork());
  nnDetector.analyzeTransaction();

  PaymentFraudDetector dtDetector = PaymentFraudDetector(DecisionTree());
  dtDetector.analyzeTransaction();

  // AI-Based Virtual Shopping Assistant Test
  ShoppingAssistant assistant = ShoppingAssistant("Active Shopper");
  assistant.recommendProducts();

  // AI-Based Image Recognition System Test
  AIModel originalModel = AIModel("ResNet50", [0.1, 0.2, 0.3]);

  AIModel shallowClone = originalModel.shallowCopy();
  AIModel deepClone = originalModel.deepCopy();

  originalModel.modifyParameters(0, 0.9);

  print("\nAfter modifying original model:");
  originalModel.display();
  shallowClone.display(); // Affected by change (same memory reference)
  deepClone.display(); // Not affected (independent copy)
}
