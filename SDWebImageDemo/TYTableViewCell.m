//
//  TYTableViewCell.m
//  SDWebImageDemo
//
//  Created by Demon_Yao on 8/30/15.
//  Copyright (c) 2015 Tyrone Zhang. All rights reserved.
//

#import "TYTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"
#import <CommonCrypto/CommonCrypto.h>

@interface TYTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *tyImageView;

@end

@implementation TYTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithImageURLString:(NSString *)URLString
{
//    [self.tyImageView sd_setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//
//    }];
    
//    NSLog(@"===%@",[self getMD5String:URLString]);
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    UIImage *cachedImage = [manager.imageCache imageFromMemoryCacheForKey:[self getMD5String:URLString]];
    if (!cachedImage) {
        cachedImage = [manager.imageCache imageFromDiskCacheForKey:[self getMD5String:URLString]];
    }
    
    if (!cachedImage) {
        [manager downloadImageWithURL:[NSURL URLWithString:URLString] options:SDWebImageCacheMemoryOnly progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            [self.tyImageView setImage:image];
            [manager.imageCache storeImage:image forKey:[self getMD5String:URLString]];
        }];
    } else {
        self.tyImageView.image = cachedImage;
        if ([@"4e804532624e61de7228d2a9df16be1f" isEqualToString:[self getMD5String:URLString]]) {
            [manager.imageCache removeImageForKey:[self getMD5String:URLString] fromDisk:YES];
        }
        
    }
    
    
}

- (NSString *)getMD5String:(NSString *)sourceString
{
    const char *cStr = [sourceString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
