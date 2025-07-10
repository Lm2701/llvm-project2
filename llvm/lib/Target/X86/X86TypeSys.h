// X86TypeSys.h

#ifndef LLVM_LIB_TARGET_X86_X86TYPESYS_H
#define LLVM_LIB_TARGET_X86_X86TYPESYS_H

#include "llvm/IR/Value.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include <map>
#include <string>

namespace llvm {

enum security_type { L, H };

struct type_sys {
    security_type type_ns;
    security_type type_s;
};

type_sys unify_typs(type_sys t1, type_sys t2);

std::map<std::string, type_sys> unify_maps(std::map<std::string, type_sys> m1, std::map<std::string, type_sys> m2);

type_sys get_type_operand(const llvm::Value &v, std::map<std::string, type_sys> &gamma);

std::map<std::string, type_sys> get_gamma_instruction(const llvm::Instruction &I, std::map<std::string, type_sys> &gamma);

std::map<std::string, type_sys> get_gamma_block(const llvm::BasicBlock &BB, std::map<std::string, type_sys> &gamma);

std::map<std::string, type_sys> get_gamma_fun(const llvm::Function &F, std::map<std::string, type_sys> &gamma);

std::map<std::string, type_sys> get_gamma_module(const llvm::Module &M);

} // namespace llvm

#endif // LLVM_LIB_TARGET_X86_X86TYPESYS_H