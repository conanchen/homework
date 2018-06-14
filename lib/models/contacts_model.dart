// A ListItem that contains data to display an contact fast index, e.g. A B C
class IndexItem implements ListItem {
  final String shortcut;

  IndexItem(this.shortcut);
}

List<IndexItem> dummyContactIndexData = [
  //像日历排布
  IndexItem("A"),IndexItem("B"),IndexItem("C"),IndexItem("D"),IndexItem("E"), IndexItem("F"),IndexItem("G"),
  IndexItem("H"),IndexItem("I"),IndexItem("J"), IndexItem("K"),IndexItem("L"),IndexItem("M"),IndexItem("N"),
  IndexItem("O"), IndexItem("P"),IndexItem("Q"),IndexItem("R"),IndexItem("S"),IndexItem("T"),IndexItem("U"),
  IndexItem("V"),IndexItem("W"),IndexItem("X"),IndexItem("Y"),IndexItem("Z"),IndexItem("☆"),IndexItem("标签"),
  IndexItem("群组"),IndexItem("老师"),IndexItem("老师"),IndexItem("老师"),IndexItem("老师"),IndexItem("老师"),IndexItem("客服"),
];

// A ListItem that contains data to display a contact
class ChatModel implements ListItem {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel({this.name, this.message, this.time, this.avatarUrl});
}

List<ChatModel> dummyContactsData = [
  new ChatModel(
      name: "Pawan Kumar",
      message: "Hey Flutter, You are so amazing !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Harvey Spectre",
      message: "Hey I have hacked whatsapp!",
      time: "17:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Mike Ross",
      message: "Wassup !",
      time: "5:00",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Rachel",
      message: "I'm good!",
      time: "10:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Barry Allen",
      message: "I'm the fastest man alive!",
      time: "12:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
];




// The base class for the different types of items the List can contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}