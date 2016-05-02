//
//  NameOfExcerciseViewController.m
//  TrioFit
//
//  Created by Наталья on 20.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import "NameOfExcerciseViewController.h"
#import "ExcerciseTableViewController.h"
#import <XCDYouTubeKit/XCDYouTubeKit.h>




@interface NameOfExcerciseViewController () <MPMediaPlayback>

@end

@implementation NameOfExcerciseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = _nameOfExcercise;
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
    
    XCDYouTubeVideoPlayerViewController *videoPlayerViewController =[[XCDYouTubeVideoPlayerViewController alloc] initWithVideoIdentifier:self.youtubeIdentifierString];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayerPlaybackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:videoPlayerViewController.moviePlayer];
    
    [self presentViewController:videoPlayerViewController animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Notifications

- (void) moviePlayerPlaybackDidFinish:(NSNotification *)notification
{
   
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:notification.object];
    
    MPMovieFinishReason finishReason = [notification.userInfo[MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] integerValue];
    
    if (finishReason == MPMovieFinishReasonPlaybackError)
    {
        NSString *title = NSLocalizedString(@"Video Playback Error", @"Full screen video error alert - title");
        NSError *error = notification.userInfo[XCDMoviePlayerPlaybackDidFinishErrorUserInfoKey];
        NSString *message = [NSString stringWithFormat:@"%@\n%@ (%@)", error.localizedDescription, error.domain, @(error.code)];
        NSString *cancelButtonTitle = NSLocalizedString(@"OK", @"Full screen video error alert - cancel button");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
        [alertView show];
    }
}

@end
