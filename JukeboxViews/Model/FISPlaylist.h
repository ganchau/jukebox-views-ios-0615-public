//
//  FISPlaylist.h
//  JukeboxViews
//
//  Created by Gan Chau on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISSong.h"

@interface FISPlaylist : NSObject

@property (nonatomic, strong) NSMutableArray *songs;

- (void)sortSongsByTitle;
- (void)sortSongsByArtist;
- (void)sortSongsByAlbum;
- (FISSong *)songAtPosition:(NSNumber *)position;



@end
