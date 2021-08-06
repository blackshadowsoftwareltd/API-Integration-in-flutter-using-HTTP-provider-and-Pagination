 // To parse this JSON data, do
//
//     final passengerModel = passengerModelFromJson(jsonString);

import 'dart:convert';

class PassengerModel {
    PassengerModel({
        this.totalPassengers,
        this.totalPages,
        this.data,
    });

    final int? totalPassengers;
    final int ?totalPages;
    final List<Passenger> ?data;

    factory PassengerModel.fromRawJson(String str) => PassengerModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PassengerModel.fromJson(Map<String, dynamic> json) => PassengerModel(
        totalPassengers: json["totalPassengers"] == null ? null : json["totalPassengers"],
        totalPages: json["totalPages"] == null ? null : json["totalPages"],
        data: json["data"] == null ? null : List<Passenger>.from(json["data"].map((x) => Passenger.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalPassengers": totalPassengers == null ? null : totalPassengers,
        "totalPages": totalPages == null ? null : totalPages,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Passenger {
    Passenger({
        this.id,
        this.name,
        this.trips,
        this.airline,
        this.v,
    });

    final String? id;
    final String? name;
    final int? trips;
    final List<Airline>? airline;
    final int? v;

    factory Passenger.fromRawJson(String str) => Passenger.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Passenger.fromJson(Map<String, dynamic> json) => Passenger(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        trips: json["trips"] == null ? null : json["trips"],
        airline: json["airline"] == null ? null : List<Airline>.from(json["airline"].map((x) => Airline.fromJson(x))),
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
        "trips": trips == null ? null : trips,
        "airline": airline == null ? null : List<dynamic>.from(airline!.map((x) => x.toJson())),
        "__v": v == null ? null : v,
    };
}

class Airline {
    Airline({
        this.id,
        this.name,
        this.country,
        this.logo,
        this.slogan,
        this.headQuaters,
        this.website,
        this.established,
    });

    final int? id;
    final Name ?name;
    final Country? country;
    final String? logo;
    final Slogan ?slogan;
    final String? headQuaters;
    final Website? website;
    final String? established;

    factory Airline.fromRawJson(String str) => Airline.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        country: json["country"] == null ? null : countryValues.map[json["country"]],
        logo: json["logo"] == null ? null : json["logo"],
        slogan: json["slogan"] == null ? null : sloganValues.map[json["slogan"]],
        headQuaters: json["head_quaters"] == null ? null : json["head_quaters"],
        website: json["website"] == null ? null : websiteValues.map[json["website"]],
        established: json["established"] == null ? null : json["established"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "country": country == null ? null : countryValues.reverse[country],
        "logo": logo == null ? null : logo,
        "slogan": slogan == null ? null : sloganValues.reverse[slogan],
        "head_quaters": headQuaters == null ? null : headQuaters,
        "website": website == null ? null : websiteValues.reverse[website],
        "established": established == null ? null : established,
    };
}

enum Country { TAIWAN, HONG_KONG, DUBAI }

final countryValues = EnumValues({
    "Dubai": Country.DUBAI,
    "Hong Kong": Country.HONG_KONG,
    "Taiwan": Country.TAIWAN
});

enum Name { EVA_AIR, CATHAY_PACIFIC, EMIRATES }

final nameValues = EnumValues({
    "Cathay Pacific": Name.CATHAY_PACIFIC,
    "Emirates": Name.EMIRATES,
    "Eva Air": Name.EVA_AIR
});

enum Slogan { SHARING_THE_WORLD_FLYING_TOGETHER, MOVE_BEYOND, FROM_DUBAI_TO_DESTINATIONS_AROUND_THE_WORLD }

final sloganValues = EnumValues({
    "From Dubai to destinations around the world.": Slogan.FROM_DUBAI_TO_DESTINATIONS_AROUND_THE_WORLD,
    "Move Beyond": Slogan.MOVE_BEYOND,
    "Sharing the World, Flying Together": Slogan.SHARING_THE_WORLD_FLYING_TOGETHER
});

enum Website { WWW_EVAAIR_COM, WWW_CATHAYPACIFIC_COM, WWW_EMIRATES_COM }

final websiteValues = EnumValues({
    "www.cathaypacific.com": Website.WWW_CATHAYPACIFIC_COM,
    "www.emirates.com/": Website.WWW_EMIRATES_COM,
    "www.evaair.com": Website.WWW_EVAAIR_COM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
