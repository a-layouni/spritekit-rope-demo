//
//  ALAYOUNIRopeDemoScene.m
//  RopeDemo
//
//  Created by alayouni on 1/18/15.
//  Copyright (c) 2015 com.alayouni. All rights reserved.
//

#import "ALAYOUNIRopeDemoScene.h"
#import "ALAYOUNIRope.h"

@implementation ALAYOUNIRopeDemoScene
{
    __weak SKSpriteNode *_branch;
    
    CGPoint _touchLastPosition;
    
    BOOL _branchIsMoving;
    
    ALAYOUNIRope *_rope;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.2 green:0.5 blue:0.6 alpha:1.0];
        
        [self buildScene];
    }
    return self;
}

-(void) buildScene {
    SKSpriteNode *branch = [SKSpriteNode spriteNodeWithImageNamed:@"Branch"];
    _branch = branch;
    branch.position = CGPointMake(CGRectGetMaxX(self.frame) - branch.size.width / 2,
                                  CGRectGetMidY(self.frame) + 200);
    branch.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(2, 10)];
    branch.physicsBody.dynamic = NO;
    [self addChild:branch];
    _rope = [[ALAYOUNIRope alloc] initWithRingTexture:[SKTexture textureWithImageNamed:@"rope_ring"]];
    
    //configure rope params if needed
    //    _rope.ringCount = ...;//default is 30
    //    _rope.ringScale = ...;//default is 1
    //    _rope.ringsDistance = ...;//default is 0
    //    _rope.jointsFrictionTorque = ...;//default is 0
    //    _rope.ringsZPosition = ...;//default is 1
    //    _rope.ringFriction = ...;//default is 0
    //    _rope.ringRestitution = ...;//default is 0
    //    _rope.ringMass = ...;//ignored unless mass > 0; default -1
    //    _rope.shouldEnableJointsAngleLimits = ...;//default is NO
    //    _rope.jointsLowerAngleLimit = ...;//default is -M_PI/3
    //    _rope.jointsUpperAngleLimit = ...;//default is M_PI/3
    
    _rope.startRingPosition = CGPointMake(branch.position.x - 100, branch.position.y);//default is (0, 0)
    
    [_rope buildRopeWithScene:self];
    
    //attach rope to branch
    SKSpriteNode *startRing = [_rope startRing];
    CGPoint jointAnchor = CGPointMake(startRing.position.x, startRing.position.y + startRing.size.height / 2);
    SKPhysicsJointPin *joint = [SKPhysicsJointPin jointWithBodyA:branch.physicsBody bodyB:startRing.physicsBody anchor:jointAnchor];
    [self.physicsWorld addJoint:joint];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    if(CGRectContainsPoint(_branch.frame, location)) {
        _branchIsMoving = YES;
        _touchLastPosition = location;
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _branchIsMoving = NO;
    
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(_branchIsMoving) {
        UITouch *touch = [touches anyObject];
        CGPoint location = [touch locationInNode:self],
        branchCurrentPosition = _branch.position;
        CGFloat dx = location.x - _touchLastPosition.x,
        dy = location.y - _touchLastPosition.y;
        _branch.position = CGPointMake(branchCurrentPosition.x + dx, branchCurrentPosition.y + dy);
        _touchLastPosition = location;
    }
}

-(void)didSimulatePhysics
{
    //workaround for elastic effect
    [_rope adjustRingPositions];
}


@end
