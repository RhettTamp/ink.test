//
//  CTPHotViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPHotViewController.h"
#import "CTPLiveHandler.h"
#import "CTPLiveTableViewCell.h"
#import "CTPPlayerViewController.h"
static NSString *identifier = @"CTPLiveCell";

@interface CTPHotViewController ()

@property (nonatomic,strong)NSMutableArray *datalist;

@end

@implementation CTPHotViewController

-(NSMutableArray *)datalist{
    if (!_datalist) {
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datalist.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CTPLiveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    cell.live = self.datalist[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70 + CTPSCREEN_WIDTH;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CTPLive *live = self.datalist[indexPath.row];
    
    CTPPlayerViewController *vc = [[CTPPlayerViewController alloc]init];
    vc.live = live;
    [self.navigationController pushViewController:vc animated:YES];
    
    /*系统自带的不能直播
    MPMoviePlayerViewController *movieVC = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL URLWithString:live.streamAddr]];
    [self presentViewController:movieVC animated:YES completion:nil];
    */
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    [self loadData];
    
}

-(void)initUI{
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.translatesAutoresizingMaskIntoConstraints = YES;
    [self.tableView registerNib:[UINib nibWithNibName:@"CTPLiveTableViewCell" bundle:nil] forCellReuseIdentifier:identifier];
}

-(void)loadData{
    
    [CTPLiveHandler executeGetHotLiveTaskWithSuccess:^(id obj) {

        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } failed:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

@end
