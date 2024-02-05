

extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
}

String getCurrentDate() {
    DateTime now = DateTime.now();
    
    String formattedDate = "${now.day}-${now.month}-${now.year}";
    return formattedDate;
  }

 