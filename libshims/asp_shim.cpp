#include <string.h>
#include <log/log.h>

#define DEST_SIZE 1024

extern "C"
{
    int __metrics_log_print(int bufID, int prio, const char *tag, const char *log, ...)
    {
        va_list ap;

        int _a = bufID;
        int _b = prio;

        char dest[DEST_SIZE];
        char dest2[DEST_SIZE];
        char s[DEST_SIZE];

        snprintf(dest, 0x400, 0 ,0x400);
        snprintf(dest2, 0x400, 0, 0x400);

        va_start(ap, log);
        vsnprintf(s, DEST_SIZE, log, ap);
        va_end(ap);

        return __android_log_write(ANDROID_LOG_DEBUG, tag, log);
    }
}
