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
    switch (pluginType.trim().toLowerCase()) { 
      case "weather":
        return WeatherPlugin();
      case "news":
        return NewsPlugin();
      case "reminder":
        return ReminderPlugin();
      default:
        print("[LOG]: Failed to execute unknown plugin type: $pluginType");
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
    String lowerInput = input.toLowerCase();
    if (lowerInput.contains("weather")) {
      return "weather";
    } else if (lowerInput.contains("news")) {
      return "news";
    } else if (lowerInput.contains("remind")) { 
      return "reminder";
    } else {
      return "unknown";
    }
  }
}

///////////////////////////////////////////////////////////
// ✅ 7️⃣ Singleton Pattern - Caching Mechanism
///////////////////////////////////////////////////////////
class CacheManager {
  static final CacheManager _instance = CacheManager._internal();
  factory CacheManager() => _instance;
  CacheManager._internal();

  final Map<String, String> _cache = {};

  void storeResponse(String key, String response) {
    _cache[key] = response;
  }

  String? getResponse(String key) {
    return _cache[key];
  }
}

///////////////////////////////////////////////////////////
// ✅ 8️⃣ Updating AI Assistant to Use Cache
///////////////////////////////////////////////////////////
class AIAssistantWithCache {
  static final AIAssistantWithCache _instance = AIAssistantWithCache._internal();
  factory AIAssistantWithCache() => _instance;
  AIAssistantWithCache._internal();

  final CacheManager _cacheManager = CacheManager();

  void runPlugin(AIPlugin? plugin, String input) {
    if (plugin != null) {
      String? cachedResponse = _cacheManager.getResponse(input);
      if (cachedResponse != null) {
        print("[CACHE]: Retrieving cached response -> $cachedResponse");
      } else {
        plugin.execute();
        _cacheManager.storeResponse(input, "Response from ${plugin.runtimeType}");
      }
    }
  }
}

///////////////////////////////////////////////////////////
// Main function to test AI-powered Virtual Assistant
///////////////////////////////////////////////////////////
void main() {
  // AI Assistant with Cache
  AIAssistantWithCache assistantWithCache = AIAssistantWithCache();

  // Machine Learning Model for Plugin Analysis
  MachineLearningModel aiModel = MachineLearningModel();

  // Test Inputs
  List<String> userInputs = [
    "Tell me about the weather",
    "What is today's news?",
    "Remind me about my meeting",
    "Tell me about the weather", // Repeated input (should be cached)
    "What is today's news?", // Repeated input (should be cached)
    "Remind me about my meeting", //  Repeated input (should be cached)
    "Tell me a joke" //  Example of an unknown input
  ];

  for (String input in userInputs) {
    String detectedPlugin = aiModel.analyze(input);
    AIPlugin? plugin = PluginFactory.createPlugin(detectedPlugin);
    assistantWithCache.runPlugin(plugin, input);
  }
}
