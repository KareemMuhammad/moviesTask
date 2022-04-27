
class NotificationModel{
  static const String TITLE = "title";
  static const String NOT_ID = "id";
  static const String BODY = "body";
  static const String ICON = "icon";

  String? title;
  String? body;
  String? icon;
  String? id;

  NotificationModel({this.title, this.body,this.icon,this.id});


  Map<String,dynamic> toMap()=>{
    TITLE : title ?? '',
    BODY : body ?? '',
    ICON : icon ?? '',
    NOT_ID : id ?? ''
  };
}