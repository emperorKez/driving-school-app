

class HelpTopic {

    HelpTopic({
        required this.id,
        required this.languageId,
        this.question,
        this.answer,
    });

    factory HelpTopic.fromJson(Map<String, dynamic> json) => HelpTopic(
        id: json['id'] as int,
        languageId: json['languageId'] as int,
        question: json['question'] as String,
        answer: json['answer'] as String,
    );
    int id;
    int languageId;
    String? question;
    String? answer;

    Map<String, dynamic> toJson() => {
        'id': id,
        'languageId': languageId,
        'question': question,
        'answer': answer,
    };
}
