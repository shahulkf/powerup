import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRIVACY POLICY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('''At power up,
              
               one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by power up and how we use it.
              
              If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.
              
              Log Files
              power up follows a standard procedure of using log files. These files log visitors when they use app. The information collected by log files include internet protocol (IP) addresses, browser type, Internet Service Provider (ISP), date and time stamp, referring/exit pages, and possibly the number of clicks. These are not linked to any information that is personally identifiable. The purpose of the information is for analyzing trends, administering the app, tracking users' movement on the app, and gathering demographic information.
              
              Our Advertising Partners
              Some of advertisers in our app may use cookies and web beacons. Our advertising partners are listed below. Each of our advertising partners has their own Privacy Policy for their policies on user data. For easier access, we hyperlinked to their Privacy Policies below.
              
              Google
              
              https://policies.google.com/technologies/ads
              
              Privacy Policies
              You may consult this list to find the Privacy Policy for each of the advertising partners of power up.
              
              Third-party ad servers or ad networks uses technologies like cookies, JavaScript, or Beacons that are used in their respective advertisements and links that appear on power up. They automatically receive your IP address when this occurs. These technologies are used to measure the effectiveness of their advertising campaigns and/or to personalize the advertising content that you see on this app or other apps or websites.
              
              Note that power up has no access to or control over these cookies that are used by third-party advertisers.
              
              Third Party Privacy Policies
              power up's Privacy Policy does not apply to other advertisers or websites. Thus, we are advising you to consult the respective Privacy Policies of these third-party ad servers for more detailed information. It may include their practices and instructions about how to opt-out of certain options.
              
              Children's Information
              Another part of our priority is adding protection for children while using the internet. We encourage parents and guardians to observe, participate in, and/or monitor and guide their online activity.
              
              power up does not knowingly collect any Personal Identifiable Information from children under the age of 13. If you think that your child provided this kind of information on our App, we strongly encourage you to contact us immediately and we will do our best efforts to promptly remove such information from our records.
              
              Consent
              By using our app, you hereby consent to our Privacy Policy and agree to its Terms and Conditions.''',style: TextStyle(),textAlign: TextAlign.start,)
             , SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
