//
//  ViewController.m
//  MySSKey
//
//  Created by apple on 16/8/2.
//  Copyright © 2016年 qingxunLv. All rights reserved.
//

#import "ViewController.h"
#import "SSKeychain.h"
#import "SSKeychainQuery.h"
#import <SceneKit/SceneKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [SSKeychain setPassword: [NSString stringWithFormat:@"%@", [UIDevice currentDevice].identifierForVendor]
                 forService:@"com.yourapp.yourcompany"account:@"user"];
    //从钥匙串读取UUID：
    //DA218F36-DF4B-43F0-ACB9-D9B416BAFE39
    NSString *retrieveuuid = [SSKeychain passwordForService:@"com.yourapp.yourcompany"account:@"user"];
    NSLog(@"从钥匙串读取UUID%@",retrieveuuid);

    
    
}

- (void)test{
    //一.添加一条钥匙    （这个钥匙的信息 由 服务名+账号+密码 组成）
    //先定义一下要用的东东
    
    NSString *serviceName= @"qingxun.com.MySSKey";
    NSString *account = @"m4abcd";
    NSString *password = @"12345678";
    //加入钥匙串！
    if ([SSKeychain setPassword:password forService:serviceName account:account]) {
        NSLog(@"加入钥匙串 success !");
        
    }
    //二.查询
    //1.查询某service 下 count 的密码并且打印出来：
    
    NSLog(@"password=%@",[SSKeychain passwordForService:serviceName account:account]);
    
    //2.查询service下所有钥匙:
    NSArray *keys = [SSKeychain accountsForService:serviceName];
    NSLog(@"keys=%@",keys);
    //3.查询本appkeychain的所有钥匙
    
    NSArray *allkeys = [SSKeychain allAccounts];
    NSLog(@"allkeys=%@",allkeys);
    
    //三.更新
    
    if ([SSKeychain setPassword:@"321321" forService:serviceName account:account]) {
        NSLog(@"更新set success!");
    }
    
    
    //四.删除
    if([SSKeychain deletePasswordForService:serviceName account:account]){
        NSLog(@"删除delete success!");
    }


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
