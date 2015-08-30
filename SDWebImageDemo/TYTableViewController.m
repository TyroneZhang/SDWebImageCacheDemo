//
//  TYTableViewController.m
//  SDWebImageDemo
//
//  Created by Demon_Yao on 8/30/15.
//  Copyright (c) 2015 Tyrone Zhang. All rights reserved.
//

#import "TYTableViewController.h"
#import "TYTableViewCell.h"
#import "SDWebImageManager.h"

@interface TYTableViewController ()

@property (nonatomic, copy) NSArray *imageArray;

@end

@implementation TYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [[SDImageCache sharedImageCache] clearDisk];
    
//    NSInteger size = [[SDImageCache sharedImageCache] getSize];
    
//    
    self.imageArray = @[@"http://h.hiphotos.baidu.com/image/pic/item/2e2eb9389b504fc2022d2904e7dde71190ef6d45.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/d4628535e5dde711b90d28ffa5efce1b9c1661df.jpg",
                        @"http://e.hiphotos.baidu.com/image/pic/item/e1fe9925bc315c60b01c4aa98eb1cb13485477ee.jpg",
                        @"http://c.hiphotos.baidu.com/image/pic/item/9345d688d43f8794160b61efd01b0ef41ad53a7e.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/810a19d8bc3eb135f25769faa41ea8d3fc1f44db.jpg",
                        @"http://f.hiphotos.baidu.com/image/pic/item/ae51f3deb48f8c5471a15c2e38292df5e0fe7f45.jpg",
                        @"http://a.hiphotos.baidu.com/image/pic/item/fc1f4134970a304eed2779f3d3c8a786c9175cb6.jpg",
                        @"http://f.hiphotos.baidu.com/image/pic/item/dcc451da81cb39db4b708948d2160924ab183078.jpg",
                        @"http://h.hiphotos.baidu.com/image/pic/item/d0c8a786c9177f3ed889320072cf3bc79f3d567a.jpg",
                        @"http://b.hiphotos.baidu.com/image/pic/item/a08b87d6277f9e2f2e4cc4011d30e924b899f3ba.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYTableViewCell *cell = (TYTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"TYCell" forIndexPath:indexPath];

    [cell configureWithImageURLString:self.imageArray[indexPath.row]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 160.;
}

@end
