import 'package:flutter/material.dart';
import 'constants.dart';

/// Widget kartu kustom yang dapat digunakan kembali (Reusable Widget)
class CustomCard extends StatelessWidget {
  final Color color;
  final Widget? cardChild;
  final VoidCallback? onPress; // Fungsi callback saat kartu ditekan

  const CustomCard({
    super.key,
    required this.color,
    this.cardChild,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    // GestureDetector mendeteksi interaksi ketukan (tap) dari pengguna
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: cardChild,
      ),
    );
  }
}

/// Widget untuk menampilkan ikon dan teks di dalam kartu Gender (MALE / FEMALE)
class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const IconContent({
    super.key,
    required this.icon,
    required this.label,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        const SizedBox(height: 12.0),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}

/// Widget tombol bulat kustom untuk tombol (+) dan (-)
class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 4.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}