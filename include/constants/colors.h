#ifndef POKEPLATINUM_CONSTANTS_COLORS_H
#define POKEPLATINUM_CONSTANTS_COLORS_H

#define ColorR(source) ((source) & 0x1F)
#define ColorG(source) (((source) >> 5) & 0x1F)
#define ColorB(source) (((source) >> 10) & 0x1F)
#define RGB(r, g, b)   (((b) << 10) | ((g) << 5) | (r))

#define COLOR_BLACK       RGB(0, 0, 0)
#define COLOR_DARK_GRAY   RGB(4, 4, 4)
#define COLOR_WHITE       RGB(31, 31, 31)
#define COLOR_TRANSPARENT RGB(31, 31, 16)
#define COLOR_SAVED       0xFFFF

#endif // POKEPLATINUM_CONSTANTS_COLORS_H
