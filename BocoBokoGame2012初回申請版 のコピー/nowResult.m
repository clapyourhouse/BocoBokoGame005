//
//  nowResult.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "nowResult.h"
#import "GameScene.h"
#import "GameSceneSecond.h"
#import "GameSceneLast.h"
#import "kekkaScene.h"
#import "EventLayer.h"
@implementation nowResult
@synthesize nowGameScore;
@synthesize total;

+ (id)scene
{
    CCScene *scene = [CCScene node];
    CCLayer *result = [nowResult node];
    [scene addChild:result];
    
    return scene;
}

- (id)init
{
    if ( self = [super init] ) {
        
        // BGM再生
        // [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgm3_GameScene.mp3"];
        
        // iPhoneの画面サイズを取得する
        CGSize dispSize = [[CCDirector sharedDirector] winSize];
        
        // CCSpriteを使って背景画像を作成し、位置・サイズを調整して貼り付け
        CCSprite *back = [CCSprite spriteWithFile:@"result_now.png"];
        back.scaleX = (dispSize.width / back.boundingBox.size.width);
        back.scaleY = (dispSize.height / back.boundingBox.size.height);
        back.position = CGPointMake(dispSize.width / 2, dispSize.height / 2.0);//ここを2.0から2.5にした。
        [self addChild:back z:0];
        
        
        // timerを表示するラベルを作成
        timerCount = 5;
        NSString *timerString = [NSString stringWithFormat:@"%02d", timerCount];
        timerLabel = [CCLabelTTF labelWithString:timerString
                                        fontName:@"Helvetica"
                                        fontSize:22];
        
        // timerLabelの色を変更
        timerLabel.color = ccc3(0, 0, 0);
        
        // timerラベルの位置を決めて貼付ける
        timerLabel.position = ccp(15, 470);
        [self addChild:timerLabel z:50];
        
        
        // timerをスケジューリング
        [self schedule:@selector(timer:) interval:1];
        
        
        
        // NSUserDefaultsを使う為の宣言をまとめて書いておく
        ud = [NSUserDefaults standardUserDefaults];
        nowGameScore = [NSUserDefaults standardUserDefaults];
        
        // 今回のゲームのスコアの値を取り出す
        score_theboss = [ud integerForKey:@"score_theboss"];
        score_director = [ud integerForKey:@"score_director"];
        score_thepresident = [ud integerForKey:@"score_thepresident"];
        [ud synchronize];
        
        // 今回のゲームのスコアをnowGameScoreのNSUserDefaultsに保存しておく
        [nowGameScore setInteger: score_theboss + score_director + score_thepresident forKey:@"nowGameScore"];
        
        // 今回のゲームスコアの値取り出し
        total = [nowGameScore integerForKey:@"nowGameScore"];
        [nowGameScore synchronize];
        
        scoreString = [NSString stringWithFormat:@"%d",total];
        nowScoreLabel = [CCLabelTTF labelWithString:scoreString fontName:@"Verdana" fontSize:30];
        nowScoreLabel.position = ccp(170, 260);
        nowScoreLabel.color = ccBLACK;
        
        [self addChild:nowScoreLabel];
        
        
        EventLayer *eventLayer = [EventLayer sharedInstance];
        int commentNumber = eventLayer.randomComment;
        
        if (commentNumber == 1) {
            cotoba = [NSString stringWithFormat:@"社長をくりっくし続けると.."];
        }else if (commentNumber == 2) {
            cotoba = [NSString stringWithFormat:@"上司をクリックし続けるとムフフ♡"];
            //
        }else if (commentNumber == 3) {
            cotoba = [NSString stringWithFormat:@"課長は離婚裁判中..."];
            //
        }else if (commentNumber == 4) {
            cotoba = [NSString stringWithFormat:@"6000点を出すと..."];
            //
        }else if (commentNumber == 5) {
            cotoba = [NSString stringWithFormat:@"明日は本物の上司だ♡"];
            //
        }
        
        NSString *hahahaComment = [NSString stringWithFormat:@"%@",cotoba];
        CCLabelTTF *ponComment = [CCLabelTTF labelWithString:hahahaComment fontName:@"Verdana" fontSize:20];
        ponComment.position = ccp(160, 170);
        ponComment.color = ccBLACK;
        
        [self addChild:ponComment];
        
        
        
        
    }
    return self;
    
}

- (void)timer:(ccTime)dt
{
    timerCount -= 1;
    
    NSString *timerString = [NSString stringWithFormat:@"%02d", timerCount];
    [timerLabel setString:timerString];
    
    if ( timerCount <= 0 ) {
        timerCount = 0;
        [self unschedule:@selector(timer:)];
        [self nextScene];
    }
}


// 次のステージへ画面遷移
- (void)nextScene
{
    
    //  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    //  [ud setInteger:score_theboss forKey:@"score_theboss"];
    
    CCScene *newScene = [kekkaScene node];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:2 scene:newScene]];
    
}



@end
