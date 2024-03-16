// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:korbil_mobile/repository/metadata/models/document_type.dart';

class UploadFile {
  UploadFile({
    required this.key,
    required this.accessUrl,
  });

  factory UploadFile.fromJson(Map<String, dynamic> json) => UploadFile(
        key: json['key'] as String,
        accessUrl: json['accessUrl'] as String,
      );

  String key;
  String accessUrl;

  Map<String, dynamic> toJson() => {
        'key': key,
        'accessUrl': accessUrl,
      };
}

class UploadedFile {
  UploadedFile({
    required this.documentType,
    required this.file,
  });

  final DocumentType documentType;
  final UploadFile file;

  factory UploadedFile.fromMap(Map<String, dynamic> json) => UploadedFile(
        documentType:
            DocumentType.fromJson(json['documentType'] as Map<String, dynamic>),
        file: UploadFile.fromJson(json['file'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'documentType': documentType.toJson(),
      'file': file.toJson(),
    };
  }
}
