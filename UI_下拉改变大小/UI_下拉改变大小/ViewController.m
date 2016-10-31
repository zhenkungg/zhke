//
//  ViewController.m
//  UI_下拉改变大小
//
//  Created by lanou on 16/10/15.
//  Copyright © 2016年 lanou. All rights reserved.
//

#import "ViewController.h"
#define imageWidth [UIScreen mainScreen].bounds.size.width;
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong )UITableView *tableView;
@property(nonatomic,strong) UIImageView *imageV;
@property(nonatomic ,strong)NSArray *arr;

@end

@implementation ViewController
-(NSArray *)arr
{
    if (!_arr ) {
        _arr =[NSArray array ];
    }
    return _arr;
}
-(void)initView
{
    self.tableView =[[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.contentInset = UIEdgeInsetsMake(20, 0,0 , 0);
    [self.view addSubview:self.tableView];
    
    self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, -200, [UIScreen mainScreen].bounds.size.width, 200)];
    self.imageV.image = [UIImage imageNamed:@"2.jpg"];
    //
    [self.tableView addSubview:self.imageV ];
    self.arr = @[@"语言",@"体育",@"文艺",@"升学",@"职业",@"生活",@"爱好",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"语言",@"体育",@"文艺",@"升学",@"职业",@"生活",@"爱好",@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /*
    
//    [self initView];
    UIActivityIndicatorView *activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.view.backgroundColor=[UIColor whiteColor];
    //样式
    //    activityIndicatorView.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
    //颜色
    activityIndicatorView.frame=CGRectMake(160, 250, 0,0);
    activityIndicatorView.color=[UIColor redColor];
    
    activityIndicatorView.hidesWhenStopped=YES;
    //开始
    [activityIndicatorView startAnimating];
    
    //   [activityIndicatorView stopAnimating];
    [self.view addSubview:activityIndicatorView];
    // Do any additional setup after loading the view, typically from a nib.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    //定时关闭
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:
     @selector(test:) userInfo:activityIndicatorView repeats:YES];
*/
}
-(void)test:(NSTimer *)timer{
    UIActivityIndicatorView *view=timer.userInfo;
    [view stopAnimating];
    [self initView];
}


#pragma mark 代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.arr[indexPath.row];
    return cell;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat  y = scrollView.contentOffset.y;
    CGFloat  h = 150 + y ;
    if (h<0) {
        CGRect frame=self.imageV.frame;
        frame.size.height = 200 - h ;
        frame.origin.y = -200+ h ;
        self.imageV.frame = frame;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  
        return @"2222222" ;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
