//
//  FISPlaylist.m
//  JukeboxViews
//
//  Created by Gan Chau on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISPlaylist.h"

@implementation FISPlaylist

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _songs = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)sortSongsByTitle
{
    NSSortDescriptor *sortByTitle = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSSortDescriptor *sortByArtist = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSArray *sortedArray = [[self.songs copy] sortedArrayUsingDescriptors:@[sortByTitle, sortByArtist]];
    self.songs = [sortedArray mutableCopy];
}

- (void)sortSongsByArtist
{
    NSSortDescriptor *sortByArtist = [NSSortDescriptor sortDescriptorWithKey:@"artist" ascending:YES];
    NSSortDescriptor *sortByAlbum = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortByTitle = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *sortedArray = [[self.songs copy] sortedArrayUsingDescriptors:@[sortByArtist, sortByAlbum, sortByTitle]];
    self.songs = [sortedArray mutableCopy];
}

- (void)sortSongsByAlbum
{
    NSSortDescriptor *sortByAlbum = [NSSortDescriptor sortDescriptorWithKey:@"album" ascending:YES];
    NSSortDescriptor *sortByTitle = [NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES];
    NSArray *sortedArray = [[self.songs copy] sortedArrayUsingDescriptors:@[sortByAlbum, sortByTitle]];
    self.songs = [sortedArray mutableCopy];

}

- (FISSong *)songAtPosition:(NSNumber *)position
{
    if ([position integerValue] <= self.songs.count && [position integerValue] > 0) {
        NSUInteger index = [position integerValue] - 1;
        return self.songs[index];
    }
    return nil;
}

- (NSString *)description
{
    //@"1. Title: Dancing in the Moonlight Artist: Thin Lizzy Album: Bad Reputation\n2. Title: Dancing in the Moonlight Artist: King Harvest Album: Dancing in the Moonlight\n3. Title: Jailbreak Artist: Thin Lizzy Album: Jailbreak\n4. Title: Cowboy Song Artist: Thin Lizzy Album: Jailbreak\n"
    
    NSString *playlist = @"";
    for (NSUInteger i = 0; i < self.songs.count; i++) {
        FISSong *song = self.songs[i];
        NSString *songDescription = [NSString stringWithFormat:@"%lu. Title: %@ Artist: %@ Album: %@\n", i+1, song.title, song.artist, song.album];
        playlist = [playlist stringByAppendingString:songDescription];
    }

    return playlist;
}

@end
