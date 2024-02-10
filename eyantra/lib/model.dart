// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  int id;
  String note;
  String P;
  String N;
  String k;
  String moisture;
  String temperature;
  String ph;
  String ec;
  String created;

  Note({
    required this.id,
    required this.note,
    required this.P,
    required this.N,
    required this.k,
    required this.moisture,
    required this.temperature,
    required this.ph,
    required this.ec,
    required this.created, // Added the created field to the constructor
  });

  
  Note copyWith({
    int? id,
    String? note,
    String? P,
    String? N,
    String? k,
    String? moisture,
    String? temperature,
    String? ph,
    String? ec,
    String? created, 
  }) {
    return Note(
      id: id ?? this.id,
      note: note ?? this.note,
      P: P ?? this.P,
      N: N ?? this.N,
      k: k ?? this.k,
      moisture: moisture ?? this.moisture,
      temperature: temperature ?? this.temperature,
      ph: ph ?? this.ph,
      ec: ec ?? this.ec,
      created: created ?? this.created, 
    );
  }

  String get formattedDateTime {
    DateTime dateTime = DateTime.parse(created);

    String formattedDate =
        'Date: ${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
    String formattedTime =
        'Time: ${dateTime.hour.toString().padLeft(2, '0')}.${dateTime.minute.toString().padLeft(2, '0')}';

    return '$formattedTime     $formattedDate';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'note': note,
      'P': P,
      'N': N,
      'k': k,
      'moisture': moisture,
      'temperature': temperature,
      'ph': ph,
      'ec': ec,
      'created': created,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] as int,
      note: map['note'] as String,
      P: map['P'] as String,
      N: map['N'] as String,
      k: map['k'] as String,
      moisture: map['moisture'] as String,
      temperature: map['temperature'] as String,
      ph: map['ph'] as String,
      ec: map['ec'] as String,
      created: map['created'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, note: $note, P: $P, N: $N, k: $k, moisture: $moisture, temperature: $temperature, ph: $ph, ec: $ec, created: $created)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.note == note &&
        other.P == P &&
        other.N == N &&
        other.k == k &&
        other.moisture == moisture &&
        other.temperature == temperature &&
        other.ph == ph &&
        other.ec == ec &&
        other.created == created;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        note.hashCode ^
        P.hashCode ^
        N.hashCode ^
        k.hashCode ^
        moisture.hashCode ^
        temperature.hashCode ^
        ph.hashCode ^
        ec.hashCode ^
        created.hashCode; // Added the created field to the hashCode
  }
}
