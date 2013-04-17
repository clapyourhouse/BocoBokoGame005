//
//  RootViewController.h
//  BocoBokoGame
//
//  Created by 彰悟 北村 on 12/09/20.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <iAd/iAd.h>


@interface RootViewController : UIViewController<ADBannerViewDelegate>{
    
    ADBannerView *bannerView;
    BOOL bannerIsVisible;  //ADBannerViewの表示／非表示状態を保存する変数を作成
    
}

@property (nonatomic,retain)     ADBannerView *bannerView;
@property (nonatomic, assign) BOOL bannerIsVisible;

-(void)moveBannerViewOnscreen;
-(void)moveBannerViewOffscreen;

/////iAd//////

@end
