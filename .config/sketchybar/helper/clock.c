// based on: https://github.com/FelixKratz/SketchyBar/discussions/454
// changed into ISO8601 format, including tz

#include "sketchybar.h"
#include <CoreFoundation/CoreFoundation.h>
#include <time.h>

void callback(CFRunLoopTimerRef timer, void* info) {
  time_t current_time;
  time(&current_time);
  const char* format = "%Y-%m-%dT%H:%M:%S%z";
  char buffer[64];
  strftime(buffer, sizeof(buffer), format, localtime(&current_time));

  uint32_t message_size = sizeof(buffer) + 64;
  char message[message_size];
  snprintf(message, message_size, "--set time label=\"%s\"", buffer);
  sketchybar(message);
}

int main() {
  CFRunLoopTimerRef timer = CFRunLoopTimerCreate(kCFAllocatorDefault, (int64_t)CFAbsoluteTimeGetCurrent() + 1.0, 1.0, 0, 0, callback, NULL);
  CFRunLoopAddTimer(CFRunLoopGetMain(), timer, kCFRunLoopDefaultMode);
  sketchybar("--add item time right");
  CFRunLoopRun();
  return 0;
}
