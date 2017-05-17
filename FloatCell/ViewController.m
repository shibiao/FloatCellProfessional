//
//  ViewController.m
//  FloatCell
//
//  Created by sycf_ios on 2017/5/15.
//  Copyright © 2017年 shibiao. All rights reserved.
//

#import "ViewController.h"
#import "SBCollectionItem.h"
#import "ShareMenu.h"
@interface ViewController ()<NSCollectionViewDataSource,NSCollectionViewDelegate>
@property (weak) IBOutlet NSScrollView *scrollView;

@property (nonatomic,strong) NSMutableArray *data;

@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView setSelectable:YES];
    [self.collectionView registerNib:[[NSNib alloc]initWithNibNamed:@"SBCollectionItem" bundle:nil] forItemWithIdentifier:@"SBCollectionItem"];
    [self.scrollView setPostsBoundsChangedNotifications:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(boundsDidChange:) name:NSViewBoundsDidChangeNotification object:self.scrollView.contentView];
}
-(void)viewDidAppear{
    [super viewDidAppear];
    
}
//MARK: NSCollectionViewDataSource&NSCollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView{
    return 3;
}
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}
- (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath{
    SBCollectionItem *item = [collectionView makeItemWithIdentifier:@"SBCollectionItem" forIndexPath:indexPath];
    item.text.stringValue = [NSString stringWithFormat:@"%ld-%ld",(long)indexPath.section,(long)indexPath.item];
    return item;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
-(void)boundsDidChange:(NSNotification *)notification{
    [self.view layoutSubtreeIfNeeded];
    [[ShareMenu share]close];
    
    
}

-(void)viewDidDisappear{
    [super viewDidDisappear];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:NSViewBoundsDidChangeNotification object:self.scrollView.contentView];

}
@end
