import 'obstacle.dart';

class Bird extends Obstacle {
  Bird(double x, double y) : super(x, y);

  @override
  void move() {
    print('Bird is flying to the left...');
  }

  @override
  void render() {
    print('Rendering Bird at position ($x, $y)');
  }

  @override
  void update() {
    move();
  }
}