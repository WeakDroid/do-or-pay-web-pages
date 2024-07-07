import 'package:do_or_pay_web_landing/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../styles/button_styles.dart';
import '../styles/colors.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1488),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchEmailClient() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'doorpayapp@gmail.com',
    );
    launchUrl(emailLaunchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildScreen(),
    );
  }

  Widget _buildScreen() {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(''),
            Column(
              children: [
                _buildTitle(),
                const SizedBox(height: 32),
                _buildDescriptionText(),
              ],
            ),
            _buildSendButton(),
          ],
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: AppColors.littleDarkerSoftGray),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  'Do or Pay,  2024',
                  style:
                      AppTextStyles.button.copyWith(color: AppColors.charcoal),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 8,
          child: Image.asset(
            'assets/images/app_icon.png',
            width: 60,
            height: 60,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'DO or POST',
          style: AppTextStyles.h.copyWith(fontSize: 50),
        ),
        const SizedBox(
          width: 24,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Opacity(
                opacity: _controller.value,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.veryDarkerSoftGray,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        'If you have any questions or need assistance, press the button below.',
        textAlign: TextAlign.center,
        style: AppTextStyles.h.copyWith(fontSize: 36),
      ),
    );
  }

  Widget _buildSendButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.69,
        child: ElevatedButton.icon(
          onPressed: () {
            _launchEmailClient();
          },
          style: AppButtonStyle.settingsButton,
          icon: const Icon(Icons.email, color: AppColors.charcoal),
          label: Text(
            'Contact us',
            style: AppTextStyles.h1.copyWith(color: AppColors.charcoal),
          ),
        ),
      ),
    );
  }
}
