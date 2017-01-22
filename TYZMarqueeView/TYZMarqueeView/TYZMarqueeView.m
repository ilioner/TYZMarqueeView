//
//  TYZMarqueeView.m
//  TYZMarqueeView
//
//  Created by Tywin on 2017/1/22.
//  Copyright © 2017年 Tywin. All rights reserved.
//

#import "TYZMarqueeView.h"

@implementation TYZMarqueeView
{
    TYZMarqueeViewCell *_hiddenCell;
    TYZMarqueeViewCell *_showCell;
    NSInteger          _currentIndex;
}

- (instancetype)initWithFrame:(CGRect)frame withDataArray:(NSMutableArray *)dataSource
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataSource = dataSource;
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView
{
    _showCell = [[TYZMarqueeViewCell alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height)];
    _showCell.backgroundColor = [UIColor redColor];
    _hiddenCell = [[TYZMarqueeViewCell alloc] initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width,  self.frame.size.height)];
    _hiddenCell.backgroundColor = [UIColor yellowColor];
    [self addSubview:_showCell];
    [self addSubview:_hiddenCell];
    _currentIndex = 0;
    _showCell.showString = _dataSource[_currentIndex];
    _showCell.index = _currentIndex;
    [self checkIndex];
    _hiddenCell.showString = _dataSource[_currentIndex];
    _hiddenCell.index = _currentIndex;
    [self performSelector:@selector(startAnimationFirst) withObject:nil afterDelay:2];
    [_hiddenCell.mainBtn addTarget:self action:@selector(onClickCell:) forControlEvents:UIControlEventTouchUpInside];
    [_showCell.mainBtn addTarget:self action:@selector(onClickCell:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setOnclick:(ConetntClick)onclick
{
    _onclick = onclick;
}

- (void)startAnimationFirst
{
    [UIView animateWithDuration:0.7f animations:^{
        _showCell.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width,  self.frame.size.height);
        _hiddenCell.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
    } completion:^(BOOL finished) {
        _showCell.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width,  self.frame.size.height);
        [self checkIndex];
        _showCell.showString = _dataSource[_currentIndex];
        _showCell.index = _currentIndex;
        [self performSelector:@selector(startAnimationSeconed) withObject:nil afterDelay:1.5];
    }];
}

- (void)startAnimationSeconed
{
    [UIView animateWithDuration:0.7f animations:^{
        _showCell.frame = CGRectMake(0, 0, self.frame.size.width,  self.frame.size.height);
        _hiddenCell.frame = CGRectMake(0, -self.frame.size.height, self.frame.size.width,  self.frame.size.height);
    } completion:^(BOOL finished) {
        _hiddenCell.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width,  self.frame.size.height);
        [self checkIndex];
        _hiddenCell.showString = _dataSource[_currentIndex];
        _hiddenCell.index = _currentIndex;
        [self performSelector:@selector(startAnimationFirst) withObject:nil afterDelay:1.5];
    }];
}

- (void)checkIndex
{
    _currentIndex += 1;
    if (_currentIndex > _dataSource.count - 1) {
        _currentIndex = 0;
    }
}

- (void)onClickCell:(UIButton *)btn
{
    NSInteger clickIndex = btn.tag - 1000;
    _onclick(clickIndex,_dataSource[clickIndex]);
}

@end

@implementation TYZMarqueeViewCell
{
    UILabel *_mainLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        [self addSubview:_mainLabel];
        _mainBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _mainBtn.backgroundColor = [UIColor clearColor];
        [self addSubview:_mainBtn];
    }
    return self;
}


- (void)setShowString:(NSString *)showString
{
    _showString = showString;
    _mainLabel.text = showString;
}

- (void)setIndex:(NSInteger)index
{
    _index = index;
    _mainBtn.tag = 1000+index;
    [self bringSubviewToFront:_mainBtn];
}
@end
