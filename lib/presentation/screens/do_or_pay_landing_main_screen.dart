import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import '../styles/button_styles.dart';
import '../styles/colors.dart';
import '../styles/text_styles.dart';

class LandingMainScreen extends StatefulWidget {
  const LandingMainScreen({super.key});

  @override
  State<LandingMainScreen> createState() => _LandingMainScreenState();
}

class _LandingMainScreenState extends State<LandingMainScreen>
    with TickerProviderStateMixin {
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  void _logPageVisit() {
    analytics.logEvent(name: 'screen_view', parameters: <String, dynamic>{
      'screen_name': 'Landing Page',
    });
  }

  void _logGooglePlayClick() {
    analytics.logEvent(name: 'select_content', parameters: <String, dynamic>{
      'content_type': 'button',
      'item_id': 'google_play_click',
    });
  }

  void _logAppleStoreClick() {
    analytics.logEvent(name: 'select_content', parameters: <String, dynamic>{
      'content_type': 'button',
      'item_id': 'apple_store_click',
    });
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _logPageVisit();
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

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      backgroundColor: AppColors.background,
      body:
          isMobile ? _buildMobileScreen(context) : _buildDesktopScreen(context),
    );
  }

  Widget _buildDesktopScreen(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenHeight = constraints.maxHeight;
        double imageHeight = screenHeight * 0.66;
        double leftPadding = constraints.maxWidth * 0.016;
        double bottomPadding = constraints.maxWidth * 0.016;
        double topPadding = constraints.maxWidth * 0.04;

        return Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 8),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: leftPadding,
                        bottom: bottomPadding,
                        top: topPadding,
                      ),
                      child: Transform.translate(
                        offset: const Offset(80, 0),
                        child: Image.asset(
                          'assets/images/payment_landing.png',
                          height: imageHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      Center(
                        child: Text(
                          'A unique way to organize yourself - \npay for unrealized goals',
                          style: AppTextStyles.h.copyWith(fontSize: 40),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Download now and start your day productive',
                                style: AppTextStyles.button
                                    .copyWith(color: AppColors.charcoal),
                              ),
                              const SizedBox(height: 16),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.16),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          _logGooglePlayClick();
                                        },
                                        icon: const Icon(Icons.shop_rounded,
                                            color: AppColors.charcoal),
                                        style: AppButtonStyle.settingsButton,
                                        label: Text(
                                          'Google play',
                                          style: AppTextStyles.h1.copyWith(
                                              color: AppColors.charcoal),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Expanded(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          _logAppleStoreClick();
                                          print(
                                              'Tapped apple store buttttttton');
                                        },
                                        icon: const Icon(Icons.apple_rounded,
                                            color: AppColors.charcoal),
                                        style: AppButtonStyle.settingsButton,
                                        label: Text(
                                          'Apple store',
                                          style: AppTextStyles.h1.copyWith(
                                              color: AppColors.charcoal),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: 40,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          color: AppColors.littleDarkerSoftGray),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(''),
                        Padding(
                          padding: const EdgeInsets.all(32),
                          child: Align(
                            child: Image.asset(
                              'assets/images/list_screen_landing.png',
                              height: imageHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                decoration:
                    const BoxDecoration(color: AppColors.littleDarkerSoftGray),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/images/app_icon.png',
                        width: 60,
                        height: 60,
                      ),
                      Text(
                        'D O  or  P A Y',
                        style: AppTextStyles.h.copyWith(fontSize: 50),
                        textAlign: TextAlign.center,
                      ),
                      Positioned(
                        left: 0,
                        bottom: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: AnimatedBuilder(
                            animation: _controller,
                            builder: (context, child) {
                              return Opacity(
                                opacity: _controller.value,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.veryDarkerSoftGray,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMobileScreen(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageHeight = screenHeight * 0.5;

    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration:
              const BoxDecoration(color: AppColors.littleDarkerSoftGray),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/app_icon.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  'D O  or  P A Y',
                  style: AppTextStyles.h.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _controller.value,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.veryDarkerSoftGray,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/payment_landing.png',
                    height: imageHeight,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Text(
                    'A unique way to organize yourself - \npay for unrealized goals',
                    style: AppTextStyles.h.copyWith(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/list_screen_landing.png',
                    height: imageHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: Column(
                    children: [
                      Text(
                        'Download now and start your day productive',
                        style: AppTextStyles.button
                            .copyWith(color: AppColors.charcoal),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _logGooglePlayClick();
                                },
                                icon: const Icon(Icons.shop_rounded,
                                    color: AppColors.charcoal),
                                style: AppButtonStyle.settingsButton,
                                label: Text(
                                  'Google play',
                                  style: AppTextStyles.h1
                                      .copyWith(color: AppColors.charcoal),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _logAppleStoreClick();
                                },
                                icon: const Icon(Icons.apple_rounded,
                                    color: AppColors.charcoal),
                                style: AppButtonStyle.settingsButton,
                                label: Text(
                                  'Apple store',
                                  style: AppTextStyles.h1
                                      .copyWith(color: AppColors.charcoal),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
