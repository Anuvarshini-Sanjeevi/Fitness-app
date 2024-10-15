import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacySecurityPage extends StatefulWidget {
  @override
  _PrivacySecurityPageState createState() => _PrivacySecurityPageState();
}

class _PrivacySecurityPageState extends State<PrivacySecurityPage> {
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy and Security',style: GoogleFonts.lato(textStyle:TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your privacy is important to us. At our company, we are committed to protecting your personal information and ensuring your experience with us is safe and secure.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Text(
              'Security Measures',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We have implemented various security measures to protect your personal information from unauthorized access, alteration, disclosure, or destruction. These measures include, but are not limited to, the following:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '- Encryption of sensitive data in transit and at rest',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Regular security updates and patches',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Access controls and strict permissions for our employees and contractors',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Security training and awareness programs for our employees and contractors',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '- Regular security audits and assessments',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Checkbox(
                  value: _acceptTerms,
                  onChanged: (value) {
                    setState(() {
                      _acceptTerms = value!;
                    });
                  },
                ),
                Text(
                  'I accept the terms and conditions',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _acceptTerms ? () {} : null,
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}