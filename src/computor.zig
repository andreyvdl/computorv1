const std = @import("std");
const Io = std.Io;
const Allocator = std.mem.Allocator;

pub const ComputorError = error{
    FailedToAllocate,
    WrongNumberOfArguments,
};

// pub fn computate(arg: []const u8, io: Io, gpa: Allocator) !void {}

// ===== AUX =====
pub fn printArgsPattern() void {
    std.debug.print("Usage: ", .{});
    std.debug.print("zig build run -- ", .{});
    std.debug.print("\"up to second degree polynomial equation\"\n", .{});
}
