//
//  ALBigBangCollectionVC.m
//  BigBang
//
//  Created by Yale Li on 2017/8/2.
//  Copyright © 2017年 ttpai. All rights reserved.
//

#import "ALBigBangCollectionVC.h"
#import "ALBigBangCell.h"
#import "NSString+Extension.h"

@interface ALBigBangCollectionVC ()

@property (nonatomic, strong) NSArray<NSString *> *dataSource;

@end

@implementation ALBigBangCollectionVC

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(30, 30);
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    if (self = [super initWithCollectionViewLayout:layout]) {
       
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.allowsMultipleSelection = YES;
    self.dataSource = [self.segmentText segment:PINSegmentationOptionsKeepSymbols];
    
    // Register cell classes
    [self.collectionView registerClass:[ALBigBangCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}

#pragma mark <UICollectionViewDataSource>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(50, 30);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ALBigBangCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.title = self.dataSource[indexPath.item];
//    cell.backgroundColor = [UIColor redColor];
    // Configure the cell
    
    return cell;
}


#pragma mark <UICollectionViewDelegate>


@end
