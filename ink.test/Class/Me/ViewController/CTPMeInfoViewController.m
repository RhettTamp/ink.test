//
//  CTPMeViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/11.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPMeInfoViewController.h"
#import "CTPMeInfoView.h"
#import "CTPSetting.h"

@interface CTPMeInfoViewController ()

@property (nonatomic,strong) NSArray *datalist;
@property (nonatomic,strong) CTPMeInfoView *infoView;

@end

@implementation CTPMeInfoViewController

-(CTPMeInfoView *)infoView{
    if (!_infoView) {
        _infoView = [CTPMeInfoView loadInfoView];
    }
    return _infoView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView.rowHeight = 60;
    self.tableView.sectionFooterHeight = 0;
    [self loadData];
}

-(void)loadData{
    
    CTPSetting *set1 = [[CTPSetting alloc]init];
    set1.title = @"映客贡献榜";
    set1.subTitle = @"";
    set1.vcName = @"CTPGongViewController";
    
    CTPSetting *set2 = [[CTPSetting alloc]init];
    set2.title = @"收益";
    set2.subTitle = @"映票";
    set2.vcName = @"CTPShowViewController";
    
    CTPSetting *set3 = [[CTPSetting alloc]init];
    set3.title = @"账户";
    set3.subTitle = @"钻石";
    set3.vcName = @"CTPZhangViewController";
    
    CTPSetting *set4 = [[CTPSetting alloc]init];
    set4.title = @"等级";
    set4.subTitle = @"3 级";
    set4.vcName = @"CTPDengViewController";
    
    CTPSetting *set5 = [[CTPSetting alloc]init];
    set5.title = @"设置";
    set5.subTitle = @"";
    set5.vcName = @"CTPSettingViewController";
    
    NSArray *arr1 = @[set1,set2,set3];
    NSArray *arr2 = @[set4];
    NSArray *arr3 = @[set5];
    
    self.datalist = @[arr1,arr2,arr3];
    [self.tableView reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.datalist.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *arr = self.datalist[section];
    return arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    
    CTPSetting *set = self.datalist[indexPath.section][indexPath.row];
    cell.textLabel.text = set.title;
    cell.detailTextLabel.text = set.subTitle;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return self.infoView;
    }
    return nil;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CTPSCREEN_HEIGHT * 0.4;
    }
    return 5;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
