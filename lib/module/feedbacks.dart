import 'package:flutter/material.dart';

class feedbacks{
  final String User_ID;
  final Contact;
  final String Name;
  final String Feedback;


  feedbacks(
      {required this.User_ID,
      this.Contact,
      required this.Name,
      required this.Feedback,
     });
}