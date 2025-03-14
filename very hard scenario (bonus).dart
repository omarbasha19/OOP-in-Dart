import 'dart:math';

///////////////////////////////////////////////////////////
// 1️⃣ Strategy Pattern - AI Plugin System
///////////////////////////////////////////////////////////
abstract class AIPlugin {
  void execute();
}

class WeatherPlugin extends AIPlugin {
  @override
  void execute() {
    print("[LOG]: Executing weather plugin. Today's temperature is 25°C, sunny.");
  }
}

class NewsPlugin extends AIPlugin {
  @override
  void execute() {
    print("[LOG]: Executing news plugin. Today's top news: AI is transforming mobile development!");
  }
}

class ReminderPlugin extends AIPlugin {
  @override
  void execute() {
    print("[LOG]: Executing reminder plugin. Reminder: Your meeting with the Flutter team is at 3 PM.");
  }
}

///////////////////////////////////////////////////////////
// 2️⃣ Factory Pattern - Plugin Factory
///////////////////////////////////////////////////////////
class PluginFactory {
  static AIPlugin? createPlugin(String pluginType) {
    switch (pluginType.toLowerCase()) {
      case "weather":
        return WeatherPlugin();
      case "news":
        return NewsPlugin();
      case "reminder":
        return ReminderPlugin();
      default:
        print("[LOG]: Failed to execute unknown. Unknown plugin type");
        return null;
    }
  }
}

///////////////////////////////////////////////////////////
// 3️⃣ Dependency Injection - Dynamic Plugin Assignment
///////////////////////////////////////////////////////////
class PluginManager {
  AIPlugin? plugin;

  PluginManager(this.plugin);

  void executePlugin() {
    plugin?.execute();
  }
}

///////////////////////////////////////////////////////////
// 4️⃣ Singleton Pattern - AI Assistant
///////////////////////////////////////////////////////////
class AIAssistant {
  static final AIAssistant _instance = AIAssistant._internal();
  factory AIAssistant() => _instance;
  AIAssistant._internal();

  void runPlugin(AIPlugin? plugin) {
    if (plugin != null) {
      plugin.execute();
    }
  }
}

///////////////////////////////////////////////////////////
// 5️⃣ Mixin for Logging
///////////////////////////////////////////////////////////
mixin LoggerMixin {
  void log(String message) {
    print("[LOG]: $message");
  }
}

///////////////////////////////////////////////////////////
// 6️⃣ AI Model Integration - Machine Learning Model Simulation
///////////////////////////////////////////////////////////
class MachineLearningModel {
  String analyze(String input) {
    if (input.contains("weather")) {
      return "weather";
    } else if (input.contains("news")) {
      return "news";
    } else if (input.contains("reminder")) {
      return "reminder";
    } else {
      return "unknown";
    }
  }
}

///////////////////////////////////////////////////////////
// Main function to test AI-powered Virtual Assistant
///////////////////////////////////////////////////////////
void main() {
  // AI Assistant (Singleton)
  AIAssistant assistant = AIAssistant();

  // Machine Learning Model for Plugin Analysis
  MachineLearningModel aiModel = MachineLearningModel();

  // Test Inputs
  List<String> userInputs = [
    "Tell me about the weather",
    "What is today's news?",
    "Remind me about my meeting",
    "Play some music" // Invalid plugin
  ];

  for (String input in userInputs) {
    String detectedPlugin = aiModel.analyze(input);
    AIPlugin? plugin = PluginFactory.createPlugin(detectedPlugin);
    assistant.runPlugin(plugin);
  }
}
