//
//  explainScene.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/23.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "explainScene.h"
#import "TopScene.h"

@implementation explainScene



+ (id)scene
{
    CCScene *scene = [CCScene node];
    CCLayer *explain = [explainScene node];
    [scene addChild:explain];
    
    return scene;
}

- (id)init
{
    if ( self = [super init] ) {
        
        // iPhoneの画面サイズを取得する
        CGSize dispSize = [[CCDirector sharedDirector] winSize];
        
        // CCSpriteを使って背景画像を作成し、位置・サイズを調整して貼り付け
        CCSprite *back = [CCSprite spriteWithFile:@"howTo.png"];
        back.scaleX = (dispSize.width / back.boundingBox.size.width);
        back.scaleY = (dispSize.height / back.boundingBox.size.height);
        back.position = CGPointMake(dispSize.width / 2, dispSize.height / 2);
        [self addChild:back z:0];
        
        
        // 戻るの作成
        CCMenuItemFont *startBtn = [CCMenuItemFont itemFromString:@"戻る" target:self selector:@selector(backTop:)];
        
        startBtn.anchorPoint = CGPointMake(0.5, 0.5);
        startBtn.position = ccp( 0, -175 );
        CCMenu *menu = [CCMenu menuWithItems:startBtn, nil];
        [self addChild:menu];
        
        
    }
    
    return self;
}

// 戻るボタンが押されたら呼ばれるメソッド
- (void)backTop:(id)sender
{
    // 効果音の再生
    //   [[SimpleAudioEngine sharedEngine] playEffect:@"btn_tap.mp3"];
    
    // GameSceneに切り替える
    [[CCDirector sharedDirector] replaceScene:[TopScene node]];
}


@end
