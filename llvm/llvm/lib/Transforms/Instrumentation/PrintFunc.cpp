#include "llvm/Transforms/Instrumentation/PrintFunc.h"

namespace llvm {

PreservedAnalyses PrintFuncPass::run(Module& M, ModuleAnalysisManager& AM) {
  LLVMContext& C = M.getContext();
  IntegerType* Int32Ty = IntegerType::getInt32Ty(C);
  PointerType* Ptr8Ty = PointerType::getInt8PtrTy(C); 
  

  for (auto &F: M) {
    if (F.isDeclaration()) {
      continue;
    }
    BasicBlock& BB = F.getEntryBlock();
    Instruction* FirstI = BB.getFirstNonPHI();
    IRBuilder<> IRB(FirstI);
    std::string s = "[LLVM TRACE] ";
    s += F.getName().str();
    Value* FuncName = IRB.CreateGlobalStringPtr(s);
    FunctionCallee PutsFunc = M.getOrInsertFunction("puts", FunctionType::get(Int32Ty, {Ptr8Ty}));
    IRB.CreateCall(PutsFunc, {FuncName});
  }
  return PreservedAnalyses::all();
}

} // namespace llvm
