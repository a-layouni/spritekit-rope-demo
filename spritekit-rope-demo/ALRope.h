//
//  ALAYOUNIRope.h
//  RopeDemo
//
//  Created by alayouni on 1/18/15.
//  Copyright (c) 2015 com.alayouni. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface ALRope : NSObject

@property(nonatomic, readonly) NSArray *ropeRings;

@property(nonatomic) int ringCount;

@property(nonatomic) CGFloat ringScale;

@property(nonatomic) CGFloat ringsDistance;

@property(nonatomic) CGFloat jointsFrictionTorque;

@property(nonatomic) CGFloat ringsZPosition;

@property(nonatomic) CGPoint startRingPosition;

@property(nonatomic) CGFloat ringFriction;

@property(nonatomic) CGFloat ringRestitution;

@property(nonatomic) CGFloat ringMass;


@property(nonatomic) BOOL shouldEnableJointsAngleLimits;

@property(nonatomic) CGFloat jointsLowerAngleLimit;

@property(nonatomic) CGFloat jointsUpperAngleLimit;



-(instancetype)initWithRingTexture:(SKTexture *)ringTexture;


-(void)buildRopeWithScene:(SKScene *)scene;

-(void)adjustRingPositions;

-(SKSpriteNode *)startRing;

-(SKSpriteNode *)lastRing;

@end
