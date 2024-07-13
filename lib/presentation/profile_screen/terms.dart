import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Terms and Conditions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildSectionTitle('1. Introduction'),
            _buildSectionContent(
                'Welcome to Machine Learning for Detection of Mental Health Disorder. These terms and conditions will govern your use of our mobile application for the detection of mental health disorders. By accessing or using the App, you agree to be bound by these Terms.'),
            SizedBox(height: 20),
            _buildSectionTitle('2. Acceptance of Terms'),
            _buildSectionContent(
                'By downloading, installing, or using this App, you acknowledge that you have read, understood, and agree to be bound by these Terms. If you do not agree to these Terms, you must not use the App.'),
            SizedBox(height: 20),
            _buildSectionTitle('3. User Accounts'),
            _buildSectionContent(
                'To access certain features of the App, you may be required to create an account. You agree to:\n- Provide accurate, current, and complete information during the registration process.\n- Maintain and promptly update your account information to keep it accurate, current, and complete.\n- Be responsible for safeguarding your password and for any activities or actions under your account.'),
            SizedBox(height: 20),
            _buildSectionTitle('4. Use of the App'),
            _buildSectionContent(
                'The App is intended for informational and educational purposes only. It is not a substitute for professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.'),
            SizedBox(height: 20),
            _buildSectionTitle('5. Privacy Policy'),
            _buildSectionContent(
                'Our Privacy Policy explains how we collect, use, and protect your personal information. By using the App, you agree to the terms of our Privacy Policy, which is incorporated into these Terms by reference.'),
            SizedBox(height: 20),
            _buildSectionTitle('6. Intellectual Property'),
            _buildSectionContent(
                'All content, features, and functionality of the App, including but not limited to text, graphics, logos, and software, are the exclusive property of Machine Learning for Detection of Mental Health Disorder or its licensors and are protected by copyright, trademark, and other intellectual property laws.'),
            SizedBox(height: 20),
            _buildSectionTitle('7. User Conduct'),
            _buildSectionContent(
                'You agree not to use the App to:\n- Violate any local, state, national, or international law;\n- Infringe upon or violate our intellectual property rights or the intellectual property rights of others;\n- Upload or transmit viruses or any other type of malicious code;\n- Collect or track the personal information of others without their consent;\n- Spam, phish, pharm, pretext, spider, crawl, or scrape.'),
            SizedBox(height: 20),
            _buildSectionTitle('8. Termination'),
            _buildSectionContent(
                'We may terminate or suspend your account and access to the App at our sole discretion, without prior notice or liability, for any reason, including if you breach the Terms. Upon termination, your right to use the App will immediately cease.'),
            SizedBox(height: 20),
            _buildSectionTitle('9. Limitation of Liability'),
            _buildSectionContent(
                'To the fullest extent permitted by law, Machine Learning for Detection of Mental Health Disorder shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues, whether incurred directly or indirectly, or any loss of data, use, goodwill, or other intangible losses, resulting from:\n- Your use or inability to use the App;\n- Any unauthorized access to or use of our servers and/or any personal information stored therein;\n- Any bugs, viruses, Trojan horses, or the like that may be transmitted to or through our App by any third party;\n- Any errors or omissions in any content or for any loss or damage incurred as a result of the use of any content posted, emailed, transmitted, or otherwise made available through the App.'),
            SizedBox(height: 20),
            _buildSectionTitle('10. Governing Law'),
            _buildSectionContent(
                'These Terms shall be governed by and construed in accordance with the laws of [Your Jurisdiction]. Any disputes arising from these Terms or the use of the App will be resolved in the courts of [Your Jurisdiction].'),
            SizedBox(height: 20),
            _buildSectionTitle('11. Contact Information'),
            _buildSectionContent(
                'If you have any questions about these Terms, please contact us at faustine122@gmail.com.'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 16),
    );
  }
}
