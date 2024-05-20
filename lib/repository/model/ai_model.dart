

class Aimodel {
    String? imageUrl;
    String? message;

    Aimodel({this.imageUrl, this.message});

    Aimodel.fromJson(Map<String, dynamic> json) {
        if(json["imageUrl"] is String) {
            imageUrl = json["imageUrl"];
        }
        if(json["message"] is String) {
            message = json["message"];
        }
    }

    static List<Aimodel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Aimodel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["imageUrl"] = imageUrl;
        _data["message"] = message;
        return _data;
    }

    Aimodel copyWith({
        String? imageUrl,
        String? message,
    }) => Aimodel(
        imageUrl: imageUrl ?? this.imageUrl,
        message: message ?? this.message,
    );
}