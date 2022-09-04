class PedoMeterData {
  final int steps;
  final int floorUp;
  final int floowDown;

  PedoMeterData(this.steps, this.floorUp, this.floowDown);

  static PedoMeterData parse(Map<Object?, Object?> source) {
    int steps = (source["steps"] ?? 0) as int;
    int floorUp = (source["floor_up"] ?? 0) as int;
    int floowDown = (source["floor_down"] ?? 0) as int;
    return PedoMeterData(steps, floorUp, floowDown);
  }
}
