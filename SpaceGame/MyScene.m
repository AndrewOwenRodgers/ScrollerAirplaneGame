//
//  MyScene.m
//  SpaceGame
//
//  Created by Andrew Rodgers on 2/18/14.
//  Copyright (c) 2014 Andrew Rodgers. All rights reserved.
//

#import "MyScene.h"
static const uint32_t shipCategory =  0x1 << 0;
static const uint32_t obstacleCategory =  0x1 << 1;

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size])
	{
        self.backgroundColor = [SKColor blueColor];
        self.physicsWorld.gravity = CGVectorMake(0,0);
        self.physicsWorld.contactDelegate = self;
		[self initializeShipAndActions];
    }
    return self;
}

-(void)initializeShipAndActions
{
    self.ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    [self.ship setScale:0.15];
    self.ship.zRotation = - M_PI / 2;
	
    //Adding SpriteKit physicsBody for collision detection
    self.ship.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.ship.size];
    self.ship.physicsBody.categoryBitMask = shipCategory;
    self.ship.physicsBody.dynamic = YES;
    self.ship.physicsBody.contactTestBitMask = obstacleCategory;
    self.ship.physicsBody.collisionBitMask = 0;
    self.ship.name = @"ship";
    self.ship.position = CGPointMake(60,160);
	
    self.moveUp = [SKAction moveByX:0 y:30 duration:.2];
    self.moveDown = [SKAction moveByX:0 y:-30 duration:.2];
	
	self.background1 = [SKSpriteNode spriteNodeWithImageNamed:@"background1"];
	self.background1.anchorPoint = CGPointZero;
	self.background1.position = CGPointMake(0, 0);
	[self addChild:self.background1];
	
	self.background2 = [SKSpriteNode spriteNodeWithImageNamed:@"background1"];
	self.background2.anchorPoint = CGPointZero;
	self.background2.position = CGPointMake(self.background1.size.width-1, 0);
	[self addChild:self.background2];
	[self addChild:self.ship];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInNode:self.scene];
    if(touchLocation.y > self.ship.position.y)
	{
        if (self.ship.position.y < 280)
		{
            [self.ship runAction:self.moveUp];
        }
    }
	else
	{
        if (self.ship.position.y > 40)
		{
            [self.ship runAction:self.moveDown];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime
{
    self.background1.position = CGPointMake(self.background1.position.x-4, self.background1.position.y);
    self.background2.position = CGPointMake(self.background2.position.x-4, self.background2.position.y);
	
    if (self.background1.position.x < -self.background1.size.width)
	{
        self.background1.position = CGPointMake(self.background2.position.x + self.background2.size.width, self.background1.position.y);
    }
	
    if (self.background2.position.x < -self.background2.size.width)
	{
        self.background2.position = CGPointMake(self.background1.position.x + self.background1.size.width, self.background2.position.y);
    }
}

@end
