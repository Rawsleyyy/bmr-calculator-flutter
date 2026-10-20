import 'package:flutter/material.dart';

// Konstanta ukuran dan warna utama sesuai desain Dark UI
const double kBottomContainerHeight = 75.0;
const Color kActiveCardColor = Color(0xFF1D1E33); // Warna saat kartu dipilih/aktif
const Color kInactiveCardColor = Color(0xFF111328); // Warna saat kartu tidak dipilih
const Color kBottomContainerColor = Color(0xFFEB1555); // Warna aksen tombol merah muda
const Color kOverlayAccentColor = Color(0x29EB1555); // Efek bayangan pada slider

// Gaya teks untuk label (contoh: MALE, FEMALE, HEIGHT, WEIGHT, AGE)
const TextStyle kLabelTextStyle = TextStyle(
  fontSize: 16.0,
  color: Color(0xFF8D8E98),
  letterSpacing: 1.2,
  fontWeight: FontWeight.w500,
);

// Gaya teks untuk angka besar (Tinggi, Berat, Usia)
const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 48.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

// Gaya teks untuk tombol bawah (CALCULATE / RE-CALCULATE)
const TextStyle kLargeButtonTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.5,
  color: Colors.white,
);

// Gaya teks judul "Your Result"
const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 42.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

// Gaya teks kategori hasil di halaman Result
const TextStyle kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.2,
);

// Gaya teks angka hasil BMR utama
const TextStyle kBMRTextStyle = TextStyle(
  fontSize: 72.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

// Gaya teks penjelasan/rekomendasi di bagian bawah kartu hasil
const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white70,
  height: 1.5,
);