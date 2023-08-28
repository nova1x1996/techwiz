import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/FeedbackProvider.dart';


class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<String> selectedFeedbacks = [];
  TextEditingController customFeedbackController = TextEditingController();
  FocusNode customFeedbackFocus = FocusNode();

  final List<String> predefinedFeedbacks = [
    'Overall Service',
    'Customer Support',
    'Speed and Efficiency',
    'Repair Quality',
    'Pickup and Delivery Service',
    'Transparency',
  ];

  @override
  void initState() {
    super.initState();
    customFeedbackFocus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (!customFeedbackFocus.hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushNamed(context, '/Main');
  }

  void _submitFeedback() async {
    final feedbackProvider = Provider.of<FeedbackProvider>(context, listen: false);

    try {
      await feedbackProvider.addFeedback(selectedFeedbacks, customFeedbackController.text);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Thank You!'),
            content: Text('Thank you for your feedback!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _navigateToHomeScreen();
                },
                child: Text('Back to Home'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      if (error is Exception) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Feedback Conflict'),
              content: Text(error.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Đóng hộp thoại lỗi
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else if (error is Exception) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Internal Server Error'),
              content: Text(error.toString()),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Đóng hộp thoại lỗi
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rate Your Experience',
                  style: TextStyle(fontSize: 30),
                ),
                Divider(thickness: 3, color: Colors.grey),
                Text(
                  'Tell us what can be improved?',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: List<Widget>.generate(predefinedFeedbacks.length, (int index) {
                    final String feedback = predefinedFeedbacks[index];
                    return ChoiceChip(
                      label: Text(feedback),
                      selected: selectedFeedbacks.contains(feedback),
                      selectedColor: Colors.green,
                      labelStyle: TextStyle(
                        color: selectedFeedbacks.contains(feedback) ? Colors.white : Colors.black,
                      ),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            if (selectedFeedbacks.length < 6) {
                              selectedFeedbacks.add(feedback);
                            } else {
                              // Notify the user that the maximum selection limit is reached.
                              // You can show a SnackBar or another UI element here.
                            }
                          } else {
                            selectedFeedbacks.remove(feedback);
                          }
                        });
                      },
                    );
                  }),
                ),
                SizedBox(height: 16),
                TextFormField(
                  onTapOutside: (event) {
                    customFeedbackFocus.unfocus();
                  },
                  controller: customFeedbackController,
                  focusNode: customFeedbackFocus,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Tell us how we can improve...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: selectedFeedbacks.isNotEmpty || customFeedbackController.text.isNotEmpty
                      ? _submitFeedback
                      : null,
                  child: Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedFeedbacks.isNotEmpty || customFeedbackController.text.isNotEmpty
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
