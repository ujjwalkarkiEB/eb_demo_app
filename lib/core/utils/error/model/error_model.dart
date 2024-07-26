class ErrorModel {
  final bool success;
  final String message;
  final String? code;
  final String? userId;

  ErrorModel({
    required this.success,
    required this.message,
    this.code,
    this.userId,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    String extractedMessage;
    if (json.containsKey('errors') && json['errors']['message'] != null) {
      extractedMessage = (json['errors']['message'] as List).join(' ');
    } else if (json.containsKey('message')) {
      extractedMessage = json['message'];
    } else {
      extractedMessage = 'Unknown error';
    }

    return ErrorModel(
      success: json['success'] ?? false,
      message: extractedMessage,
      code: json['code'],
      userId: json['userId'],
    );
  }

  @override
  String toString() {
    return 'ErrorModel(success: $success, message: $message, code: $code, userId: $userId)';
  }
}
