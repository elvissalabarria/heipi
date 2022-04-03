class Users {
  String name;
  int countPlant;

  Users(this.name, this.countPlant);
}

List<Users> topUserList = [
  Users("Mejores de Bogotá", 18),
  Users("Salvando el planeta", 16),
  Users("Super Heros", 12),
];

class CounterPlant {
  int step;
  int bicy;
  CounterPlant(this.step, this.bicy);
}
