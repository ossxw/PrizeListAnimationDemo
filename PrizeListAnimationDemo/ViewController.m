//
//  ViewController.m
//  PrizeListAnimationDemo
//
//  Created by mac on 2017/10/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "ViewController.h"
#import "TestCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong , nonatomic) NSMutableArray *data;
@property (weak, nonatomic) IBOutlet UITableView *applyListTV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _data = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    //绑定xib cell
    [_applyListTV registerNib:[UINib nibWithNibName:NSStringFromClass([TestCell class]) bundle:nil] forCellReuseIdentifier:[TestCell cellID]];
    [self getApplyList];
}
-(void)getApplyList{
    __block int timeout = 0; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(timer, ^{
        if(timeout < 0)
        { //倒计时结束，关闭
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [_data addObject:@""];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:_data.count - 1 inSection:0];
                [self.applyListTV insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                [self.applyListTV selectRowAtIndexPath:indexPath animated:YES  scrollPosition:UITableViewScrollPositionBottom];
                
            });
            
            timeout++;
            
        }
    });
    dispatch_resume(timer);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestCell *cell = [tableView dequeueReusableCellWithIdentifier:[TestCell cellID]];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
