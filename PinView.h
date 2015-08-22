//
//  PinView.h
//  HSE Day
//
//  Created by Anton Scherbakov on 20/08/15.
//  Copyright (c) 2015 StyleRU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PinView : UIButton

@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property (weak, nonatomic) IBOutlet UIButton *mainPin;
@property (nonatomic) NSInteger *number;

@property (nonatomic, strong) NSDictionary *data;

-(instancetype)initWithDict:(NSDictionary*)dict;

@end

