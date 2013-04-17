//
//  kekkaScene.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TopScene.h"

@interface kekkaScene : CCLayer
{
    //NSInteger score_theboss;
    //NSInteger score_director;
    //NSInteger score_thepresident;
    TopScene *topScene;
    NSUserDefaults *ud;
    NSUserDefaults *nowGameScore;
    NSUserDefaults *rankingUserDefaults1;
    NSUserDefaults *rankingUserDefaults2;
    NSUserDefaults *rankingUserDefaults3;
    NSUserDefaults *rankingUserDefaults4;
    NSUserDefaults *rankingUserDefaults5;
    NSInteger total;
    NSInteger rankingUserDefaultsScore1;
    NSInteger rankingUserDefaultsScore2;
    NSInteger rankingUserDefaultsScore3;
    NSInteger rankingUserDefaultsScore4;
    NSInteger rankingUserDefaultsScore5;
    NSString *scoreString1;
    NSString *scoreString2;
    NSString *scoreString3;
    NSString *scoreString4;
    NSString *scoreString5;
    CCLabelTTF *scoreLabel1;
    CCLabelTTF *scoreLabel2;
    CCLabelTTF *scoreLabel3;
    CCLabelTTF *scoreLabel4;
    CCLabelTTF *scoreLabel5;
}

@end
