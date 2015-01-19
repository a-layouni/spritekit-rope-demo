//
//  ALAYOUNIViewController.m
//  RopeDemo
//
//  Created by alayouni on 1/18/15.
//  Copyright (c) 2015 com.alayouni. All rights reserved.
//

#import "ALViewController.h"
#import "ALRopeDemoScene.h"

@interface ALViewController ()

@end

@implementation ALViewController
{
    ALRopeDemoScene *_scene;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    //    skView.showsFields = YES;
    //    skView.showsPhysics = YES;
    
    // Create and configure the scene.
    _scene = [ALRopeDemoScene sceneWithSize:skView.bounds.size];
    _scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:_scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
