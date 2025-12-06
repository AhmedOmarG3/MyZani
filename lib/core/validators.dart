class Validators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a name.';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long.';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an amount.';
    }

    final parsed = double.tryParse(value);
    if (parsed == null) {
      return 'Amount must be a valid number.';
    }

    if (parsed <= 0) {
      return 'Amount must be greater than zero.';
    }

    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please add a short description.';
    }

    if (value.trim().length < 5) {
      return 'Description is too short. Add more details.';
    }

    return null;
  }

  static String? validateDate(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Please select a date.";
    }

    try {
      final selectedDate = DateTime.parse(value);
      final now = DateTime.now();

      if (selectedDate.isAfter(now)) {
        return "The selected date cannot be in the future.";
      }

      return null;
    } catch (_) {
      return "Invalid date format.";
    }
  }
}


