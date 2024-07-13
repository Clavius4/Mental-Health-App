import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frequently Asked Questions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Frequently Asked Questions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildFAQItem(
              'What is this app about?',
              'This app uses machine learning to detect mental health issues such as depression, anxiety, and stress based on user inputs and interactions.',
            ),
            _buildFAQItem(
              'How does the app detect mental health issues?',
              'The app uses trained machine learning models to analyze user inputs and provide an assessment based on established mental health criteria.',
            ),
            _buildFAQItem(
              'Is my data safe?',
              'Yes, your data is securely stored and processed in accordance with our Privacy Policy. We take all necessary measures to ensure your data is protected.',
            ),
            _buildFAQItem(
              'Can I rely on the app for medical diagnosis?',
              'No, this app is not a substitute for professional medical advice, diagnosis, or treatment. It is designed to provide general information to help users understand their mental health better.',
            ),
            _buildFAQItem(
              'How can I get more accurate results?',
              'For more accurate results, ensure you answer all questions honestly and accurately. The app\'s effectiveness depends on the quality and accuracy of the data you provide.',
            ),
            _buildFAQItem(
              'What should I do if I am experiencing severe mental health issues?',
              'If you are experiencing severe mental health issues, please seek professional help immediately. This app is not designed to handle emergencies or provide crisis intervention.',
            ),
            _buildFAQItem(
              'Can I use the app offline?',
              'No, the app requires an internet connection to function properly, as it needs to communicate with our servers to process data and provide results.',
            ),
            _buildFAQItem(
              'How can I contact support?',
              'You can contact our support team through the app by navigating to the "Contact Us" section or by emailing support@mentalhealthapp.com.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            question,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            answer,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
