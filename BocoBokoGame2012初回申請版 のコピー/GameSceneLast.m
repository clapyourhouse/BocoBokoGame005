//
//  GameSceneLast.m
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameSceneLast.h"
#import "kekkaScene.h"
#import "SimpleAudioEngine.h"
#import "nowResult.h"

@implementation GameSceneLast

@synthesize scoreLabel;
@synthesize score_thepresident;

+ (id)scene
{
    CCScene *scene = [CCScene node];
    CCLayer *gameScene = [GameSceneLast node];
    [scene addChild:gameScene];
    
    return scene;
}

- (id)init
{
    if ( self = [super init] ) {
        
        // BGM再生
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"bgm3_GameScene.mp3"];
        
        // iPhoneの画面サイズを取得する
        CGSize dispSize = [[CCDirector sharedDirector] winSize];
        
        // CCSpriteを使って背景画像を作成し、位置・サイズを調整して貼り付け
        CCSprite *back = [CCSprite spriteWithFile:@"background_presidentroom.png"];
        back.scaleX = (dispSize.width / back.boundingBox.size.width);
        back.scaleY = (dispSize.height / back.boundingBox.size.height);
        back.position = CGPointMake(dispSize.width / 2, dispSize.height / 2);
        [self addChild:back z:0];
        
        
        thepresident = [CCSprite spriteWithFile:@"thepresident_mains.png"];
        thepresident.position = CGPointMake(dispSize.width / 2, dispSize.height / 2);
        [self addChild:thepresident z:150];
        
        
        
        // scoreの表示
        // EventLayerオブジェクトを生成
        EventLayer *eventLayer = [EventLayer sharedInstance];
        
        // scoreの初期化
        eventLayer.score = 0;
        
        // scoreを表示するラベルを作成
        NSString *scoreString = [NSString stringWithFormat:@"%08d", eventLayer.score];
        scoreLabel = [CCLabelTTF labelWithString:scoreString
                                        fontName:@"Helvetica"
                                        fontSize:22];
        // scoreラベルの色を変更 ccc3はRGBを数値で変更できる ccc4もある
        scoreLabel.color = ccc3(0, 0, 0);
        
        // scoreラベルの位置を決めて貼付ける
        scoreLabel.position = ccp(255, 470);
        [self addChild:scoreLabel z:50];
        
        
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
        
        
        count = 0;
        
        // おやじアクションの呼び出し
        //  [eventLayer oyajiAction:thepresident];
        
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


// スコア表示を更新する
-(void)updateScore
{
    NSString *scoreString = [NSString stringWithFormat:@"%08d", score_thepresident];
    [scoreLabel setString:scoreString];
}

// スコアを加算する
- (void)addScore:(NSInteger)reward
{
    score_thepresident += reward;
    
}


- (void)dealloc
{
    [EventLayer release];
    [super dealloc];
}


// タッチイベントの処理
// タッチ操作を有効にする
- (void)onEnter
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self
                                                     priority:0
                                              swallowsTouches:YES];
    
    [super onEnter]; // これを忘れると他の操作が上手くいかなくなるので必ず書くこと
}

// タッチ操作を無効にする
- (void)onExit
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    // タップした座標を取得する
    CGPoint locationInView = [touch locationInView:[touch view]];
    
    // タップした座標をcocos2dで使用している座標形に切り替える
    CGPoint location = [[CCDirector sharedDirector] convertToGL:locationInView];
    
    // 画像の矩形を取得するために上司の画像を読み込んで、位置を計算している(ここで画像を貼付けているわけではない、あくまで位置の計差用)
    CGSize dispSize = [[CCDirector sharedDirector] winSize];
    CCSprite *back = [CCSprite spriteWithFile:@"theboss_mains.png"];
    
    back.position = CGPointMake(dispSize.width / 2, dispSize.height / 2);
    
    float w = back.contentSize.width;
    float h = back.contentSize.height;
    float x = back.position.x - w/2;
    float y = back.position.y - h/2;
    CGRect rect = CGRectMake(x, y, w, h);
    
    // ここでタッチした場所が矩形内かどうかをCGRectContainsPoint関数を使って判別する
    if ( CGRectContainsPoint(rect, location) ) {
        
        // コインゲットの効果音再生
        [[SimpleAudioEngine sharedEngine] playEffect:@"coin_get.mp3"];
        
        CCSprite *coinSprite;
        
        EventLayer *eventLayer = [EventLayer sharedInstance];
        
        //int coin = eventLayer.randomCoin;
        
        ++count;
        
        // 金
        if ( count == 1 || count == 4 || count == 7 || count == 10 || count == 13 || count == 16 ||
            count == 19 || count == 22 || count == 25 || count == 28 || count == 31 || count == 34 ||
            count == 37 || count == 40 || count == 43 || count == 46 || count == 49 || count == 52 ||
            count == 55 || count == 58 || count == 61 || count == 64 || count == 67 || count == 70)
        {
            // 得点を加算
            [self addScore:100];
            [self updateScore];
            
            coinSprite = [CCSprite spriteWithFile:@"coin_golds.png"];
            if (count == 4) {
                coinSprite = [CCSprite spriteWithFile:@"daiya-white-4s-1.png"];
            }else if (count == 7) {
                coinSprite = [CCSprite spriteWithFile:@"satsutaba-4s-1.png"];
            }else if (count == 10) {
                coinSprite = [CCSprite spriteWithFile:@"satsutaba-4s-1.png"];
            }else if (count == 13) {
                coinSprite = [CCSprite spriteWithFile:@"satsutaba-4s-1.png"];
            }else if (count == 16) {
                coinSprite = [CCSprite spriteWithFile:@"car-4s.png"];
            }
            
            
            
            
            
            
        }
        
        // 銀
        else if ( count == 2 || count == 5 || count == 8 || count == 11 ||count == 14 || count == 17 ||
                 count == 20 || count == 23 || count == 26 || count == 29 || count == 32 || count == 35 ||
                 count == 38 || count == 41 || count == 44 || count == 47 || count == 50 || count == 53 ||
                 count == 56 || count == 59 || count == 62 || count == 65 || count == 68 || count == 71)
        {
            // 得点を加算
            [self addScore:50];
            [self updateScore];
            
            coinSprite = [CCSprite spriteWithFile:@"coin_silvers.png"];
            
        }
        
        // 銅
        else if ( count == 3 || count == 6 || count == 9 ||count == 12 ||count == 15 || count == 18 ||
                 count == 21 || count == 24 || count == 27 || count == 30 || count == 33 || count == 36 ||
                 count == 39 || count == 42 || count == 45 || count == 48 || count == 51 || count == 54 ||
                 count == 57 || count == 60 || count == 63 || count == 66 || count == 69 || count == 72)
        {
            // 得点を加算
            [self addScore:30];
            [self updateScore];
            
            coinSprite = [CCSprite spriteWithFile:@"coin_brondss.png"];
            
        }
        
        // コイン画像の位置を決めて、貼り付け
        coinSprite.position = CGPointMake(dispSize.width /2, dispSize.height/2);
        [self addChild:coinSprite z:200];
        
        // EventLayerのcoinActionを実行
        [eventLayer coinAction:coinSprite];
        
        
        // thebossの画像の差し替えをする
        
        int bossNumber = eventLayer.randomBossChange;
        
        if ( bossNumber == 1 )
        {
            texture = [[CCTextureCache sharedTextureCache] addImage:@"thepresident_lefts.png"];
        }
        else if( bossNumber == 2 )
        {
            texture = [[CCTextureCache sharedTextureCache] addImage:@"thepresident_rights.png"];
        }
        else if( bossNumber == 3 )
        {
            texture = [[CCTextureCache sharedTextureCache] addImage:@"thepresident_tops.png"];
        }
        else if( bossNumber == 4 )
        {
            texture = [[CCTextureCache sharedTextureCache] addImage:@"thepresident_supriseds.png"];
        }
        else if( bossNumber == 5 )
        {
            texture = [[CCTextureCache sharedTextureCache] addImage:@"thepresident_falldowns.png"];
        }
        
        
        [thepresident setTexture:texture];
        
        
    } else {
        
        
    }
    return YES; // ここでYESを返すと以下3つのタッチイベントが呼ばるようになる。NOだと呼ばれない。
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

// 結果画面へ画面遷移
- (void)nextScene
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setInteger:score_thepresident forKey:@"score_thepresident"];
    [ud synchronize];
    
    CCScene *newScene = [nowResult node];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:2 scene:newScene]];
}

@end
