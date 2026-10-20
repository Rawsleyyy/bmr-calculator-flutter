import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_card.dart';
import 'calculator.dart';
import 'result_page.dart';

void main() {
  runApp(const BMRCalculatorApp());
}

/// Root Widget aplikasi untuk mengatur tema global
class BMRCalculatorApp extends StatelessWidget {
  const BMRCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMR Calculator',
      // Mengatur skema warna Dark Mode sesuai referensi desain
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.white,
          ),
        ),
      ),
      home: const InputPage(),
    );
  }
}

/// Halaman Input utama menggunakan StatefulWidget karena datanya dinamis
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // State awal untuk masing-masing variabel input
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // BARIS 1: Pilihan Gender (MALE & FEMALE)
          Expanded(
            child: Row(
              children: [
                // Kartu MALE
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      // Memperbarui state gender menjadi Male saat ditekan
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: Icons.male,
                      label: 'MALE',
                      iconColor: selectedGender == Gender.male
                          ? Colors.white
                          : const Color(0xFF8D8E98),
                    ),
                  ),
                ),
                // Kartu FEMALE
                Expanded(
                  child: CustomCard(
                    onPress: () {
                      // Memperbarui state gender menjadi Female saat ditekan
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: Icons.female,
                      label: 'FEMALE',
                      iconColor: selectedGender == Gender.female
                          ? Colors.white
                          : const Color(0xFF8D8E98),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // BARIS 2: Slider Tinggi Badan (HEIGHT)
          Expanded(
            child: CustomCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      const SizedBox(width: 4.0),
                      const Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  // Kustomisasi tampilan Slider agar identik dengan UI referensi
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      overlayColor: kOverlayAccentColor,
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: const RoundSliderOverlayShape(
                        overlayRadius: 28.0,
                      ),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        // Mengubah nilai tinggi badan secara real-time saat slider digeser
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // BARIS 3: Berat Badan (WEIGHT) & Usia (AGE)
          Expanded(
            child: Row(
              children: [
                // Kartu WEIGHT
                Expanded(
                  child: CustomCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Kartu AGE (Wajib ada pada rumus BMR)
                Expanded(
                  child: CustomCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                            ),
                            const SizedBox(width: 15.0),
                            RoundIconButton(
                              icon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  if (age < 120) age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // TOMBOL BAWAH: CALCULATE
          GestureDetector(
            onTap: () {
              // 1. Membuat objek BMRCalculator dengan mengirimkan data state saat ini
              BMRCalculator calc = BMRCalculator(
                height: height,
                weight: weight,
                age: age,
                gender: selectedGender,
              );

              // 2. Menjalankan perhitungan dan berpindah ke halaman ResultPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmrResult: calc.calculateBMR(),
                    resultCategory: calc.getCategory(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              alignment: Alignment.center,
              child: const Text(
                'CALCULATE',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}