#include <linux/module.h>
#include <linux/kallsyms.h>
//#include "ptr.h"

MODULE_LICENSE("GPL");
MODULE_AUTHOR("k4y0z");

unsigned int* _selinux_enforcing = NULL;

unsigned int* find_selinux_enforcing(void){
  char *sym_sel_read_enforce = (char *)kallsyms_lookup_name("sel_read_enforce");
  int i=0;
  uint32_t selinux_temp = 0;
  const char asm_sub[] = { 0x18, 0xD0, 0x4D, 0xE2 };
  for (i =0; i < 128; i++){
    //printk("0x%X ", sym_sel_read_enforce[i]);
    if(memcmp(&sym_sel_read_enforce[i], asm_sub, 4) == 0){
      selinux_temp = *(unsigned int*)&sym_sel_read_enforce[i+12] & 0x000FFFFF;
      selinux_temp = ((selinux_temp >> 4) & 0x0000F000) | (selinux_temp & (0x00000FFF));
      selinux_temp |= (((*(unsigned int*)&(sym_sel_read_enforce[i+16])) << 16) & 0xFFFF0000);
      return (unsigned int*)selinux_temp;
    }
  }
}

static int __init selinux_module_init(void){
  _selinux_enforcing = find_selinux_enforcing();
  if(_selinux_enforcing){
    printk("[k4y0z]: found selinux_enforcing at %p\n", _selinux_enforcing);
    printk("[k4y0z]: set selinux to permissive\n");
    *_selinux_enforcing = 0;
  }
  else{
    printk("[k4y0z]: didn't find selinux_enforcing\n");
  }
  
  return 0;
}
module_init(selinux_module_init)

