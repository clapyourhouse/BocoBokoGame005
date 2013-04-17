//
//  GameScene.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EventLayer.h"
#import "GameSceneSecond.h"
#import "TopScene.h"


@interface GameScene : CCLayer
{
    CCSprite *theboss;
    CCTexture2D *texture;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *timerLabel;
    NSInteger timerCount;
    NSInteger score_theboss;
    int count;
    TopScene *topScene;
    
}

@property(nonatomic, retain) CCLabelTTF *scoreLabel;
@property NSInteger score_theboss;

- (void)addScore:(NSInteger)reward;
- (void)nextScene;

@end
