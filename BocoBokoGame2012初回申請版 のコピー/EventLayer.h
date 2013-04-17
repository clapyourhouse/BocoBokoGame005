//
//  EventLayer.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface EventLayer : CCScene
{
    NSInteger score;
}

@property NSInteger score;

+ (EventLayer *)sharedInstance;
//- (int)randomCoin;
- (int)randomMove;
- (int)randomBossChange;
- (int)randomComment;
- (void)coinAction:(CCSprite *)sprite;
- (void)oyajiAction:(CCSprite *)sprite;
@end
