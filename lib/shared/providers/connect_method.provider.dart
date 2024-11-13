import 'package:mentor/shared/models/connect_method.model.dart';

class ConnectMethodProvider {
  static ConnectMethodProvider get shared => ConnectMethodProvider();
  List<ConnectMethodModel> get connectMethods => const [
        ConnectMethodModel(id: "1", name: "Google meet"),
        ConnectMethodModel(id: "2", name: "Skype"),
        ConnectMethodModel(id: "3", name: "Face to face"),
      ];
}
