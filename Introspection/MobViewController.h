//
//  MobViewController.h
//  Introspection
//
//  Created by Peter Foti on 9/16/13.
//  Copyright (c) 2013 Peter Foti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MobViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UITextField *classTextField;


-(void)gotSwipe:(id)sender;
-(void)singleTape:(id)sender;
@end
