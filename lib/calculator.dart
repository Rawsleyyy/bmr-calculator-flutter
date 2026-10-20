// Enum untuk mendefinisikan pilihan jenis kelamin secara aman (type-safe)
enum Gender { male, female }

class BMRCalculator {
  final int height;
  final int weight;
  final int age;
  final Gender gender;

  // Variabel privat untuk menyimpan hasil perhitungan BMR
  double _bmr = 0.0;

  BMRCalculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  /// Fungsi untuk menghitung nilai BMR (kalori/hari) menggunakan rumus Mifflin-St Jeor
  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      _bmr = (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
    // Mengembalikan nilai BMR yang dibulatkan tanpa angka desimal
    return _bmr.toStringAsFixed(0);
  }

  /// Fungsi untuk memberikan status kategori metabolisme basal
  String getCategory() {
    if (_bmr >= 1800) {
      return 'HIGH METABOLISM';
    } else if (_bmr >= 1300) {
      return 'AVERAGE METABOLISM';
    } else {
      return 'LOW METABOLISM';
    }
  }

  /// Fungsi untuk memberikan penjelasan dan estimasi kebutuhan kalori harian
  String getInterpretation() {
    // Menghitung estimasi kalori jika pengguna jarang berolahraga (Sedentary = BMR * 1.2)
    int sedentaryCalories = (_bmr * 1.2).round();
    // Menghitung estimasi kalori jika pengguna aktif berolahraga (Active = BMR * 1.55)
    int activeCalories = (_bmr * 1.55).round();

    return 'Your body burns ${_bmr.toStringAsFixed(0)} kcal/day at complete rest.\n\n'
        'To maintain your weight:\n'
        '• Light activity: ~$sedentaryCalories kcal/day\n'
        '• Moderate exercise: ~$activeCalories kcal/day';
  }
}