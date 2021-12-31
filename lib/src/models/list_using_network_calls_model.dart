class ListUsingNetworkCallsModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  ListUsingNetworkCallsModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory ListUsingNetworkCallsModel.fromJSON(Map<String, dynamic> map) {
    return ListUsingNetworkCallsModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}
