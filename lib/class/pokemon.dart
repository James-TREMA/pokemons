class Pokemon {
  final int id;
  final String name;
  final String nameEn;
  final String nameJp;
  final String imageUrl;
  final String? shinyImageUrl;
  final String? gmaxImageUrl;
  final String category;
  final int? generation;
  final List<PokemonType> types;
  final List<Talent> talents;
  final Stats stats;
  final List<Resistance> resistances;
  final Evolution? evolution;
  final String height;
  final String weight;
  final List<String> eggGroups;
  final Gender gender;
  final int catchRate;
  final int level100;
  final dynamic formes;

  Pokemon({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.nameJp,
    required this.imageUrl,
    this.shinyImageUrl,
    this.gmaxImageUrl,
    required this.category,
    this.generation,
    required this.types,
    required this.talents,
    required this.stats,
    required this.resistances,
    this.evolution,
    required this.height,
    required this.weight,
    required this.eggGroups,
    required this.gender,
    required this.catchRate,
    required this.level100,
    this.formes,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['pokedex_id'],
      name: json['name']['fr'],
      nameEn: json['name']['en'],
      nameJp: json['name']['jp'],
      imageUrl: json['sprites']['regular'] ?? '',
      shinyImageUrl: json['sprites']['shiny'],
      gmaxImageUrl: json['sprites']['gmax'],
      category: json['category'],
      generation: json['generation'],
      types: (json['types'] as List<dynamic>)
          .map((type) => PokemonType.fromJson(type))
          .toList(),
      talents: (json['talents'] as List<dynamic>)
          .map((talent) => Talent.fromJson(talent))
          .toList(),
      stats: Stats.fromJson(json['stats']),
      resistances: (json['resistances'] as List<dynamic>)
          .map((resistance) => Resistance.fromJson(resistance))
          .toList(),
      evolution: json['evolution'] != null
          ? Evolution.fromJson(json['evolution'])
          : null,
      height: json['height'],
      weight: json['weight'],
      eggGroups: (json['egg_groups'] as List<dynamic>).cast<String>(),
      gender: Gender.fromJson(json['sexe']),
      catchRate: json['catch_rate'],
      level100: json['level_100'],
      formes: json['formes'],
    );
  }
}

class PokemonType {
  final String name;
  final String image;

  PokemonType({required this.name, required this.image});

  factory PokemonType.fromJson(Map<String, dynamic> json) {
    return PokemonType(
      name: json['name'],
      image: json['image'],
    );
  }
}

class Talent {
  final String name;
  final bool isHidden;

  Talent({required this.name, required this.isHidden});

  factory Talent.fromJson(Map<String, dynamic> json) {
    return Talent(
      name: json['name'],
      isHidden: json['tc'],
    );
  }
}

class Stats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  Stats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      hp: json['hp'],
      attack: json['atk'],
      defense: json['def'],
      specialAttack: json['spe_atk'],
      specialDefense: json['spe_def'],
      speed: json['vit'],
    );
  }

  int get total => hp + attack + defense + specialAttack + specialDefense + speed;
}

class Resistance {
  final String name;
  final double multiplier;

  Resistance({required this.name, required this.multiplier});

  factory Resistance.fromJson(Map<String, dynamic> json) {
    return Resistance(
      name: json['name'],
      multiplier: json['multiplier'].toDouble(),
    );
  }
}

class Evolution {
  final dynamic pre;
  final List<EvolutionStage>? next;
  final dynamic mega;

  Evolution({this.pre, this.next, this.mega});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(
      pre: json['pre'],
      next: json['next'] != null
          ? (json['next'] as List<dynamic>)
              .map((e) => EvolutionStage.fromJson(e))
              .toList()
          : null,
      mega: json['mega'],
    );
  }
}

class EvolutionStage {
  final int pokedexId;
  final String name;
  final String condition;

  EvolutionStage({
    required this.pokedexId,
    required this.name,
    required this.condition,
  });

  factory EvolutionStage.fromJson(Map<String, dynamic> json) {
    return EvolutionStage(
      pokedexId: json['pokedex_id'],
      name: json['name'],
      condition: json['condition'],
    );
  }
}

class Gender {
  final int male;
  final int female;

  Gender({required this.male, required this.female});

  factory Gender.fromJson(Map<String, dynamic> json) {
    return Gender(
      male: json['male'],
      female: json['female'],
    );
  }
}