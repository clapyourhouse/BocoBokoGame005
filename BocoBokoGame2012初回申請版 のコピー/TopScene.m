//
//  TopScene.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TopScene.h"
#import "GameScene.h"
#import "SimpleAudioEngine.h"
#import "AppDelegate.h"
#import "explainScene.h"
#import "kekkaScene.h"


@implementation TopScene

+ (id)scene
{    
    CCScene *scene = [CCScene node];
    CCLayer *topScene = [TopScene node];
    [scene addChild:topScene];
    
    return scene;
}

- (id)init
{
    if ( self = [super init] ) {
        
        // BGM再生
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgm1_TopScene.mp3"];
        
        // タイトルラベルの作成
        
        
        CCLabelTTF *titleLabel = [CCLabelTTF labelWithString:@"[ゲームタイトル]" fontName:@"Helvetica" fontSize:30];
        // 画面サイズの取得
        CGSize size = [[CCDirector sharedDirector] winSize];
        // 画面サイズからタイトルラベルの位置を計算
		titleLabel.position = ccp( size.width /2 , size.height/1.2 );
        
        [self addChild:titleLabel];
        
        // iPhoneの画面サイズを取得する
        CGSize dispSize = [[CCDirector sharedDirector] winSize];
        
        // CCSpriteを使って背景画像を作成し、位置・サイズを調整して貼り付け
        CCSprite *back = [CCSprite spriteWithFile:@"topMenu.png"];
        back.scaleX = (dispSize.width / back.boundingBox.size.width);
        back.scaleY = (dispSize.height / back.boundingBox.size.height);
        back.position = CGPointMake(dispSize.width / 2, dispSize.height / 2);
        [self addChild:back z:0];
        
        
        
        
        // スタートボタンの作成
        CCMenuItemFont *startBtn = [CCMenuItemFont itemFromString:@"すたーと" target:self selector:@selector(gameStart:)];
        startBtn.color = ccRED;
        startBtn.anchorPoint = CGPointMake(0.5, 0.5);
        startBtn.position = ccp( 0, -120 );
        CCMenu *menu = [CCMenu menuWithItems:startBtn, nil];
        [self addChild:menu];
        
        // 説明画面へのボタン作成
        CCMenuItemFont *explainBtn = [CCMenuItemFont itemFromString:@"ヘルプ" target:self selector:@selector(explainStart:)];
        startBtn.anchorPoint = CGPointMake(0.5, 0.5);
        startBtn.position = ccp( 0, -150 );
        CCMenu *explain = [CCMenu menuWithItems:explainBtn, nil];
        [self addChild:explain];
        /*
         // 説明画面へのボタン作成
         CCMenuItemFont *rankingBtn = [CCMenuItemFont itemFromString:@"らんきんぐ" target:self selector:@selector(rankingStart:)];
         startBtn.anchorPoint = CGPointMake(0.5, 0.5);
         startBtn.position = ccp( 0, 100 );
         CCMenu *ranking = [CCMenu menuWithItems:rankingBtn, nil];
         [self addChild:ranking];
         */
        
        
        
        
        
        
    }
    
    return self;
}


// スタートボタンが押されたら呼ばれるメソッド
- (void)gameStart:(id)sender
{
    // 効果音の再生
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn_tap.mp3"];
    
    // GameSceneに切り替える
    [[CCDirector sharedDirector] replaceScene:[GameScene node]];
}

// 説明ボタンが押されたら呼ばれるメソッド
- (void)explainStart:(id)sender
{
    // 効果音の再生
    [[SimpleAudioEngine sharedEngine] playEffect:@"btn_tap.mp3"];
    
    // GameSceneに切り替える
    [[CCDirector sharedDirector] replaceScene:[explainScene node]];
}

/*
 // ランキングボタンが押されたら呼ばれるメソッド
 - (void)rankingStart:(id)sender
 {
 // 効果音の再生
 [[SimpleAudioEngine sharedEngine] playEffect:@"btn_tap.mp3"];
 
 // GameSceneに切り替える
 [[CCDirector sharedDirector] replaceScene:[kekkaScene node]];
 }
 
 */

@end