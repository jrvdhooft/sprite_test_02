import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'main.dart';

import 'package:flame/game.dart';

class PlayBoard {
  List<playField> playFields = [];
  final double triangleFactor = 0.866; // 0.866

  PlayBoard() {
    //---------------------------------------1e regel (5 stuks)
    playFields.add(playField() // 0
      ..x = -1.0
      ..y = (-triangleFactor - triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [1, 6]);
    playFields.add(playField() // 1
      ..x = -0.5
      ..y = (-triangleFactor - triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [0, 2]);
    playFields.add(playField() // 2
      ..x = -0.0
      ..y = (-triangleFactor - triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [1, 3, 8]);
    playFields.add(playField() // 3
      ..x = .5
      ..y = (-triangleFactor - triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [2, 4]);
    playFields.add(playField() // 4
      ..x = 1
      ..y = (-triangleFactor - triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [3, 10]);
    //---------------------------------------2e regel (7 stuks)
    playFields.add(playField() // 5
      ..x = -1.5
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [6, 12]);
    playFields.add(playField() // 6
      ..x = -1.0
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [0, 5, 7]);
    playFields.add(playField() // 7
      ..x = -0.5
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [6, 8, 14]);
    playFields.add(playField() // 8
      ..x = 0.0
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [2, 7, 9]);
    playFields.add(playField() // 9
      ..x = 0.5
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [8, 10, 16]);
    playFields.add(playField() // 10
      ..x = 1.0
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [4, 9, 11]);
    playFields.add(playField() // 11
      ..x = 1.5
      ..y = (-triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [10, 18]);
    //---------------------------------------3e regel (7 stuks)
    playFields.add(playField() // 12
      ..x = -1.5
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [5, 13]);
    playFields.add(playField() // 13
      ..x = -1.0
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [12, 14, 19]);
    playFields.add(playField() // 14
      ..x = -0.5
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [7, 13, 15]);
    playFields.add(playField() // 15
      ..x = 0.0
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [14, 16, 21]);
    playFields.add(playField() // 16
      ..x = 0.5
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [9, 15, 17]);
    playFields.add(playField() // 17
      ..x = 1.0
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [16, 18, 23]);
    playFields.add(playField() // 18
      ..x = 1.5
      ..y = (triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [11, 17]);
    //---------------------------------------4e regel (5 stuks)
    playFields.add(playField() // 19
      ..x = -1.0
      ..y = (triangleFactor + triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [13, 20]);
    playFields.add(playField() // 20
      ..x = -0.5
      ..y = (triangleFactor + triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [19, 21]);
    playFields.add(playField() // 21
      ..x = 0.0
      ..y = (triangleFactor + triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [15, 20, 22]);
    playFields.add(playField() // 22
      ..x = 0.5
      ..y = (triangleFactor + triangleFactor / 2) * triangleFactor
      ..orientation = true
      ..canGoToPlayFields = [21, 23]);
    playFields.add(playField() // 23
      ..x = 1.0
      ..y = (triangleFactor + triangleFactor / 2) * triangleFactor
      ..orientation = false
      ..canGoToPlayFields = [17, 22]);

  }

  void recalcSize(List<TriangleSprite> triangleList, List<SquareSprite> squareList, List<NumberSprite> numberList,
      double screenWidth, double screenHeight) {
    double factor = math.min(screenWidth / 4, screenHeight / 4);
    double triangleSize = factor;
    for (int i = 0; i < 23; i++) {
      triangleList[i].size = Vector2(triangleSize, triangleSize * triangleFactor);
      squareList[i].size = Vector2(triangleSize * 0.5, triangleSize * triangleFactor);
      numberList[i].size = triangleList[i].size;
    }
  }

  void recalcPosition(List<TriangleSprite> triangleList, List<SquareSprite> squareList, List<NumberSprite> numberList,
      double screenWidth, double screenHeight) {
    double x_factor = math.min(screenWidth / 4, screenHeight / 4);
    double y_factor = x_factor;
    double x_offset = screenWidth / 2;
    double y_offset = screenHeight / 2;
    // double triangleSize = x_factor;
    // double jx, jy;
    for (int i = 0; i < 23; i++) {
      triangleList[i].x_new = x_offset + this.playFields[triangleList[i].boardPosition].x * x_factor;
      triangleList[i].y_new = y_offset + this.playFields[triangleList[i].boardPosition].y * (y_factor*1.01) * (1 / triangleFactor);

      if (this.playFields[triangleList[i].boardPosition].orientation)
        triangleList[i].angle_new = 0.0;
      else
        triangleList[i].angle_new = math.pi;
      //
      squareList[i].position.x = triangleList[i].x_new;
      squareList[i].position.y = triangleList[i].y_new;

      numberList[i].x_new = triangleList[i].x_new;
      numberList[i].y_new = triangleList[i].y_new;
    }
  }

  int canGoToPlayfieldNumber(SquareSprite squareSprite) {
    int fieldnr;
    int v = this.playFields[squareSprite.boardPosition].canGoToPlayFields.length;
    // print('cnt fields. $v');
    for (int i = 0; i < v; i++) {
      fieldnr = this.playFields[squareSprite.boardPosition].canGoToPlayFields[i];
      bool bb = this.playFields[fieldnr].free;
      // print('ee $fieldnr $bb');
      if (this.playFields[fieldnr].free == true) return fieldnr;
    }
    return -1;
  }

  void moveTriangleAndSquareSprite(TriangleSprite triangleSprite, SquareSprite squareSprite, to) {
    int from = triangleSprite.boardPosition;
    this.playFields[from].free = true;
    this.playFields[to].free = false;
    triangleSprite.boardPosition = to;
    squareSprite.boardPosition = to;
  }

  void shuffle(int numberOfIterations) {
    var rng = math.Random();
    for (int i = 0; i < 23; i++) {
      triangleList[i].triangle_number = i;
      triangleList[i].boardPosition = i;
      numberList[i].triangle_number = i;
      numberList[i].boardPosition = i;
      squareList[i].triangle_number = i;
      squareList[i].boardPosition = i;
      playBoard.playFields[i].free = false;
    }
    playBoard.playFields[23].free = true;
    playBoard.recalcPosition(triangleList, squareList, numberList, screenWidth, screenHeight);

    // Ga nu random zetten doen
    int emptyFieldIs = 23;
    for (int i = 0; i < numberOfIterations; i++) {
      int randomNextEmptyFieldIndex = rng.nextInt(this.playFields[emptyFieldIs].canGoToPlayFields.length);
      int boardNumberIsFrom =  this.playFields[emptyFieldIs].canGoToPlayFields[randomNextEmptyFieldIndex];
      //find out witch square is on that field
      for(int j = 0 ; j<23;j++) {
        if (squareList[j].boardPosition == boardNumberIsFrom){
          squareList[j].Do1Move();
          break;
        }
      }
      emptyFieldIs = boardNumberIsFrom;
    }
    playBoard.recalcPosition(triangleList, squareList, numberList, screenWidth, screenHeight);

  }
}
/*
 var rng = Random();
  for (var i = 0; i < 10; i++) {
    print(rng.nextInt(100));
static var mypoints = [
  Vector2(0,0),
  Vector2(1,0),
  Vector2(0.5, triangleFactor)
];
*/

class playField {
  late double x;
  late double y;
  late bool orientation; // true=ArrowUp; false=ArrowDown
  bool free = true;
  late List<int> canGoToPlayFields;
}
