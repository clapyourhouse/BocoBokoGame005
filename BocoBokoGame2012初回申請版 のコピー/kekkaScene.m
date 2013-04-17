//
//  kekkaScene.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "kekkaScene.h"
#import "GameScene.h"
#import "GameSceneSecond.h"
#import "GameSceneLast.h"
#import "TopScene.h"
#import "nowResult.h"
@implementation kekkaScene

+ (id)scene
{
    CCScene *scene = [CCScene node];
    CCLayer *layer = [kekkaScene node];
    [scene addChild:layer];
    
    return scene;
}

- (id)init
{
    if ( self = [super init] ) {
        
        // NSUserDefaultsを使う為の宣言をまとめて書いておく
        ud = [NSUserDefaults standardUserDefaults];
        nowGameScore = [NSUserDefaults standardUserDefaults];
        rankingUserDefaults1 = [NSUserDefaults standardUserDefaults];
        rankingUserDefaults2 = [NSUserDefaults standardUserDefaults];
        rankingUserDefaults3 = [NSUserDefaults standardUserDefaults];
        rankingUserDefaults4 = [NSUserDefaults standardUserDefaults];
        rankingUserDefaults5 = [NSUserDefaults standardUserDefaults];
        
        /*
         // 今回のゲームのスコアの値を取り出す
         score_theboss = [ud integerForKey:@"score_theboss"];
         score_director = [ud integerForKey:@"score_director"];
         score_thepresident = [ud integerForKey:@"score_thepresident"];
         
         // 今回のゲームのスコアをnowGameScoreのNSUserDefaultsに保存しておく
         [nowGameScore setInteger: score_theboss + score_director + score_thepresident forKey:@"nowGameScore"];
         */
        // 今回のゲームスコアの値取り出し
        //トータルのスコアはどこに入ってる？
        total = [nowGameScore integerForKey:@"nowGameScore"];
        
        
        // 値の取り出し
        rankingUserDefaultsScore1 = [rankingUserDefaults1 integerForKey:@"rankingDefault1"];
        rankingUserDefaultsScore2 = [rankingUserDefaults2 integerForKey:@"rankingDefault2"];
        rankingUserDefaultsScore3 = [rankingUserDefaults3 integerForKey:@"rankingDefault3"];
        rankingUserDefaultsScore4 = [rankingUserDefaults4 integerForKey:@"rankingDefault4"];
        rankingUserDefaultsScore5 = [rankingUserDefaults5 integerForKey:@"rankingDefault5"];
        NSLog(@"%d", rankingUserDefaultsScore1);
        NSLog(@"%d", rankingUserDefaultsScore2);
        NSLog(@"%d", rankingUserDefaultsScore3);
        NSLog(@"%d", rankingUserDefaultsScore4);
        NSLog(@"%d", rankingUserDefaultsScore5);
        
        /*
         // scoreのデフォルト値を設定
         [rankingUserDefaults1 setInteger:0 forKey:@"rankingDefault1"];
         [rankingUserDefaults2 setInteger:0 forKey:@"rankingDefault2"];
         [rankingUserDefaults3 setInteger:0 forKey:@"rankingDefault3"];
         [rankingUserDefaults4 setInteger:0 forKey:@"rankingDefault4"];
         [rankingUserDefaults5 setInteger:0 forKey:@"rankingDefault5"];
         */
        
        
        if ( total > rankingUserDefaultsScore1 )
        {
            [rankingUserDefaults5 removeObjectForKey:@"rankingDefault5"];
            [rankingUserDefaults5 setInteger:rankingUserDefaultsScore4 forKey:@"rankingDefault5"];
            
            [rankingUserDefaults4 removeObjectForKey:@"rankingDefault4"];
            [rankingUserDefaults4 setInteger:rankingUserDefaultsScore3 forKey:@"rankingDefault4"];
            
            [rankingUserDefaults3 removeObjectForKey:@"rankingDefault3"];
            [rankingUserDefaults3 setInteger:rankingUserDefaultsScore2 forKey:@"rankingDefault3"];
            
            [rankingUserDefaults2 removeObjectForKey:@"rankingDefault2"];
            [rankingUserDefaults2 setInteger:rankingUserDefaultsScore1 forKey:@"rankingDefault2"];
            
            [rankingUserDefaults1 removeObjectForKey:@"rankingDefault1"];
            [rankingUserDefaults1 setInteger:total forKey:@"rankingDefault1"];
        }
        else if ( total > rankingUserDefaultsScore2 )
        {
            [rankingUserDefaults5 removeObjectForKey:@"rankingDefault5"];
            [rankingUserDefaults5 setInteger:rankingUserDefaultsScore4 forKey:@"rankingDefault5"];
            
            [rankingUserDefaults4 removeObjectForKey:@"rankingDefault4"];
            [rankingUserDefaults4 setInteger:rankingUserDefaultsScore3 forKey:@"rankingDefault4"];
            
            [rankingUserDefaults3 removeObjectForKey:@"rankingDefault3"];
            [rankingUserDefaults3 setInteger:rankingUserDefaultsScore2 forKey:@"rankingDefault3"];
            
            [rankingUserDefaults2 removeObjectForKey:@"rankingDefault2"];
            [rankingUserDefaults2 setInteger:total forKey:@"rankingDefault2"];
        }
        else if ( total > rankingUserDefaultsScore3 )
        {
            [rankingUserDefaults5 removeObjectForKey:@"rankingDefault5"];
            [rankingUserDefaults5 setInteger:rankingUserDefaultsScore4 forKey:@"rankingDefault5"];
            
            [rankingUserDefaults4 removeObjectForKey:@"rankingDefault4"];
            [rankingUserDefaults4 setInteger:rankingUserDefaultsScore3 forKey:@"rankingDefault4"];
            
            [rankingUserDefaults3 removeObjectForKey:@"rankingDefault3"];
            [rankingUserDefaults3 setInteger:total forKey:@"rankingDefault3"];
        }
        else if ( total > rankingUserDefaultsScore4 )
        {
            [rankingUserDefaults5 removeObjectForKey:@"rankingDefault5"];
            [rankingUserDefaults5 setInteger:rankingUserDefaultsScore4 forKey:@"rankingDefault5"];
            
            [rankingUserDefaults4 removeObjectForKey:@"rankingDefault4"];
            [rankingUserDefaults4 setInteger:total forKey:@"rankingDefault4"];
        }
        else if ( total > rankingUserDefaultsScore5 )
        {
            [rankingUserDefaults5 removeObjectForKey:@"rankingDefault5"];
            [rankingUserDefaults5 setInteger:total forKey:@"rankingDefault5"];
        }
        
        rankingUserDefaultsScore1 = [rankingUserDefaults1 integerForKey:@"rankingDefault1"];
        rankingUserDefaultsScore2 = [rankingUserDefaults2 integerForKey:@"rankingDefault2"];
        rankingUserDefaultsScore3 = [rankingUserDefaults3 integerForKey:@"rankingDefault3"];
        rankingUserDefaultsScore4 = [rankingUserDefaults4 integerForKey:@"rankingDefault4"];
        rankingUserDefaultsScore5 = [rankingUserDefaults5 integerForKey:@"rankingDefault5"];
        
        
        scoreString1 = [NSString stringWithFormat:@"1位:%d", rankingUserDefaultsScore1];
        scoreString2 = [NSString stringWithFormat:@"2位:%d", rankingUserDefaultsScore2];
        scoreString3 = [NSString stringWithFormat:@"3位:%d", rankingUserDefaultsScore3];
        scoreString4 = [NSString stringWithFormat:@"4位:%d", rankingUserDefaultsScore4];
        scoreString5 = [NSString stringWithFormat:@"5位:%d", rankingUserDefaultsScore5];
        
        scoreLabel1 = [CCLabelTTF labelWithString:scoreString5 fontName:@"Verdana" fontSize:20];
        scoreLabel2 = [CCLabelTTF labelWithString:scoreString4 fontName:@"Verdana" fontSize:20];
        scoreLabel3 = [CCLabelTTF labelWithString:scoreString3 fontName:@"Verdana" fontSize:20];
        scoreLabel4 = [CCLabelTTF labelWithString:scoreString2 fontName:@"Verdana" fontSize:20];
        scoreLabel5 = [CCLabelTTF labelWithString:scoreString1 fontName:@"Verdana" fontSize:20];
        
        scoreLabel1.position = ccp(160, 135);
        scoreLabel2.position = ccp(160, 195);
        scoreLabel3.position = ccp(160, 255);
        scoreLabel4.position = ccp(160, 315);
        scoreLabel5.position = ccp(160, 375);
        
        [self addChild:scoreLabel1];
        [self addChild:scoreLabel2];
        [self addChild:scoreLabel3];
        [self addChild:scoreLabel4];
        [self addChild:scoreLabel5];
        
        
        // ランキングタイトルの作成
        CCLabelTTF *rankingTitle = [CCLabelTTF labelWithString:@"Ranking" fontName:@"Marker Felt" fontSize:50];
        rankingTitle.position = ccp(160, 450);
        [self addChild:rankingTitle];
        
        // もどるボタンの作成
        CCMenuItemFont *startBtn = [CCMenuItemFont itemFromString:@"もどる" target:self selector:@selector(gameStart:)];
        startBtn.anchorPoint = CGPointMake(0.5, 0.5);
        startBtn.position = ccp( 0, -170 );
        CCMenu *menu = [CCMenu menuWithItems:startBtn, nil];
        [self addChild:menu];
        
        
    }
    
    return self;
}

// もどるボタンが押されたら呼ばれるメソッド
- (void)gameStart:(id)sender
{
    // NSUserDefaultsに保存している今回のゲームのスコアを削除する
    [nowGameScore removeObjectForKey:@"nowGameScore"];
    
    // 効果音の再生
    // [[SimpleAudioEngine sharedEngine] playEffect:@"btn_tap.mp3"];
    
    // GameSceneに切り替える
    [[CCDirector sharedDirector] replaceScene:[TopScene node]];
}


@end
