class BaseStatsDTO {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDeffence;
  final int speed;

  BaseStatsDTO({
    required this.attack,
    required this.defense,
    required this.hp,
    required this.specialAttack,
    required this.specialDeffence,
    required this.speed,
  });

  factory BaseStatsDTO.fromJson(List jsonList) {
    final List<Map<String, dynamic>> _mapList =
        jsonList.map((e) => e as Map<String, dynamic>).toList();

    late int _hp;
    late int _attack;
    late int _defense;
    late int _specialAttack;
    late int _specialDeffence;
    late int _speed;

    for (Map<String, dynamic> attr in _mapList) {
      switch (attr['stat']['name']) {
        case "hp":
          _hp = attr['base_stat'];
          break;
        case "attack":
          _attack = attr['base_stat'];
          break;
        case "defense":
          _defense = attr['base_stat'];
          break;
        case "special-attack":
          _specialAttack = attr['base_stat'];
          break;
        case "special-defense":
          _specialDeffence = attr['base_stat'];
          break;
        case "speed":
          _speed = attr['base_stat'];
          break;
      }
    }

    return BaseStatsDTO(
      attack: _attack,
      defense: _defense,
      hp: _hp,
      specialAttack: _specialAttack,
      specialDeffence: _specialDeffence,
      speed: _speed,
    );
  }
}
