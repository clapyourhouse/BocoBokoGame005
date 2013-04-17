//
//  EventLayer.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "EventLayer.h"
#import "GameScene.h"

@implementation EventLayer

@synthesize score;

static EventLayer *eventLayer_ = nil;

+ (EventLayer *)sharedInstance
{
    if ( eventLayer_ == nil ) {
        eventLayer_ = [EventLayer node];
    }
    
    return eventLayer_;
}

- (id)init
{
    if ( self = [super init] ) {
        
    }
    
    return self;
}

- (void)dealloc
{
    eventLayer_ = nil;
    [super dealloc];
}
/*
 // 1~3のランダムな数値を返す(1:金 / 2:銀 / 3:銅)
 - (int)randomCoin
 {
 int random = rand() % 3 + 1;
 return random;
 }
 
 */

// 1~5のランダムな数値を返す コインの落ちる場所を決める
- (int)randomMove
{
    int random = rand() % 5 + 1;
    return random;
}



// 1~4のランダムな数値を返す thebossをタッチした時の画像を差し替える
- (int)randomBossChange
{
    int random = rand() % 4 + 1;
    return random;
}

//ランダムにコメントを表示する。
-(int)randomComment{
    int random = rand() % 5 + 1;
    return random;
    
}


// 社長の動き
- (int)randomAyaji
{
    int random = rand() % 1 + 1;
    return random;
}



// コインにバウンス効果を加えるメソッド
- (void)coinAction:(CCSprite *)sprite
{
    id move;
    id action;
    
    int moveCoin = [self randomMove];
    if ( moveCoin == 1 )
    {
        // アクションの定義
        move = [CCMoveBy actionWithDuration:1.7 position:ccp(-55, -185)];
        action = [CCEaseBounceOut actionWithAction:move];
    }
    else if( moveCoin == 2 )
    {
        move = [CCMoveBy actionWithDuration:1.7 position:ccp(55, -185)];
        action = [CCEaseBounceOut actionWithAction:move];
    }
    else if( moveCoin == 3 )
    {
        move = [CCMoveBy actionWithDuration:1.7 position:ccp(-85, -185)];
        action = [CCEaseBounceOut actionWithAction:move];
    }
    else if( moveCoin == 4 )
    {
        move = [CCMoveBy actionWithDuration:1.7 position:ccp(85, -185)];
        action = [CCEaseBounceOut actionWithAction:move];
    }
    
    else if( moveCoin == 5 )
    {
        move = [CCMoveBy actionWithDuration:1.7 position:ccp(10, -185)];
        action = [CCEaseBounceOut actionWithAction:move];
    }
    
    // アニメーションを実行させる。アニメーション終了後removeFromParentAndCleanup:メソッドを使って
    // CCSprite(コイン)を画面から除去している
    // CCSequenceはアニメーションを順番に実行する(同時に実行させたい場合はSpwan)
    // CCCallFuncNDを使うことで、アニメーションが終わった後にメソッドを実行させることができる
    [sprite runAction:[CCSequence actions:action, [CCCallFuncND actionWithTarget:sprite
                                                                        selector:@selector(removeFromParentAndCleanup:)
                                                                            data:(void *)YES], nil]];
    
}

- (void)oyajiAction:(CCSprite *)sprite
{
    id move1, move2, move3, move4, move5, move6, move7, move8, move9, move10;
    //id action;
    
    int moveOyaji = [self randomAyaji];
    
    if ( moveOyaji == 1 )
    {
        move1 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 130)];
        move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(-60, -10)];
        move3 = [CCMoveBy actionWithDuration:0.5 position:ccp(100, 130)];
        move4 = [CCMoveBy actionWithDuration:0.5 position:ccp(-120 , -80)];
        move5 = [CCMoveBy actionWithDuration:0.5 position:ccp(130, 100)];
        move6 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 130)];
        move7 = [CCMoveBy actionWithDuration:0.5 position:ccp(-60, -10)];
        move8 = [CCMoveBy actionWithDuration:0.5 position:ccp(100, 130)];
        move9 = [CCMoveBy actionWithDuration:0.5 position:ccp(-120 , -80)];
        move10 = [CCMoveBy actionWithDuration:0.5 position:ccp(130, 100)];
        
        [sprite runAction:[CCSequence actions:move1, move2, move3, move4, move5, move6, move7, move8, move9, move10, nil]];
    }
    /*
     else if( moveOyaji == 2 )
     {
     move1 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 40)];
     move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(60, 70)];
     move3 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 26)];
     move4 = [CCMoveBy actionWithDuration:0.5 position:ccp(90 , 60)];
     move5 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 90)];
     
     [sprite runAction:[CCSequence actions:move1, move2, move3, move4, move5, nil]];
     }
     else if( moveOyaji == 3 )
     {
     move1 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 40)];
     move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(60, 70)];
     move3 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 26)];
     move4 = [CCMoveBy actionWithDuration:0.5 position:ccp(90 , 60)];
     move5 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 90)];
     
     [sprite runAction:[CCSequence actions:move1, move2, move3, move4, move5, nil]];
     }
     else if( moveOyaji == 4 )
     {
     move1 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 40)];
     move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(60, 70)];
     move3 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 26)];
     move4 = [CCMoveBy actionWithDuration:0.5 position:ccp(90 , 60)];
     move5 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 90)];
     
     [sprite runAction:[CCSequence actions:move1, move2, move3, move4, move5, nil]];
     }
     else if( moveOyaji == 5 )
     {
     move1 = [CCMoveBy actionWithDuration:0.5 position:ccp(20, 40)];
     move2 = [CCMoveBy actionWithDuration:0.5 position:ccp(60, 70)];
     move3 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 26)];
     move4 = [CCMoveBy actionWithDuration:0.5 position:ccp(90 , 60)];
     move5 = [CCMoveBy actionWithDuration:0.5 position:ccp(10, 90)];
     
     [sprite runAction:[CCSequence actions:move1, move2, move3, move4, move5, nil]];
     }
     */
}


@end

