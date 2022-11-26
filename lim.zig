const std = @import("std");
const print = std.debug.print;

const Country = struct {
    name: []const u8,
    population: i32,
};

const countries = [_]Country {
    .{ .name = "China", .population = 1_412_600_000 },
    .{ .name = "India", .population = 1_375_586_000 },
    .{ .name = "United States", .population = 333_299_945 },
    .{ .name = "Indonesia", .population = 275_773_800 },
    .{ .name = "Pakistan", .population = 235_825_000 },
    .{ .name = "Nigeria", .population = 218_541_000 },
    .{ .name = "Brazil", .population = 215_424_390 },
    .{ .name = "Bangladesh", .population = 165_158_616 },
    .{ .name = "Russia", .population = 145_100_000 },
    .{ .name = "Mexico", .population = 128_533_664 },
};

pub fn main() void {
    // also interesting because arbitrary sizes
    var total: i32 = 0;
    for (countries) |country| {
        print("{s} {}\n", .{country.name, fmtIntSep(country.population)});
        total += country.population;
    }
    print("total {}\n", .{fmtIntSep(total)});
}

fn fmtIntSep(n: anytype) FmtIntSep {
    return .{
        .n = std.math.absCast(n),
        .negative = n < 0,
    };
}

const FmtIntSep = struct {
    n: u128,
    negative: bool,

    pub fn format(
        self: FmtIntSep,
        comptime fmt_str: []const u8,
        options: std.fmt.FormatOptions,
        writer: anytype,
    ) !void {
        _ = fmt_str;
        _ = options;
        // Count digits
        var x = self.n;
        var exp: @TypeOf(self.n) = 1;
        var digits: std.math.Log2Int(@TypeOf(self.n)) = 0;
        while (x > 0) {
            x /= 10;
            exp *= 10;
            digits += 1;
        }
        // Print integer
        if (digits == 0) {
            return writer.writeAll("0");
        }
        if (self.negative) {
            try writer.writeByte('-');
        }
        while (digits > 0) {
            exp /= 10;
            digits -= 1;
            try writer.writeByte('0' + @intCast(u8, self.n / exp % 10));
            if (digits > 0 and digits % 3 == 0) {
                try writer.writeByte(',');
            }
        }
    }
};
