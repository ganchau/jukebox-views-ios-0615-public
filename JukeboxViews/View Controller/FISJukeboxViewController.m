//
//  FISJukeboxViewController.m
//  JukeboxViews
//
//  Created by Gan Chau on 6/11/15.
//  Copyright (c) 2015 FIS. All rights reserved.
//

#import "FISJukeboxViewController.h"
#import "FISSong.h"
#import "FISPlaylist.h"

@interface FISJukeboxViewController ()
@property (weak, nonatomic) IBOutlet UITextView *playlistTextView;
@property (nonatomic, strong) FISPlaylist *playlist;
@property (weak, nonatomic) IBOutlet UITextField *songNumberTextField;

@end

@implementation FISJukeboxViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    FISSong *song1 = [[FISSong alloc] initWithTitle:@"Hold on be Strong/Big Poppa" artist:@"Tupac & The Notorious B.I.G." album:@"Matoma Remix" andFileName:@"hold_on_be_strong"];
    FISSong *song2 = [[FISSong alloc] initWithTitle:@"Higher Love" artist: @"Steve Winwood" album:@"Back in the High Life" andFileName:@"higher_love"];
    FISSong *song3 = [[FISSong alloc] initWithTitle:@"Mo Money Mo Problems" artist:@"The Notorious B.I.G., Sean Combs, Mase" album:@"Life After Death" andFileName:@"mo_money_mo_problems"];
    FISSong *song4 = [[FISSong alloc] initWithTitle:@"Old Thing Back" artist:@"The Notorious B.I.G. & Ja Rule" album:@"Matoma Remix" andFileName:@"old_thing_back"];
    FISSong *song5 = [[FISSong alloc] initWithTitle:@"Gangsta Bleeding Luv" artist:@"Snoop Dogg & Leona Lewis" album:@"Matoma Remix" andFileName:@"gangsta_bleeding_love"];
    FISSong *song6 = [[FISSong alloc] initWithTitle:@"Bailando" artist:@"Enrique Iglesias & Sean Paul" album:@"Sex and Love" andFileName:@"bailando"];
    
    
    self.playlist = [[FISPlaylist alloc] init];
    self.playlist.songs = [@[song1, song2, song3, song4, song5, song6] mutableCopy];
    
    
    [self updateUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateUI
{
    self.playlistTextView.text = [self.playlist description];
}

- (IBAction)playButtonPressed:(id)sender
{
    [self.songNumberTextField endEditing:YES];
    
    NSUInteger i = [self.songNumberTextField.text integerValue];
    
    if (i > 0 && i <= self.playlist.songs.count) {
        FISSong *songToPlay = self.playlist.songs[i-1];
        
        [self setupAVAudioPlayWithFileName:songToPlay.fileName];
        
        [self.audioPlayer play];
    } else {
        self.songNumberTextField.text = @"";
    }
}

- (IBAction)stopButtonPressed:(id)sender
{
    [self.audioPlayer stop];
    [self.songNumberTextField endEditing:YES];
    NSUInteger i = [self.songNumberTextField.text integerValue];
    
    if (i <= 0 || i > self.playlist.songs.count) {
        self.songNumberTextField.text = @"";
    }
}

- (IBAction)sortByTitleButtonPressed:(id)sender
{
    [self.playlist sortSongsByTitle];
    [self updateUI];
}

- (IBAction)sortByArtistButtonPressed:(id)sender
{
    [self.playlist sortSongsByArtist];
    [self updateUI];
}

- (IBAction)sortByAlbumButtonPressed:(id)sender
{
    [self.playlist sortSongsByAlbum];
    [self updateUI];
}

- (void)setupAVAudioPlayWithFileName:(NSString *)fileName
{
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"mp3"]];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc]
                        initWithContentsOfURL:url
                        error:&error];
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        [self.audioPlayer prepareToPlay];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
