import 'package:flutter/material.dart';

class SendOtpPageView extends StatelessWidget {
  const SendOtpPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CAF87), // Background color
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Verify your phone number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We have sent you an SMS with a code to enter number",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  DropdownButton<String>(
                    value: "+91",
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: const SizedBox(),
                    dropdownColor: const Color(0xFF4CAF87),
                    items: const [
                      DropdownMenuItem(
                        value: "+91",
                        child: Text(
                          "+91",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      DropdownMenuItem(
                        value: "+1",
                        child: Text(
                          "+1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      // Handle country code selection
                    },
                  ),
                  const VerticalDivider(color: Colors.white),
                  const Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "9876543210",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Or login with Social network",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Add your navigation logic or OTP sending code here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF4CAF87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
