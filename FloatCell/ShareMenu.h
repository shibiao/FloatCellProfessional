//
//  ShareMenu.h
//  FloatCell
//
//  Created by sycf_ios on 2017/5/16.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#define kDuration (0.5)
@interface ShareMenu : NSObject
//通过修改edgeOffset，可改变弹出视图的大小;
@property (nonatomic,assign) CGFloat edgeOffset;
//实例化单例
+(instancetype)share;

/**
 弹出对应item的子Windows视图

 @param item collectionViewItem
 */
-(void)popOverMenuWithItem:(NSCollectionViewItem *)item;
//关闭
-(void)close;
@end
