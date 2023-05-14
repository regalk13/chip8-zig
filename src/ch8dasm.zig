const std = @import("std");
const os = std.os;

fn read_rom() !void {
    var allocator = std.heap.page_allocator;
    var file = try std.fs.cwd().openFile("test.ch8", .{});
    defer file.close();
    const file_buffer = try file.readToEndAlloc(allocator, (try file.stat()).size);
    for (file_buffer) |line| {
        std.debug.print("Read {} bytes into buffer\n", .{line});
    }
}

pub fn dissamble() !void {
    try read_rom();
}
