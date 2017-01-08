//
//  CTPMainViewController.m
//  ink.test
//
//  Created by 蓝山工作室 on 2016/12/5.
//  Copyright © 2016年 蓝山工作室. All rights reserved.
//

#import "CTPMainViewController.h"
#import "CTPMainTopView.h"

@interface CTPMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;

@property (nonatomic,strong)NSArray *datalist;

@property (nonatomic,strong)CTPMainTopView *topView;

@end

@implementation CTPMainViewController

-(CTPMainTopView *)topView{
    if (!_topView) {
        _topView = [[CTPMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.datalist];
        
        @weakify(self);
        
        _topView.block = ^(NSInteger tag){
        
            @strongify(self);
            
            CGPoint point = CGPointMake(tag * CTPSCREEN_WIDTH, 0);
            
            [self.contentScrollView setContentOffset:point animated:YES];
            
        };
    }
    return _topView;
}

-(NSArray *)datalist{
    if (!_datalist) {
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}


-(void)initUI
{
    //添加左右按钮
    [self setupNav];
    
    //添加子视图控制器
    [self setupChildViewControllers];

}

-(void)setupNav{
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}

-(void)setupChildViewControllers{
    
    NSArray *vcNames = @[@"CTPFocuseViewController",@"CTPHotViewController",@"CTPNearViewController"];
    for (NSInteger i = 0; i < vcNames.count; i++) {
        
        NSString *vcName = vcNames[i];
        
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        
        vc.title = self.datalist[i];
        
        //当执行这句话时，不会调用viewdidload方法
        [self addChildViewController:vc];
    }
    //将子控制器的view加到MainVC的scrollview上
    
    //设置scrollview的contentSize
    self.contentScrollView.contentSize = CGSizeMake(CTPSCREEN_WIDTH * self.datalist.count, 0);
    
    //开始跳到第二个页面
    self.contentScrollView.contentOffset = CGPointMake(CTPSCREEN_WIDTH, 0);
    
    //进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

//减速结束时加载子控制器view的方法
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    CGFloat width = CTPSCREEN_WIDTH;
    CGFloat height = CTPSCREEN_HEIGHT;

    CGFloat offset = scrollView.contentOffset.x;
    //获取索引值
    NSInteger idx = offset/width;
    
    //索引值联动topView
    [self.topView scrolling:idx];
    NSLog(@"---%f",offset);
    //根据索引值返回vc的引用
    UIViewController *vc = self.childViewControllers[idx];
    
    //判断当前vc是否执行过viewdidload
    if ([vc isViewLoaded]) return;
    
    NSLog(@"%@",vc);    
    
    //设置子控制器view的大小
    vc.view.frame = CGRectMake(offset, 0, width, height);
    NSLog(@"---%f",vc.view.frame.origin.x);
    [scrollView addSubview:vc.view];
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


@end
