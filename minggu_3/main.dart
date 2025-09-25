import 'dino.dart';
import 'cactus.dart';
import 'bird.dart';
import 'cloud.dart';
import 'game_object.dart';

// Main function to simulate game
void main() {
  print('=== DINO JUMP GAME SIMULATION ===\n');

  // Create game objects
  var dino = Dino(0, 0);
  var cactus = Cactus(10, 0);
  var bird = Bird(15, 5);
  var cloud = Cloud(20, 10);

  // Simulate game loop
  List<GameObject> gameObjects = [dino, cactus, bird, cloud];

  print('Game Loop Simulation:');
  print('---------------------');
  for (var obj in gameObjects) {
    obj.update();
    obj.render();
    print(''); // Empty line for readability
  }

  // Trigger specific behaviors
  print('Specific Actions:');
  print('-----------------');
  dino.jump();

  // Demonstrate polymorphism
  print('\nPolymorphism Demo:');
  print('------------------');
  for (var obj in gameObjects) {
    if (obj is Dino) {
      obj.jump();
    } else if (obj is Cloud) {
      obj.drift();
    }
  }
}