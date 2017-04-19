//
//  AppDelegate.m
//  Supercomments
//
//  Created by 王俊钢 on 2017/4/5.
//  Copyright © 2017年 wangjungang. All rights reserved.
//

#import "AppDelegate.h"
#import "homeViewController.h"
#import "navViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>

//腾讯开放平台（对应QQ和QQ空间）SDK头文件
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>

//微信SDK头文件
#import "WXApi.h"

//新浪微博SDK头文件
#import "WeiboSDK.h"
//新浪微博SDK需要在项目Build Settings中的Other Linker Flags添加"-ObjC"

#import "hDisplayView.h"

#define URL_APPID @"app id"

@interface AppDelegate ()
///声明微信代理属性
@property (nonatomic,assign)id<WXApiDelegate>wxDelegate;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.window.backgroundColor = [UIColor whiteColor];
    homeViewController *homevc = [[homeViewController alloc] init];
    navViewController *navigationController=[[navViewController alloc] initWithRootViewController:homevc];
    self.window.rootViewController=navigationController;
    
    navigationController.navigationBar.barStyle = UIBarStyleDefault;
    navigationController.navigationBar.translucent = NO;
    navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //navigationController.navigationBar.barTintColor = [UIColor wjColorFloat:@"008CCF"];
    [self.window makeKeyAndVisible];

    
    //向微信注册应用。
    [WXApi registerApp:URL_APPID withDescription:@"wechat"];
    return YES;
    
//    /**
//     可以在这里进行一个判断的设置，如果是app第一次启动就加载启动页，如果不是，则直接进入首页
//     **/
//    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"everLaunched"]) {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"everLaunched"];
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//    }
//    else{
//        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"firstLaunch"];
//    }
//    
//    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
//        // 这里判断是否第一次
//        
//        hDisplayView *hvc = [[hDisplayView alloc]initWithFrame:CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT)];
//        
//        [self.window.rootViewController.view addSubview:hvc];
//        
//        [UIView animateWithDuration:0.25 animations:^{
//            hvc.frame = CGRectMake(0, 0, DEVICE_WIDTH, DEVICE_HEIGHT);
//            
//        }];
//        
//    }
      // 启动图片延时: 2秒
    [NSThread sleepForTimeInterval:2];
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:self];
}

//-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
//    
//    /*! @brief 处理微信通过URL启动App时传递的数据
//     *
//     * 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
//     * @param url 微信启动第三方应用时传递过来的URL
//     * @param delegate  WXApiDelegate对象，用来接收微信触发的消息。
//     * @return 成功返回YES，失败返回NO。
//     */
//    return [WXApi handleOpenURL:url delegate:self];
//}
//
//-(void) onResp:(BaseResp*)resp{
//    NSLog(@"resp %d",resp.errCode);
//    
//    /*
//     enum  WXErrCode {
//     WXSuccess           = 0,    成功
//     WXErrCodeCommon     = -1,  普通错误类型
//     WXErrCodeUserCancel = -2,    用户点击取消并返回
//     WXErrCodeSentFail   = -3,   发送失败
//     WXErrCodeAuthDeny   = -4,    授权失败
//     WXErrCodeUnsupport  = -5,   微信不支持
//     };
//     */
//    if ([resp isKindOfClass:[SendAuthResp class]]) {   //授权登录的类。
//        if (resp.errCode == 0) {  //成功。
//            //这里处理回调的方法 。 通过代理吧对应的登录消息传送过去。
//            if ([_wxDelegate respondsToSelector:@selector(loginSuccessByCode:)]) {
//                SendAuthResp *resp2 = (SendAuthResp *)resp;
//                //[_wxDelegate loginSuccessByCode:resp2.code];
//            }
//        }else{ //失败
//            NSLog(@"error %@",resp.errStr);
//            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"登录失败" message:[NSString stringWithFormat:@"reason : %@",resp.errStr] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//            [alert show];
//        }
//    }
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
