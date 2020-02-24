/*
 * Copyright (C) 2020 Roger Ortiz
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */


#include <string.h>
#include <log/log.h>

#define DEST_SIZE 1024

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

  /* Start va before vsnprintf */
  // vsnprintf(s, 0x400, 0, 0x400);

  return __android_log_write(ANDROID_LOG_DEBUG, tag, log);

}
