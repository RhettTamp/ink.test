//
//  CTPNearViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPNearViewController.h"
#import "CTPLiveHandler.h"
#import "CTPNearLiveCell.h"
#import "CTPPlayerViewController.h"

static NSString *identifier = @"CTPNearLiveCell";

#define kMargin 5
#define kItemWidth 100

@interface CTPNearViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *datalist;

@end

@implementation CTPNearViewController

//cell将要显示时调用
-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CTPNearLiveCell *nearCell = (CTPNearLiveCell *)cell;
    [nearCell showWithAnimation];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.datalist.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CTPNearLiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.live = self.datalist[indexPath.row];
    return cell;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger count = self.collectionView.width / kItemWidth;
    
    CGFloat extraWidth = (self.collectionView.width - kMargin * (count+1))/count;
    return CGSizeMake(extraWidth, extraWidth+20);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    CTPLive *live = self.datalist[indexPath.row];
    
    CTPPlayerViewController *vc = [[CTPPlayerViewController alloc]init];
    vc.live = live;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    [self loadData];
    
    [CTPLiveHandler executeGetNearLiveTaskWithSuccess:^(id obj) {
        
        self.datalist = obj;
        [self.collectionView reloadData];

    } failed:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(void)initUI{
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CTPNearLiveCell" bundle:nil] forCellWithReuseIdentifier:identifier];
    
}

-(void)loadData{
    
    
    
}

@end
