//
//  ViewController.m
//  DropBall
//
//  Created by Ngô Sỹ Trường on 4/28/16.
//  Copyright © 2016 ngotruong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UIImageView* ball;
    NSTimer *timer;
    CGFloat ballRadius;
    CGFloat x, y, vellocityY, accelerateY, maxHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self addBall];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                             target:self
                                           selector:@selector(dropBall)
                                           userInfo:nil
                                            repeats:true];
}

-(void) addBall {
    CGSize mainViewSize = self.view.bounds.size;
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"football.png"] ];
    ballRadius = 32.0;
    x = mainViewSize.width * 0.5;
    y = ballRadius;
    
    vellocityY = 0.0;
    accelerateY = 4.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    maxHeight = mainViewSize.height - statusNavigationBarHeight - ballRadius;
    ball.center = CGPointMake(x, y);
    [self.view addSubview:ball];
}
-(void) dropBall {
    vellocityY += accelerateY ;
    y += vellocityY;
    if (y > maxHeight) {
        vellocityY = -vellocityY * 0.9 ;
        y = maxHeight;
    }
    ball.center = CGPointMake(x, y);
}
@end
