//
//  PBTextField.m
//  customer
//
//  Created by 邓旭东 on 16/9/23.
//  Copyright © 2016年 邓旭东. All rights reserved.
//

#import "LimitLengthTextField.h"

@interface LimitLengthTextField () <UITextViewDelegate>

@end

@implementation LimitLengthTextField

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self __initSetup];
    }
    return self;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self __initSetup];
    }
    return self;
}

- (void)__initSetup {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

-(void)DidChange:(NSNotification*)noti{
    NSString *lang = [[self.nextResponder textInputMode] primaryLanguage]; // 键盘输入模式
    
    if ([lang isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [self markedTextRange];
        //获取高亮部分
        UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (self.text.length > self.maxTextLength) {
                self.text = [self.text substringToIndex:self.maxTextLength];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (self.text.length > self.maxTextLength) {
            self.text = [ self.text substringToIndex:self.maxTextLength];
        }
    }
    
}

@end
