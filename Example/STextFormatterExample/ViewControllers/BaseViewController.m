//
//  Copyright © 2018 ZhiweiSun. All rights reserved.
//
//  File name: BaseViewController.m
//  Author:    ZhiweiSun @Cyrex
//  E-mail:    szwathub@gmail.com
//
//  Description:
//
//  History:
//      2018/2/12: Created by Cyrex on 2018/2/12
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *dismissButton;

@end

@implementation BaseViewController
#pragma mark - Life Cycle
- (instancetype)initWithTitle:(NSString *)title {
    if (self = [super init]) {
        self.view.backgroundColor = UIColorFromRGB(245, 245, 249);
        
        _titleLabel      = [[UILabel alloc] initWithFrame:CGRectMake(50, 20, SCREEN_WIDTH - 100, 30)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"KohinoorDevanagari-Medium" size:16];
        _titleLabel.text = title;
        
        _dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 60, SCREEN_WIDTH - 100, 40)];
        _dismissButton.layer.cornerRadius  = 20;
        _dismissButton.layer.masksToBounds = YES;
        _dismissButton.backgroundColor     = [UIColor whiteColor];
        [_dismissButton setTitle:@"Dismiss" forState:UIControlStateNormal];
        [_dismissButton setTitleColor:UIColorFromRGB(23, 22, 22)
                             forState:UIControlStateNormal];
        [_dismissButton addTarget:self
                           action:@selector(dismiss)
                 forControlEvents:UIControlEventTouchUpInside];
        
        _baseField = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, SCREEN_WIDTH - 60, 40)];
        _baseField.layer.cornerRadius  = 10;
        _baseField.layer.masksToBounds = YES;
        _baseField.backgroundColor = [UIColor whiteColor];
        _baseField.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        [self.view addSubview:_titleLabel];
        [self.view addSubview:_dismissButton];
        [self.view addSubview:_baseField];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(ia_dismissKeyboard)];
        [self.view addGestureRecognizer:tap];
    }
    
    return self;
}


#pragma mark - Action Methods
- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)ia_dismissKeyboard {
    [self.baseField resignFirstResponder];
}

@end
