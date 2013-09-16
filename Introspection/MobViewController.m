//
//  MobViewController.m
//  Introspection
//
//  Created by Peter Foti on 9/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import "MobViewController.h"

@interface MobViewController ()
//@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *colors;
@property (nonatomic) CGFloat yPoint;

@end

@implementation MobViewController

-(NSArray *)colors
{
    if (!_colors) {
        _colors = @[[UIColor blueColor], [UIColor redColor], [UIColor blackColor]];
    }
    
    return _colors;
}

-(CGFloat)yPoint
{
    if (!_yPoint) {
        _yPoint = 20;
    }
    return _yPoint;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//    self.scrollView.contentSize = CGSizeMake(1000, 1000);
//    
//    [self.view addSubview:self.scrollView];
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    self.mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1000);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField endEditing:YES];
//    Class class = NSClassFromString(textField.text);
    id obj = [[NSClassFromString(textField.text) alloc] init];
    if ([[obj class] isSubclassOfClass:[UIView class]] && obj) {
        [obj setFrame:CGRectMake(20, self.yPoint, 250, 75)];
        [obj setBackgroundColor:[self.colors objectAtIndex:arc4random_uniform(self.colors.count)]];
        UISwipeGestureRecognizer *recongizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(gotSwipe:)];
        [recongizer setDirection:UISwipeGestureRecognizerDirectionLeft];
       [obj addGestureRecognizer:recongizer];
        UITapGestureRecognizer *tapRecog = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTape:)];
        tapRecog.delegate = self;
        [obj addGestureRecognizer:tapRecog];
        [self.mainScrollView addSubview:obj];
        self.yPoint += 100;
    } else {
        NSLog(@"not a subclass");
    }
//    NSLog(@"%@", NSClassFromString(textField.text));
    return YES;
    
}

-(void)gotSwipe:(id)sender
{
    NSLog(@"Swipe Left");
}

-(void)singleTape:(id)sender
{
    NSLog(@"Got single touch");
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
@end
