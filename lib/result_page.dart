import 'package:flutter/material.dart';
import 'constants.dart';
import 'custom_card.dart';

class ResultPage extends StatelessWidget {
  final String bmrResult;
  final String resultCategory;
  final String interpretation;

  const ResultPage({
    super.key,
    required this.bmrResult,
    required this.resultCategory,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMR CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Bagian Judul "Your Result"
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),

          // Bagian Kartu Hasil Utama
          Expanded(
            flex: 5,
            child: CustomCard(
              color: kActiveCardColor,
              cardChild: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Teks kategori metabolisme berwarna hijau
                    Text(
                      resultCategory,
                      style: kResultTextStyle,
                    ),

                    // Angka hasil BMR + satuan kcal/day
                    Column(
                      children: [
                        Text(
                          bmrResult,
                          style: kBMRTextStyle,
                        ),
                        const Text(
                          'kcal / day',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),

                    // Penjelasan detail kebutuhan kalori
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tombol RE-CALCULATE untuk kembali ke halaman input
          GestureDetector(
            onTap: () {
              // Mengembalikan pengguna ke halaman sebelumnya (InputPage)
              Navigator.pop(context);
            },
            child: Container(
              color: kBottomContainerColor,
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              alignment: Alignment.center,
              child: const Text(
                'RE-CALCULATE',
                style: kLargeButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}