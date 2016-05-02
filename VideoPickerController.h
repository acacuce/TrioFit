//
//  VideoPickerController.h
//  TrioFit
//
//  Created by Gulia_Is on 28.04.16.
//  Copyright © 2016 Наталья. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VideoPickerController;

@protocol VideoPickerControllerDelegate <NSObject>
@optional
- (void) videoPickerController:(VideoPickerController *)videoPickerController didSelectVideoWithIdentifier:(NSString *)videoIdentifier;
@end

@interface VideoPickerController : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, copy) NSArray *videos;

@property (nonatomic, weak) IBOutlet id<VideoPickerControllerDelegate> delegate;

@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;

- (IBAction) togglePickerView:(id)sender;
- (IBAction) showPickerView:(id)sender;
- (IBAction) hidePickerView:(id)sender;

@end
