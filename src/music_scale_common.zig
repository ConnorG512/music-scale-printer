const std = @import("std");

pub const MusicScaleCommon = struct {
    scale_tonic_note: []const u8,
    scale_name: []const u8,
    chromatic_scale: [12][]const u8,

    // Use sharp unless the tonic note is specifically a flat tonic
    NoteType: enum {
        note_type_flat,
        note_type_sharp,
    },

    // Methods
    pub fn storeCorrectChromaticScale (self: *MusicScaleCommon) void {
        var chromatic_scale:[12][]const u8 = .{"None","None","None","None","None","None","None","None","None","None","None","None"}; // lol
        
        switch (self.NoteType) {
            .note_type_flat => {
                chromatic_scale = .{
                    "C", "Db", "D", "Eb", "E", "F",
                    "Gb", "G", "Ab", "A", "Bb", "B",
                };
            },
            .note_type_sharp => {
                chromatic_scale = .{
                    "C", "C#", "D", "D#", "E", "F",
                    "F#", "G", "G#", "A", "A#", "B",
                };
            },
        }

        self.chromatic_scale = chromatic_scale;
    }
};
