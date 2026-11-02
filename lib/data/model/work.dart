class Work {
  final int? workId;
  final String title;
  final String description;
  final bool hoanThanh;

  Work({
    this.workId,
    required this.title,
    required this.description,
    required this.hoanThanh
  });

  Map<String, dynamic> toMap() {
    return {
      if(workId != null) 'workId': workId,
      'title': title,
      'description': description,
      'hoanThanh': hoanThanh ? 1 : 0
    };
  }

  factory Work.fromMap(Map<String, dynamic> map){
    return Work(
      workId: map['workId'] as int?,
      title: map['title'] as String,
      description: map['description'] as String,
      hoanThanh: map['hoanThanh'] == 1
    );
  }
}
