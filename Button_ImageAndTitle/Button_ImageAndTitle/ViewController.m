//
//  ViewController.m
//  Button_ImageAndTitle
//
//  Created by youngstar on 16/3/24.
//  Copyright © 2016年 杨铭星. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+LXMImagePosition.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *originalButton;

@property (weak, nonatomic)  UIButton *oneButton;
@property (weak, nonatomic)  UIButton *twoButton;
@property (weak, nonatomic)  UIButton *threeButton;


@property (weak, nonatomic)  UIButton *originalButton_line;
@property (weak, nonatomic)  UIButton *oneButton_line;
@property (weak, nonatomic)  UIButton *twoButton_line;
@property (weak, nonatomic)  UIButton *threeButton_line;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //图片是60*60的2x的图
//    CGFloat imageWith = 30;
//    CGFloat imageHeight = 30;
//    
//    CGFloat labelWidth = [self.originalButton.titleLabel.text sizeWithFont:self.originalButton.titleLabel.font].width;
//    CGFloat labelHeight = [self.originalButton.titleLabel.text sizeWithFont:self.originalButton.titleLabel.font].height;
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(100, 200, 100, 40);
    
   
    
    [button setImage:[UIImage imageNamed:@"like"] forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [button setTitle:@"One" forState:(UIControlStateNormal)];
    
   
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 70);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 0 , 0, 30);
    button.titleLabel.textAlignment = 0;
    [self.view addSubview:button];
    
    
    [self setupDefault];
    
    //图片是60*60的2x的图
    CGFloat imageWith = 30;
    CGFloat imageHeight = 30;
    CGFloat labelWidth = [self.originalButton.titleLabel.text sizeWithFont:self.originalButton.titleLabel.font].width;
    CGFloat labelHeight = [self.originalButton.titleLabel.text sizeWithFont:self.originalButton.titleLabel.font].height;
    
    //image在后，文字在前
    self.oneButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.oneButton.backgroundColor = [UIColor lightGrayColor];
    self.oneButton.frame = CGRectMake(100, 400, 100, 40);
    self.oneButton.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
    self.oneButton.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, 0, imageWith);
    
    [_oneButton setImage:[UIImage imageNamed:@"like"] forState:(UIControlStateNormal)];
    [_oneButton setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
    [_oneButton setTitle:@"One" forState:(UIControlStateNormal)];
    
    [self.view addSubview:self.oneButton];
    
    //image在上，文字在下
    CGFloat imageOffsetX = (imageWith + labelWidth) / 2 - imageWith / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWith + labelWidth / 2) - (imageWith + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2;//label中心移动的y距离
    
    self.twoButton.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
    self.twoButton.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
    
    [self.twoButton_line setImagePosition:LXMImagePositionTop spacing:10];
    
    
    //image，label中间间隔10
    self.threeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    self.threeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);//注意看显示，label因为大小不够文字显示不全了，如果button大小更大的话这样写也没有问题
    
    [self.threeButton_line setImagePosition:LXMImagePositionLeft spacing:10];//这样文字图片都能正常显示，但是button大小没有变化
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)setupDefault {
    [self setupButton:self.originalButton_line];
    [self setupButton:self.oneButton_line];
    [self setupButton:self.twoButton_line];
    [self setupButton:self.threeButton_line];
}

- (void)setupButton:(UIButton *)button {
    button.layer.borderColor = [[UIColor greenColor] CGColor];
    button.layer.borderWidth = 1;
    
    button.imageView.layer.borderColor = [[UIColor orangeColor] CGColor];
    button.imageView.layer.borderWidth = 1;
    
    button.titleLabel.layer.borderColor = [[UIColor blueColor] CGColor];
    button.titleLabel.layer.borderWidth = 1;
}


@end
