const std = @import("std");
const os = std.os;

fn read_rom() !void {
    var allocator = std.heap.page_allocator;
    var file = try std.fs.cwd().openFile("test.asm", .{});
    defer file.close();
    const file_buffer = try file.readToEndAlloc(allocator, (try file.stat()).size);

    var iter = std.mem.split(u8, file_buffer, "\n");

    var count: usize = 0;
    while (iter.next()) |line| : (count += 1) {
        std.log.info("{d:>2}: {s}", .{ count, line });
    }
}

pub fn dissamble() !void {
    try read_rom();
}
