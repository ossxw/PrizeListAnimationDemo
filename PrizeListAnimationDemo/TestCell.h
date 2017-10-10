//
//  TestCell.h
//  PrizeListAnimationDemo
//
//  Created by mac on 2017/10/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentL;
+(NSString *)cellID;
@end
