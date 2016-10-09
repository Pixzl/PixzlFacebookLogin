//
//  ViewController.h
//  PixzlFacebookLogin
//
//  Created by Pixzl on 13.11.1968.
//  Copyright © 2016 Pixzl. All rights reserved.
//
//  Website: http://www.pixzl.de
//  Twitter: http://www.twitter.com/PixzlDE
//  Facebook: http://www.facebook.com/PIXZL
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController : UIViewController <FBSDKLoginButtonDelegate>

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *helloLabel;
@property (weak, nonatomic) IBOutlet UIImageView *accountImage;

@end

