pub const scale_seven_interval = struct {
    ScaleType: enum {
        scale_type_major,
        scale_type_nat_minor,
    },
    scale_interval: [7] u8,
    interval_offset: u8,

    pub fn setScaleInterval (self: *scale_seven_interval) void {
        switch (self.ScaleType) {
            .scale_type_major => {
                self.scale_interval = .{2,2,1,2,2,2,1};
            },
            .scale_type_nat_minor => {
                self.scale_interval = .{2,1,2,2,1,2,2};
            },
        }
    }
};