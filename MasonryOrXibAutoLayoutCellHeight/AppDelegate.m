//
//  AppDelegate.m
//  MasonryOrXibAutoLayoutCellHeight
//
//  Created by GoGo: 林祥星 on 2017/8/31.
//  Copyright © 2017年 GoGoGold: Inxx. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
