const std = @import("std");
const mscale= @import("music_scale_major.zig");

pub fn main() !void {

}

test "simple test" {
    mscale.c_major.printInfo();
    mscale.g_major.printInfo();
    mscale.d_major.printInfo();
    mscale.a_major.printInfo();
    mscale.e_major.printInfo();
    mscale.b_major.printInfo();
    mscale.fs_major.printInfo();
    mscale.cs_major.printInfo();
    mscale.f_major.printInfo();
    mscale.bb_major.printInfo();
    mscale.ef_major.printInfo();
    mscale.ab_major.printInfo(); 
}