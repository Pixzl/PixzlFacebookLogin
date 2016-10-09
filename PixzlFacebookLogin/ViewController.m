//
//  ViewController.m
//  PixzlFacebookLogin
//
//  Created by Pixzl on 13.11.1968.
//  Copyright © 2016 Pixzl. All rights reserved.
//
//  Website: http://www.pixzl.de
//  Twitter: http://www.twitter.com/PixzlDE
//  Facebook: http://www.facebook.com/PIXZL
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    loginButton.delegate = self;
    [self.view addSubview:loginButton];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    [self parseAccountDetails];
}


- (void)parseAccountDetails
{
    if ([FBSDKAccessToken currentAccessToken])
    {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture.type(large), name, email"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
         {
             if (!error)
             {
                 NSLog(@"fetched user:%@", result);
                 NSMutableDictionary* data=[[NSMutableDictionary alloc]init];
                 data = result;
                 
                 self.usernameLabel.text = [data valueForKey:@"name"];
                 
                 NSDictionary *dictionary = (NSDictionary *)result;
                 NSDictionary *data3 = [dictionary objectForKey:@"picture"];
                 NSDictionary *data2 = [data3 objectForKey:@"data"];
                 NSString *photoUrl = (NSString *)[data2 objectForKey:@"url"];
                 
                 NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:photoUrl]];
                 self.accountImage.image = [UIImage imageWithData:imageData];
                 self.accountImage.layer.cornerRadius = self.accountImage.frame.size.width / 2;
                 self.accountImage.clipsToBounds = YES;
                 self.helloLabel.text = @"Hallo";
                 NSLog(@"Photo : %@",photoUrl);
             }
         }];
    }
}


- (void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error
{
    
}


- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton
{
    
}


@end
