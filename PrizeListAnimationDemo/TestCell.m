//
//  TestCell.m
//  PrizeListAnimationDemo
//
//  Created by mac on 2017/10/9.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell
+(NSString *)cellID{
    static NSString * const cellID = @"testCell";
    return cellID;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
