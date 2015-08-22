//
//  PinView.m
//  HSE Day
//
//  Created by Anton Scherbakov on 20/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

#import "PinView.h"
#import "HSE_Day-Swift.h"

@implementation PinView
 
 -(instancetype)initWithDict:(NSDictionary*)dict {
 NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"PinView" owner:self options:nil];
 
 if (array.count > 0) {
 self = array[0];
 }
 
 self.data = dict;
 
 UIImage *mainPinImage;
 
 //mainPinImage = [UIImage imageNamed:@"cloudPin.png"];

 NSNumber *x = dict[@"X"];
 NSNumber *y = dict[@"Y"];
     
     _mainPin.tag = dict[@"number"];
     
     self.frame = CGRectMake(x.intValue - 16, y.intValue - 32, 32, 32);
 
 //[self.mainPin setImage:mainPinImage forState:UIControlStateNormal];
 
 if (dict[@"image"] != nil && ![dict[@"image"] isEqualToString:@""]) {
 NSString *imageName = dict[@"image"];
 [_mainImage setImage:[UIImage imageNamed:imageName]];
 }
 
 return self;
 }
 
 -(void)awakeFromNib {
 
 }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


    
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    ViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"1"];
//    [vc goToPin];
  
    //[vc.view.window.rootViewController goToPin:1];
    
    
    //[vc performSegueWithIdentifier:@"toQuest" sender:self];


@end

