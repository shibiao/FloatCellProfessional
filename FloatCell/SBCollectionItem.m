//
//  SBCollectionItem.m
//  FloatCell
//
//  Created by sycf_ios on 2017/5/15.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "SBCollectionItem.h"
#import "ShareMenu.h"
@interface SBCollectionItem ()

@end

@implementation SBCollectionItem

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc]initWithRect:self.view.frame options:NSTrackingMouseEnteredAndExited|NSTrackingInVisibleRect|NSTrackingActiveAlways owner:self userInfo:nil];
    
    [self.view addTrackingArea:trackingArea];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(windowDidResize:) name:NSWindowDidResizeNotification object:nil];

}
-(void)viewWillAppear{
    [super viewWillAppear];
    self.view.layer.cornerRadius = 5;
    [self.view.layer masksToBounds];
}
//鼠标移进
-(void)mouseEntered:(NSEvent *)event{
    [super mouseEntered:event];
    [[ShareMenu share]popOverMenuWithItem:self ];
    
}

//鼠标移出
-(void)mouseExited:(NSEvent *)event{
    [super mouseExited:event];
}
-(void)windowDidResize:(NSNotification *)notification{
    [[ShareMenu share]popOverMenuWithItem:self];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NSWindowDidResizeNotification object:nil];
}

@end
