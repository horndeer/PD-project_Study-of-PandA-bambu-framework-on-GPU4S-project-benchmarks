// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header

#ifndef _Vicrc_tb__Syms_H_
#define _Vicrc_tb__Syms_H_

#include "verilated_heavy.h"

// INCLUDE MODULE CLASSES
#include "Vicrc_tb.h"

// SYMS CLASS
class Vicrc_tb__Syms : public VerilatedSyms {
  public:
    
    // LOCAL STATE
    const char* __Vm_namep;
    bool __Vm_didInit;
    
    // SUBCELL STATE
    Vicrc_tb*                      TOPp;
    
    // CREATORS
    Vicrc_tb__Syms(Vicrc_tb* topp, const char* namep);
    ~Vicrc_tb__Syms() {}
    
    // METHODS
    inline const char* name() { return __Vm_namep; }
    
} VL_ATTR_ALIGNED(64);

#endif // guard
