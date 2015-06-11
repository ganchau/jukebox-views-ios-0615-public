//
//  FISJukeboxViewController.h
//  JukeboxViews
//
//  Created by Gan Chau on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface FISJukeboxViewController : UIViewController
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName;

@end
