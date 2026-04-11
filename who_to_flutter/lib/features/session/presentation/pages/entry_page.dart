import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'create_session_page.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background shapes migration placeholder
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/bg-shapes.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Hero Logo
                    Container(
                      width: 40,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: AppColors.accentGradient,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Who2Meet',
                      style: AppTextStyles.heroTitle,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Smart team matching for everyone',
                      style: AppTextStyles.heroSubtitle,
                    ),
                    const SizedBox(height: 48),
                    // Entry Card
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Enter Session Code',
                              style: AppTextStyles.sectionTitle,
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _codeController,
                              decoration: const InputDecoration(
                                hintText: 'ABCDEF',
                                counterText: '',
                              ),
                              maxLength: 6,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.heroTitle.copyWith(
                                fontSize: 24,
                                letterSpacing: 4,
                              ),
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              onPressed: () {
                                // Join Logic
                              },
                              child: const Text('Join Session'),
                            ),
                            const SizedBox(height: 16),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CreateSessionPage(),
                                  ),
                                );
                              },
                              child: const Text('Create New Session'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
