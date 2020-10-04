//
//  AppDelegate.m
//  TabbarDisappear
//
//  Created by zhangchong on 2020/10/4.
//

#import "AppDelegate.h"
#import "TBDNavigationController.h"
#import "TBDNextViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *mainTabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.mainTabBarController = [[UITabBarController alloc] init];
    UINavigationController *dummy1 = [self dummyNavigationController];
    dummy1.title = @"dummy1";
    
    UINavigationController *dummy2 = [self dummyNavigationController];
    dummy2.title = @"dummy2";
    self.mainTabBarController.viewControllers = @[dummy1, dummy2];
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.rootViewController = self.mainTabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (UINavigationController *)dummyNavigationController {
    TBDNavigationController *navigationController = [[TBDNavigationController alloc] init];
    TBDNextViewController *rootViewController = [[TBDNextViewController alloc] initWithNextScene:YES];
    rootViewController.hidesBottomBarWhenPushed = NO;
    navigationController.viewControllers = @[rootViewController];
    return navigationController;
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
