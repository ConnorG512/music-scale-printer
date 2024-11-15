const mbase = @import("music_scale_common.zig");
const std = @import("std");
const scale_seven = @import("music_scale_seven_interval.zig");

pub const MusicScaleMajor = struct {
    common_scale: mbase.MusicScaleCommon,
    seven_int_scale: scale_seven.scale_seven_interval,

    notes_in_key: []u8,

    pub fn printInfo(self: *MusicScaleMajor) void {
        std.debug.print("{s} {s}:\n", .{self.common_scale.scale_tonic_note, self.common_scale.scale_name});
        self.common_scale.storeCorrectChromaticScale();
        self.seven_int_scale.setScaleInterval();
        self.calculateKey();
        self.calculateChords();
    }

    fn calculateKey (self: *MusicScaleMajor) void {
        var index: u8 = self.seven_int_scale.interval_offset;
        var roman_numeral_index: u8 = 1;

        for (self.seven_int_scale.scale_interval) |interval| {
            // index will wrap around 
            index %= @intCast(self.common_scale.chromatic_scale.len);
            var note = self.common_scale.chromatic_scale[index];

            // In certain major keys such as C# and F#, E# note needs to be substituted for F
            if (self.common_scale.NoteType == .note_type_sharp and self.seven_int_scale.interval_offset == 6 or self.seven_int_scale.interval_offset == 1) {
                if (std.mem.eql(u8, note, "F")) {
                    note = "E#";
                }
            }

            switch (roman_numeral_index) {
                1 => std.debug.print("I:", .{}),
                2 => std.debug.print(" II:", .{}),
                3 => std.debug.print(" III:", .{}),
                4 => std.debug.print(" IV:", .{}),
                5 => std.debug.print(" V:", .{}),
                6 => std.debug.print(" VI:", .{}),
                7 => std.debug.print(" VII:", .{}),
                else => std.debug.print("Indexing error!", .{}),
            }

            std.debug.print("{s},", .{note});
            index += interval;
            roman_numeral_index += 1;
        }
        // Print empty line
        std.debug.print("\n", .{});
    }

    fn calculateChords (_: *MusicScaleMajor) void {
        const harmonic_functions:[7][]const u8 = .{
            "I: Major (Tonic)", "II: Minor (Sub-Dominant)", "III: Minor (Tonic)", "IV: Major: (Sub-Dominant)",
            "V: Major (Dominant)", "VI: Minor (Tonic)", "VII: Diminished (Dominant)",
            };
        // var index: u8 = 0;

        for (harmonic_functions) |value| {
            std.debug.print("{s}\n", .{value});
        }

        std.debug.print("\n", .{});
    }

};

// Instances
pub var c_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "C",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 0,
        .ScaleType = .scale_type_major,
    },
    .notes_in_key = undefined,
};

pub var cs_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "C#",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 1,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var d_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "D",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 2,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var ef_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "Eb",
        .scale_name = "Major",
        .NoteType = .note_type_flat,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 3,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var e_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "E",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 4,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var f_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "F",
        .scale_name = "Major",
        .NoteType = .note_type_flat,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 5,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var fs_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "F#",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 6,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var g_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "G",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 7,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var ab_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "Ab",
        .scale_name = "Major",
        .NoteType = .note_type_flat,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 8,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var a_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "A",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 9,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var bb_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "Bb",
        .scale_name = "Major",
        .NoteType = .note_type_flat,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 10,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};

pub var b_major = MusicScaleMajor {
    .common_scale = .{
        .chromatic_scale = undefined,
        .scale_tonic_note = "B",
        .scale_name = "Major",
        .NoteType = .note_type_sharp,
    },
    .seven_int_scale = .{
        .scale_interval = undefined,
        .interval_offset = 11,
        .ScaleType = .scale_type_major
    },
    .notes_in_key = undefined,
};