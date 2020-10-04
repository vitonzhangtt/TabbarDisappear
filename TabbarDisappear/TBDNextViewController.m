//
//  TBDNextViewController.m
//  TabbarDisappear
//
//  Created by zhangchong on 2020/10/4.
//

#import "TBDNextViewController.h"

@interface TBDNextViewController ()

@property (nonatomic, assign) BOOL canGotoNextScene;
@property (nonatomic, strong) UIButton *gotoNextButton;
@property (nonatomic, strong) UILabel *nextSceneLabel;
@property (nonatomic, strong) UISwitch *nextSceneSwitch;

@end

@implementation TBDNextViewController

- (instancetype)initWithNextScene:(BOOL)canGotoNextScene {
    self = [super init];
    if (self) {
        _canGotoNextScene = canGotoNextScene;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = self.view.bounds;
    
    /// gotoNextButton
    self.gotoNextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.gotoNextButton addTarget:self action:@selector(gotoNextOrRoot:) forControlEvents:UIControlEventTouchUpInside];
    if (self.canGotoNextScene) {
        [self.gotoNextButton setTitle:@"Next Scene" forState:UIControlStateNormal];
    }
    else {
        [self.gotoNextButton setTitle:@"Root Scene" forState:UIControlStateNormal];
    }
    
    self.gotoNextButton.frame = CGRectInset(frame, 50, 200);
    self.gotoNextButton.backgroundColor = [self randomColor];
    [self.view addSubview:self.gotoNextButton];
    
    /// switch
    CGRect switchFrame = CGRectMake(CGRectGetMidX(frame)+20,
                                    CGRectGetMaxY(self.gotoNextButton.frame) + 20,
                                    CGRectGetWidth(frame)/2.0,
                                    60);
    self.nextSceneSwitch = [[UISwitch alloc] initWithFrame:switchFrame];
    [self.nextSceneSwitch addTarget:self action:@selector(switchDidToggle:) forControlEvents:UIControlEventTouchUpInside];
    self.nextSceneSwitch.backgroundColor = [UIColor whiteColor];
    self.nextSceneSwitch.on = YES;
    [self.view addSubview:self.nextSceneSwitch];
    
    /// label
    CGRect labelFrame = switchFrame;
    labelFrame.origin.x = 0;
    labelFrame.size.height = 36;
    self.nextSceneLabel = [[UILabel alloc] initWithFrame:labelFrame];
    self.nextSceneLabel.numberOfLines = 1;
    self.nextSceneLabel.text = @"Next Scene is End   :";
    self.nextSceneLabel.textAlignment = NSTextAlignmentRight;
    self.nextSceneLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.nextSceneLabel];
    
    /// background color
    [self.view setBackgroundColor:[self randomColor]];
}

#pragma mark - Action Handlers
- (void)gotoNextOrRoot:(id)sender {
    if (self.canGotoNextScene) {
        TBDNextViewController *nextScene = [[TBDNextViewController alloc] initWithNextScene:self.nextSceneSwitch.isOn];
        [self.navigationController pushViewController:nextScene animated:YES];
    }
    else {
        /// goto the Root ViewController.
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
}

- (void)switchDidToggle:(id)sender {
    if (self.nextSceneSwitch.on) {
        /// Next Scene can goto another next scene.
    }
    else {
        /// Next Scene is the end of `view controller`.
    }
    
    NSLog(@"The Value of Switch: %@", @(self.nextSceneSwitch.isOn));
}

#pragma mark - Random Color
- (UIColor *)randomColor {
    CGFloat red = (arc4random() % 256) / 255.0;
    CGFloat green = (arc4random() % 256) / 255.0;
    CGFloat blue = (arc4random() % 256) / 255.0;
    
    UIColor *color = [UIColor colorWithRed:red
                                     green:green
                                      blue:blue
                                     alpha:0.9];
    return color;
}

@end
