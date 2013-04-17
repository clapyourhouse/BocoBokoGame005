//
//  nowResult.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCScene.h"

#import "CCScene.h"
#import "cocos2d.h"
#import "TopScene.h"


@interface nowResult : CCScene{
    
    CCLabelTTF *timerLabel;
    NSInteger timerCount;
    
    NSInteger score_theboss;
    NSInteger score_director;
    NSInteger score_thepresident;
    NSInteger total;
    NSUserDefaults *ud;
    NSUserDefaults *nowGameScore;
    NSString *scoreString;
    CCLabelTTF *nowScoreLabel;
    TopScene *topScene;
    
    NSString *cotoba;
    
    
    
}

@property (nonatomic,retain)    NSUserDefaults *nowGameScore;
@property (nonatomic,readwrite) NSInteger total;


@end
