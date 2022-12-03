// To parse this JSON data, do
//
//     final paperModel = paperModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

QuestionPaperModel paperModelFromJson(String str) =>
    QuestionPaperModel.fromJson(json.decode(str));

String paperModelToJson(QuestionPaperModel data) => json.encode(data.toJson());

class QuestionPaperModel {
  QuestionPaperModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questionCount,
    this.questions,
  });

  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Question>? questions;
  int questionCount;

  factory QuestionPaperModel.fromJson(Map<String, dynamic> json) =>
      QuestionPaperModel(
        id: json["id"],
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"],
        timeSeconds: json["time_seconds"],
        questions: List<Question>.from(
            json["questions"].map((x) => Question.fromJson(x))),
        questionCount: 0,
      );

  factory QuestionPaperModel.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> json) =>
      QuestionPaperModel(
        id: json.id,
        title: json["title"],
        imageUrl: json["image_url"],
        description: json["description"],
        timeSeconds: json["time_seconds"],
        questions: [],
        questionCount: json['question_count'] as int,
      );

  String timeInMinutes() => "${(timeSeconds / 60).ceil()} mins";

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image_url": imageUrl,
        "Description": description,
        "time_seconds": timeSeconds,
        // "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
      };
}

class Question {
  Question({
    required this.id,
    required this.question,
    required this.answers,
    this.correctAnswer,
  });

  String id;
  String question;
  List<Answer> answers;
  String? correctAnswer;
  String? selectedAnswer;

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        question: json["question"],
        answers:
            List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
        correctAnswer: json["correct_answer"],
      );

  factory Question.fromSnapshot(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      Question(
        id: json.id,
        question: json["question"],
        answers: [],
        correctAnswer: json["correct_answer"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "answers": List<dynamic>.from(answers.map((x) => x.toJson())),
        "correct_answer": correctAnswer,
      };
}

class Answer {
  Answer({
    this.identifier,
    this.answer,
  });

  final String? identifier;
  final String? answer;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        identifier: json["identifier"] as String?,
        answer: json["Answer"] as String?,
      );
  factory Answer.fromSnapshot(
          QueryDocumentSnapshot<Map<String, dynamic>> json) =>
      Answer(
        identifier: json["identifier"] as String?,
        answer: json["answer"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "Answer": answer,
      };
}
