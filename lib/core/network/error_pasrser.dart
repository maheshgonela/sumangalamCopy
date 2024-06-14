String defaultErrorParser(
    Map<String, dynamic> obResponse, String defErrorMessage) {
  try {
    if (obResponse.containsKey('error') || obResponse['error'] != null) {
      final error = obResponse['error'];
      if (error is String) {
        return error;
      } else if (error is Map<String, dynamic>) {
        return obResponse['error']['message'];
      }
    } else if (obResponse['message'] != null || obResponse['errors'] != null) {
      final errors = obResponse['errors'] as Map<String, dynamic>;
      return errors.values.toString();
    }
    return obResponse['error'] ?? defErrorMessage;
  } catch (_) {
    throw const FormatException('Unrecognized json error response');
  }
}
