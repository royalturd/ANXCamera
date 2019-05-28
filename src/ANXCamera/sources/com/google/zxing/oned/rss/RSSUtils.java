package com.google.zxing.oned.rss;

public final class RSSUtils {
    private RSSUtils() {
    }

    public static int getRSSvalue(int[] widths, int maxWidth, boolean noNarrow) {
        int elements = widths.length;
        int n = 0;
        for (int width : widths) {
            n += width;
        }
        int val = 0;
        int narrowMask = 0;
        int bar = 0;
        int n2 = n;
        while (bar < elements - 1) {
            int elmWidth = 1;
            narrowMask |= 1 << bar;
            while (elmWidth < widths[bar]) {
                int subVal = combins((n2 - elmWidth) - 1, (elements - bar) - 2);
                if (noNarrow && narrowMask == 0 && (n2 - elmWidth) - ((elements - bar) - 1) >= (elements - bar) - 1) {
                    subVal -= combins((n2 - elmWidth) - (elements - bar), (elements - bar) - 2);
                }
                if ((elements - bar) - 1 > 1) {
                    int lessVal = 0;
                    for (int mxwElement = (n2 - elmWidth) - ((elements - bar) - 2); mxwElement > maxWidth; mxwElement--) {
                        lessVal += combins(((n2 - elmWidth) - mxwElement) - 1, (elements - bar) - 3);
                    }
                    subVal -= ((elements - 1) - bar) * lessVal;
                } else if (n2 - elmWidth > maxWidth) {
                    subVal--;
                }
                val += subVal;
                elmWidth++;
                narrowMask &= ~(1 << bar);
            }
            n2 -= elmWidth;
            bar++;
        }
        return val;
    }

    private static int combins(int n, int r) {
        int maxDenom;
        int minDenom;
        if (n - r > r) {
            minDenom = r;
            maxDenom = n - r;
        } else {
            minDenom = n - r;
            maxDenom = r;
        }
        int val = 1;
        int j = 1;
        for (int i = n; i > maxDenom; i--) {
            val *= i;
            if (j <= minDenom) {
                val /= j;
                j++;
            }
        }
        while (j <= minDenom) {
            val /= j;
            j++;
        }
        return val;
    }
}
