import 'package:meta/meta.dart';

class SelectionModel {
  SelectionModel({
    @required this.icons,
  });

  factory SelectionModel.fromJson(Map<String, dynamic> json) {
    final icons = json['icons'] as List<dynamic>;

    return SelectionModel(
        icons: icons
            .map((icon) => IcomoonIcon.fromJson(icon as Map<String, dynamic>))
            .toList());
  }

  final List<IcomoonIcon> icons;
}

class IcomoonIcon {
  IcomoonIcon({@required this.properties});

  factory IcomoonIcon.fromJson(Map<String, dynamic> json) {
    final properties = json['properties'] as Map<String, dynamic>;

    return IcomoonIcon(properties: IconProperties.fromJson(properties));
  }

  final IconProperties properties;
}

class IconProperties {
  IconProperties({@required this.name, @required this.code});

  factory IconProperties.fromJson(Map<String, dynamic> json) {
    return IconProperties(
      name: json['name'] as String,
      code: json['code'] as int,
    );
  }

  final String name;
  final int code;
}
