//
//  MyScene.h
//  SpaceGame
//

//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MyScene : SKScene
<SKPhysicsContactDelegate>

@property (strong, nonatomic) SKSpriteNode *ship;
@property (strong, nonatomic) SKAction *moveUp;
@property (strong, nonatomic) SKAction *moveDown;
@property (strong, nonatomic) SKSpriteNode *background1;
@property (strong, nonatomic) SKSpriteNode *background2;

@end
