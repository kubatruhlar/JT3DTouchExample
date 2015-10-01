//
//  ViewController.m
//  JT3DTouchExample
//
//  Created by Jakub Truhlar on 01.10.15.
//  Copyright © 2015 Jakub Truhlar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIPanGestureRecognizer *recognizer = [UIPanGestureRecognizer new];
    [self.view addGestureRecognizer:recognizer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.percentSign.hidden = false;
    self.valueLabel.text = [self stringFromForceValue:[self valueFromTouches:touches]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    self.valueLabel.text = [self stringFromForceValue:[self valueFromTouches:touches]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.valueLabel.text = @"--";
}

- (CGFloat)valueFromTouches:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return (touch.force / touch.maximumPossibleForce) * 100;
}

- (NSString *)stringFromForceValue:(CGFloat)value {
    if (value == 100.0) {
        return @"100+";
        
    } else {
        return [NSString stringWithFormat:@"%0.f", value];
    }
}

@end
