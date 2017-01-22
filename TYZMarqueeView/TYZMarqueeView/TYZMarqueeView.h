//
//  TYZMarqueeView.h
//  TYZMarqueeView
//
//  Created by Tywin on 2017/1/22.
//  Copyright © 2017年 Tywin. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConetntClick)(NSInteger index,id obj);
@interface TYZMarqueeView : UIView

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) ConetntClick   onclick;

- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSMutableArray *)dataSource;
@end


@interface TYZMarqueeViewCell : UIView

@property (nonatomic, strong) NSString  *showString;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIButton  *mainBtn;

@end
