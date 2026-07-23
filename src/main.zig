const std = @import("std");
const Io = std.Io;

const computor = @import("computor.zig");
const ComputorError = computor.ComputorError;

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;
    const args = init.minimal.args.toSlice(allocator) catch
        return ComputorError.FailedToAllocate;
    defer allocator.free(args);

    if (args.len != 2) {
        computor.printArgsPattern();
        return ComputorError.WrongNumberOfArguments;
    }

    // computor.computate(args[1], init.io, allocator);
    std.debug.print("OK\n", .{});
}
