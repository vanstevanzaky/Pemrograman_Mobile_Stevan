import 'game_object.dart';

class Cloud extends GameObject {
  Cloud(double x, double y) : super(x, y);

  void drift() {
    print('Cloud is drifting slowly...');
  }

  @override
  void render() {
    print('Rendering Cloud at position ($x, $y)');
  }

  @override
  void update() {
    drift();
  }
}