// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  int id;
  String note;
  String P;
  String N;
  String k;
  String humidity;
  String temperature;
  String ph;
  String rainfall;
  String created;

  Note({
    required this.id,
    required this.note,
    required this.P,
    required this.N,
    required this.k,
    required this.humidity,
    required this.temperature,
    required this.ph,
    required this.rainfall,
    required this.created, // Added the created field to the constructor
  });

  
  Note copyWith({
    int? id,
    String? note,
    String? P,
    String? N,
    String? k,
    String? humidity,
    String? temperature,
    String? ph,
    String? rainfall,
    String? created, // Added the created field to the copyWith method
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      P: P ?? this.P,
      N: N ?? this.N,
      k: k ?? this.k,
      humidity: humidity ?? this.humidity,
      temperature: temperature ?? this.temperature,
      ph: ph ?? this.ph,
      rainfall: rainfall ?? this.rainfall,
      created: created ?? this.created, // Updated the created field
    );
  }

  String get formattedDateTime {
    // Parse the original created string to DateTime
    DateTime dateTime = DateTime.parse(created);

    // Format the date and time string
    String formattedDate =
        'Date: ${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    String formattedTime =
        'Time: ${dateTime.hour.toString().padLeft(2, '0')}.${dateTime.minute.toString().padLeft(2, '0')}';

    // Combine date and time strings
    return '$formattedTime     $formattedDate';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'note': note,
      'P': P,
      'N': N,
      'k': k,
      'humidity': humidity,
      'temperature': temperature,
      'ph': ph,
      'rainfall': rainfall,
      'created': created, // Added the created field to the toMap method
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      note: map['note'] as String,
      P: map['P'] as String,
      N: map['N'] as String,
      k: map['k'] as String,
      humidity: map['humidity'] as String,
      temperature: map['temperature'] as String,
      ph: map['ph'] as String,
      rainfall: map['rainfall'] as String,
      created: map['created'] as String, // Added the created field to the fromMap method
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, note: $note, P: $P, N: $N, k: $k, humidity: $humidity, temperature: $temperature, ph: $ph, rainfall: $rainfall, created: $created)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.note == note &&
        other.P == P &&
        other.N == N &&
        other.k == k &&
        other.humidity == humidity &&
        other.temperature == temperature &&
        other.ph == ph &&
        other.rainfall == rainfall &&
        other.created == created; // Added the created field to the operator==
  }

  @override
  int get hashCode {
    return id.hashCode ^
        note.hashCode ^
        P.hashCode ^
        N.hashCode ^
        k.hashCode ^
        humidity.hashCode ^
        temperature.hashCode ^
        ph.hashCode ^
        rainfall.hashCode ^
        created.hashCode; // Added the created field to the hashCode
  }
}
