//
//  GameSceneSecond.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "EventLayer.h"
#import "TopScene.h"

@interface GameSceneSecond : CCLayer
{
    CCSprite *director;
    CCTexture2D *texture;
    CCLabelTTF *scoreLabel;
    CCLabelTTF *timerLabel;
    NSInteger timerCount;
    NSInteger score_director;
    int count;
    TopScene *topScene;
}

@property(nonatomic, retain) CCLabelTTF *scoreLabel;
@property NSInteger score_director;

- (void)addScore:(NSInteger)reward;
- (void)nextScene;

@end
