class Api {
  static const url = "www.freetogame.com";
  static const all = "/api/games";
  static const one = "/api/game";
  static platform(String platform) => "$all?platform=$platform";
  static category(String category) => "$all?category=$category";
}