//
//  MainTabBarController.m
//  InfoCapture
//
//  Created by feng on 14/04/2017.
//  Copyright © 2017 feng. All rights reserved.
//

#import "MainTabBarController.h"
#import "PictureCaptureViewcontroller.h"
#import "InfoQueryViewController.h"
#import "UserManager.h"
@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewControllrs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//设置底部viewcontroller
- (void)setViewControllrs
{
    NSMutableArray *fooRows = [NSMutableArray array];
    [kUserManager.userModel.rows enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSDictionary *dic = obj;
        NSString *text = dic[@"text"];
        [fooRows addObject:text];
    }];
    
    //导航
    NSArray *navNameArr = @[@"PictureCaptureNavigationController",
                            @"InfoQueryNavigationController",
                            @"UserCenterNavigationController"];
    NSArray *sbNameArr = @[@"PictureCapture",
                           @"InfoQuery",
                           @"UserCenter"];
    //控制器名称
    NSArray *vcTitleArr = @[@"采集中心",
                            @"查询统计",
                            @"我的"];
    //tabBarItem未选中时的图片
    NSArray *vcImgArr = vcTitleArr;
    //tabBarItem选中时的图片
    NSArray *vcSelectedImgArr = @[@"采集中心选中",
                                  @"查询统计选中",
                                  @"我的选中"];
    //tabBarItem未选中时的文字颜色
    UIColor *titleColor = kGrayFontColor;
    //tabBarItem选中时的文字颜色
    UIColor *selectedTitleColor = kSubjectColor;
    
    //放置viewControllers
    NSMutableArray *vcArr = [NSMutableArray array];
    //设置tabBar的viewControllers
    for (int i = 0; i < vcTitleArr.count; i++) {
        NSString *nameStr = vcTitleArr[i];
        if (![fooRows containsObject:nameStr] && i != (vcTitleArr.count - 1)) {
            continue;
        }
        UINavigationController *navigationController = [[UIStoryboard storyboardWithName:sbNameArr[i] bundle:nil]  instantiateViewControllerWithIdentifier:navNameArr[i]];
        [vcArr addObject:navigationController];
        
        //tabBarItem
        UITabBarItem *tabBarItem = [[UITabBarItem alloc] init];
        navigationController.tabBarItem = tabBarItem;
        
        //设置图片
        tabBarItem.image = [[UIImage imageNamed:vcImgArr[i]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        tabBarItem.selectedImage = [[UIImage imageNamed:vcSelectedImgArr[i]] imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        
        //设置文字
        tabBarItem.title = vcTitleArr[i];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleColor, NSForegroundColorAttributeName, nil] forState:(UIControlStateNormal)];
        [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:selectedTitleColor, NSForegroundColorAttributeName, nil] forState:(UIControlStateSelected)];
        
    }
    self.viewControllers = vcArr;
    //改变tabbar 线条颜色
    CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 0.2);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   kSeparateLineColor.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setShadowImage:img];
    [self.tabBar setBackgroundImage:[[UIImage alloc]init]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
