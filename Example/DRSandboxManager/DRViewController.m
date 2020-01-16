//
//  DRViewController.m
//  DRSandboxManager
//
//  Created by Dean_F on 07/14/2019.
//  Copyright (c) 2019 Dean_F. All rights reserved.
//

#import "DRViewController.h"
#import <DRSandboxManager/DRSandBoxManager.h>

@interface DRViewController ()

@end

@implementation DRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (status == PHAuthorizationStatusAuthorized){
                UIImage *image = [UIImage imageNamed:@"修改点"];
                [DRSandBoxManager saveToSystemAlbumWithImage:image saveDoneBlock:^(BOOL success, NSError *error) {
                    if (error) {
                        NSLog(@"%@", error);
                    }
                }];
            } else {
                
            }
        });
    }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
